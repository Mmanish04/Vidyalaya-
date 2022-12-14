package com.vidyalaya.hobby.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.vidyalaya.hobby.entities.Skill;

public interface SkillRepository extends JpaRepository<Skill, Long> {

	@Query(value = "Select distinct s.name from skill s group by s.name order by s.students_so_far desc limit 5", nativeQuery = true)
	List<String> fetchTrendingSkills();

	List<Skill> findAllByName(String string);
	
	@Modifying
    @Query( value = "select s.name from skill s where s.name LIKE %:term%", nativeQuery = true)
    List<String> getSkillName(String term);
	
	@Query(value = "Select distinct s.name from skill s where s.instructor_id = ?1", nativeQuery = true)
	List<String> fetchMySkills(Long id);

	List<Skill> findAllByInstructorId(Long id);
}
