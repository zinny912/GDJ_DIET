package com.goody.diet.exercise;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.HealthMachineImgDTO;
import com.goody.diet.study.StudyDTO;

@Repository
public class ExerciseDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.goody.diet.exercise.ExerciseDAO.";
	
	public List<ExerciseDTO> getExerciseList(ExerciseDTO exerciseDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getExerciseList");
	}
	public List<HealthMachineDTO> getHealthMachineList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getHealthMachineList", NAMESPACE);
	}
	public ExerciseDTO getMachineName(ExerciseDTO exerciseDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMachineName", exerciseDTO);
	}
	//info 상세페이지 리스트 촤르르르륵
	public List<ExerciseDTO> getExerciseTypeList(BodyDTO bodyDTO) throws Exception{//ExerciseDTO X BodyDTO
		return sqlSession.selectList(NAMESPACE+"getExerciseTypeList",bodyDTO);
	}
	//List - 짧강효확 첫 화면 부위별 리스트 
	public List<BodyDTO> getBodyList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getBodyList");	
	}
	
	public List<BoardFileDTO> getExerciseFileList(ExerciseDTO exerciseDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getExerciseFileList", exerciseDTO);
	}
	
	//update용 bodyDTO 얻기
	public List<BodyDTO>getBodyDetail(ExerciseDTO exerciseDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getBodyDetail", exerciseDTO);
	}
	
	
	//짧강효확 비디오 재생 페이지 
	public ExerciseDTO getBodyVideo(ExerciseDTO exerciseDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getBodyVideo", exerciseDTO);
	}
	
	public List<ExerciseDTO> getExerciseMachine() throws Exception {
		return sqlSession.selectList(NAMESPACE+getExerciseMachine());
	}
	
//	public ExerciseDTO getExerciseDetail(HealthMachineDTO healthMachineDTO) throws Exception{
//		ExerciseDTO exerciseDTO = new ExerciseDTO();
//		exerciseDTO.setMachineName(healthMachineDTO.getMachineName());
//		return sqlSession.selectOne(NAMESPACE+"getExerciseDetail", exerciseDTO);
//	}
	
	// 짧강효확 상세페이지 selectOne 
	public ExerciseDTO getExerciseDetail(ExerciseDTO exerciseDTO) {
		System.out.println(exerciseDTO.getNum()+"dao");
		return sqlSession.selectOne(NAMESPACE+"getExerciseDetail", exerciseDTO);
	}
//	부위눌렀을때 부위별 영상 번호들 가져오기
	public List<BodyDTO> getExerciseRole(BodyDTO bodyDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getExerciseRole", bodyDTO);
	}
	
	//add - 영상등록 (짧강효확) 
	public int setExerciseAdd(ExerciseDTO exerciseDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setExerciseAdd", exerciseDTO);
	}
	//add - file 등록 
	public int setExerciseImg(BoardFileDTO boardFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setExerciseImg", boardFileDTO);
	}
	//add - ExerciseRole 등록 
	public int setExerciseBodyAdd(BodyDTO bodyDTO) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setExerciseBodyAdd",bodyDTO);
	}	
	//update - Exercise 수정 
	public int setExerciseUpdate(ExerciseDTO exerciseDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setExerciseUpdate", exerciseDTO);
	}
	
	public int setBodyUpdate(ExerciseDTO exerciseDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setBodyUpdate", exerciseDTO);
	}
	
	
	//delete - 짧강효확 사진 삭제
	public int setFileDelete(ExerciseDTO exerciseDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setFileDelete", exerciseDTO);
	}
	//delete - 짧강효확 삭제
	public int setExerciseDelete(ExerciseDTO exerciseDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setExerciseDelete", exerciseDTO);
	}
	//delete - EXERCISEROLE 삭제 
	public int setExerciseRoleDelete(ExerciseDTO exerciseDTO) throws Exception {
//		return sqlSession.delete(NAMESPACE+"setExerciseDelete", exerciseDTO);
		return sqlSession.delete(NAMESPACE+"setExerciseRoleDelete", exerciseDTO);
	}
	
	

	
}
