package com.goody.diet.exercise;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExerciseDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NANMESPACE = "com.goody.diet.exercise.ExerciseDAO.";
	
	public List<ExerciseDTO> getExerciseList () throws Exception{
		return sqlSession.selectList(NANMESPACE+"getExerciseList");
		
	}
	
	

}
