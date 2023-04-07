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
	

	//List - 짧강효확 첫 화면 부위별 리스트 
	public List<BodyDTO> getBodyList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getBodyList");
	}
	// detail - 상세페이지
	public ExerciseDTO getExerciseInfo() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getExerciseInfo");
	}
	public List<ExerciseDTO> getExerciseByBodyNum() {
		return sqlSession.selectList(NAMESPACE+"getExerciseByBodyNum");
	}

	// detail - 짧강효확 클릭한 부위별 리스트 
	public List<ExerciseDTO> getBodyDetailList(Long bodyNum) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getBodyDetailList", bodyNum);	
	}
	
	//add - 영상등록 (짧강효확) 
	public int setExerciseAdd(ExerciseDTO exerciseDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setExerciseAdd", exerciseDTO);
	}
	//add - file 등록 
	public int setExerciseImg(BoardFileDTO boardFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setExerciseImg", boardFileDTO);
	}
	
	public ExerciseDTO getExerciseVideo(ExerciseDTO exerciseDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
