package com.goody.diet.exercise;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.board.BoardFileDTO;

@Repository
public class ExerciseDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.goody.diet.exercise.ExerciseDAO.";
	
	public List<ExerciseDTO> getExerciseList(ExerciseDTO exerciseDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getExerciseList");
	}
	
	public List<ExerciseDTO> getExerciseTypeList(ExerciseDTO exerciseDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getExerciseTypeList",exerciseDTO);
	}
	//List - 짧강효확 첫 화면 부위별 리스트 
	public List<BodyDTO> getBodyList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getBodyList");
	}
	
	public List<BodyDTO> getBodyDetail(ExerciseDTO exerciseDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getBodyDetail", exerciseDTO);
	}
	
//	public ExerciseDTO getExerciseDetail(ExerciseDTO exerciseDTO) throws Exception{
//		return sqlSession.selectOne(NAMESPACE+"getExerciseDetail", exerciseDTO);
//	}
//	public ExerciseDTO getExerciseDetail(HealthMachineDTO healthMachineDTO) throws Exception{
//		ExerciseDTO exerciseDTO = new ExerciseDTO();
//		exerciseDTO.setMachineName(healthMachineDTO.getMachineName());
//		return sqlSession.selectOne(NAMESPACE+"getExerciseDetail", exerciseDTO);
//	}
//	
	
	public ExerciseDTO getExerciseDetail(ExerciseDTO exerciseDTO) {
		return sqlSession.selectOne(NAMESPACE+"getExerciseDetail", exerciseDTO);
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
		
		return null;
	}




	
}
