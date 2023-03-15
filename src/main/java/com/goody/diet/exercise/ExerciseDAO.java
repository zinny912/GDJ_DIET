package com.goody.diet.exercise;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.util.Pager;

@Repository
public class ExerciseDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.exercise.ExerciseDAO.";
	
//	public Long getExerciseCount(Pager pager) throws Exception{
//		return sqlSession.selectOne(NANMESPACE+"getExerciseCount", pager);
//	}
//	
//	
	public List<ExerciseDTO> getExerciseList () throws Exception{
		return sqlSession.selectList(NAMESPACE+"getExerciseList");
		
	}
	
	public ExerciseDTO getExercisBody() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getExerciseBody");
	}
	

}
