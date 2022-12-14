package com.vidyalaya.hobby.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vidyalaya.hobby.entities.Enrollment;
import com.vidyalaya.hobby.entities.Skill;
import com.vidyalaya.hobby.entities.User;
import com.vidyalaya.hobby.repos.EnrollmentRepository;
import com.vidyalaya.hobby.repos.SkillRepository;
import com.vidyalaya.hobby.repos.UserRepository;
import com.vidyalaya.hobby.util.PaymentUtility;

@Service
public class EnrollServiceImpl implements EnrollService {

	@Autowired
	SkillRepository skillRepository;
	
	@Autowired
	EnrollmentRepository enrollmentRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	PaymentUtility paymentUtility;
	
	@Transactional
	@Override
	public boolean enroll(String paymentGateway, Long skillId, Long userId) {
		Skill skill = skillRepository.findById(skillId).get();
		long studentsSoFar = skill.getStudentsSoFar() + 1;
		skill.setStudentsSoFar(studentsSoFar);
		String paymentDetails = paymentUtility.doPayment(paymentGateway, skill.getFee());
		if(paymentDetails != null) {
			Enrollment enrollment = new Enrollment();
			enrollment.setSkillId(skill.getId());
			enrollment.setSkillName(skill.getName());
			enrollment.setUserId(userId);
			enrollment.setInstructorId(skill.getInstructorId());
			enrollment.setInstructorName(skill.getInstructorName());
			enrollment.setDateEnrolled(new Date());			
			enrollment.setPaymentDetails(paymentDetails);
			enrollment.setAcquired(false);
			enrollment.setIsRated(false);
			enrollmentRepository.save(enrollment);
			skillRepository.save(skill);
			return true;
		}
		return false;
	}
	
	public Long getInstructorId(Long enrollmentId) {
		Enrollment enrollment = enrollmentRepository.findById(enrollmentId).get();
		return enrollment.getInstructorId();
	}

	@Override
	public String fetchInstructorContact(Long enrollmentId) {
		Enrollment enrollment = enrollmentRepository.findById(enrollmentId).get();
		Long instructorId = enrollment.getInstructorId();
//		User instructor = userRepository.findById(instructorId).get();
		Optional<User> optionalUser = userRepository.findById(instructorId);
		if(optionalUser.isPresent()) {
			User instructor = optionalUser.get();
			String instructorEmail = instructor.getEmail();
			return instructorEmail;
		}
		else {
			return null;
		}
	}

	@Override
	public List<Enrollment> findAllEnrollmentsByUserId(Long userId) {
		return enrollmentRepository.findAllByUserId(userId);
	}

	@Override
	public Enrollment findEnrollmentById(Long enrollmentId) {
		return enrollmentRepository.findById(enrollmentId).get();
	}


}
