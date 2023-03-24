package com.goody.diet.exercise;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
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
	
	public List<HealthMachineDTO> getExerciseMachine () throws Exception {
		return sqlSession.selectList(NAMESPACE+"getExerciseMachine");
	}
	
	public int setExerciseAdd(ExerciseDTO exerciseDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setExerciseAdd", exerciseDTO);
	}
	public int setExerciseImg(BoardFileDTO boardFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setExerciseImg", boardFileDTO);
	}

	public ExerciseDTO getExerciseVideo(ExerciseDTO exerciseDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getExerciseVideo", exerciseDTO);
	}
	
	public ExerciseDTO getExerciseBody(ExerciseDTO exerciseDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getExerciseBody",exerciseDTO);
		
	}
	
	
}
