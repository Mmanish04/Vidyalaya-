package com.vidyalaya.hobby.services;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vidyalaya.hobby.entities.Enrollment;
import com.vidyalaya.hobby.entities.Skill;
import com.vidyalaya.hobby.entities.User;
import com.vidyalaya.hobby.repos.EnrollmentRepository;
import com.vidyalaya.hobby.repos.SkillRepository;
import com.vidyalaya.hobby.repos.UserRepository;

@Service
public class SkillServiceImpl implements SkillService {

	@Autowired
	SkillRepository skillRepository;

	@Autowired
	EnrollmentRepository enrollmentRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	ProfileService profileService;

	@Override
	public List<String> getSkillName(String term) {
		return skillRepository.getSkillName(term);
	}

	@Override
	public List<String> fetchMySkills(Long userId) {
		Set<String> skillSet = new HashSet<String>();
		List<String> mySkillsFromEnrollmentRepo = enrollmentRepository.fetchMySkills(userId);
		for (String se : mySkillsFromEnrollmentRepo)
			skillSet.add(se);
		List<String> mySkillsFromSkillRepo = skillRepository.fetchMySkills(userId);
		for (String ss : mySkillsFromSkillRepo)
			skillSet.add(ss);
		List<String> listOfSkills = new ArrayList<String>(skillSet);
		return listOfSkills;
	}

	@Override
	public Skill addCourse(String name, String description, Float fee, Long instructorId) {
		if(fee == null) {
			fee = 0.00f;
		}
		User instructor = userRepository.findById(instructorId).get();
		Skill skill = new Skill();
		skill.setName(name);
		skill.setDescription(description);
		skill.setInstructorId(instructor.getId());
		skill.setInstructorName(instructor.getFirstName() + " " + instructor.getLastName());
		skill.setFee(fee);
		skill.setRating(0.0f);
		skill.setStudentsSoFar(0L);
		skill.setUsersRated(0L);
		return skillRepository.save(skill);
	}

	@Override
	public Skill updateCourse(Skill course) {
		Skill updatedCourse = skillRepository.findById(course.getId()).get();
		updatedCourse.setName(course.getName());
		updatedCourse.setDescription(course.getDescription());
		updatedCourse.setFee(course.getFee());
		if(course.getFee() == null) {
			updatedCourse.setFee(0.00f);
		}
		return skillRepository.save(updatedCourse);
	}

	@Override
	public void rateCourse(Long ratingStars, Long skillId, Long enrollmentId) {
		Skill skill = skillRepository.findById(skillId).get();
		User user = profileService.fetchUser();
		Enrollment enrollment = enrollmentRepository.findById(enrollmentId).get();
		enrollment.setIsRated(true);
		enrollmentRepository.save(enrollment);
		Float rating = skill.getRating();
		rating = ((rating * skill.getUsersRated()) + ratingStars) / (skill.getUsersRated() + 1);
		skill.setRating(rating);
		skill.setUsersRated(skill.getUsersRated() + 1);
		skillRepository.save(skill);
	}

	@Override
	public List<String> fetchTrendingSkills() {
		return skillRepository.fetchTrendingSkills();
	}

	@Override
	public List<Skill> findAllSkillsByName(String skillName) {
		return skillRepository.findAllByName(skillName);
	}

	@Override
	public List<Skill> findAllSkillsByInstructorId(Long instructorId) {
		return skillRepository.findAllByInstructorId(instructorId);
	}

	@Override
	public Skill findSkillById(Long skillId) {	
		Optional<Skill> optionalSkill = skillRepository.findById(skillId);
		if(optionalSkill.isPresent()) {
			return skillRepository.findById(skillId).get();			
		}
		else {
			return null;
		}		
	}

	@Override
	public void deleteSkillById(Long skillId) {
		skillRepository.deleteById(skillId);
	}

}
