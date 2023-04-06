package com.goody.diet.exercise;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.healthMachine.CategoryDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.util.Pager;

@Repository
public class ExerciseDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.exercise.ExerciseDAO.";
	

	//List - 영상 리스트 
	public List<ExerciseDTO> getExerciseList () throws Exception{
		return sqlSession.selectList(NAMESPACE+"getExerciseList");	
	}
	//List - 부위별 리스트
	public List<ExerciseDTO> getExerciseBodyList(ExerciseRoleDTO exerciseRoleDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getExerciseBodyList",exerciseRoleDTO);
	}
	
	//List - 머신이름 리스트 
	public List<ExerciseDTO> getExerciseMachine () throws Exception {
		return sqlSession.selectList(NAMESPACE+"getExerciseMachine");
	}

	//add - 영상등록 (짧강효확) 
	public int setExerciseAdd(ExerciseDTO exerciseDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setExerciseAdd", exerciseDTO);
	}
	//add - file 등록 
	public int setExerciseImg(BoardFileDTO boardFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setExerciseImg", boardFileDTO);
	}
	
	// detail - 짧강효확 페이지 
	public List<ExerciseDTO> getExerciseBody() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getExerciseBody");
		
	}
	// detail - 상세페이지
	public ExerciseDTO getExerciseInfo() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getExerciseInfo");
	}
	public ExerciseDTO getExerciseVideo(ExerciseDTO exerciseDTO) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
