package com.goody.diet.exercise;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.healthMachine.HealthMachineDTO;

@Repository
public class RoutineDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.exercise.RoutineDAO.";
	
	//List - routine 캘린더
	public List<RoutineDTO> getRoutineList () throws Exception{
		return sqlSession.selectList(NAMESPACE+"getRoutineList");	
	}
	
	public List<RoutineDTO> getSelectList () throws Exception{
		return sqlSession.selectList(NAMESPACE+"getSelectList");
	}
	//routine 영상재생 화면
	public RoutineDTO getRoutineVideo(RoutineDTO routineDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getRoutineVideo", routineDTO);
	}
	// add페이지에 머신 리스트 불러오기 - 미완성
	public List<HealthMachineDTO> getRoutineMachine () throws Exception {
		return sqlSession.selectList(NAMESPACE+"getRoutineMachine");
	}
	
	//루틴 등록 (기본)
	public int setRoutineAdd(RoutineDTO routineDTO) {
		return sqlSession.insert(NAMESPACE+"setRoutineAdd", routineDTO);
	}
	// 루틴 수정 
	public int setRoutineUpdate(RoutineDTO routineDTO) {
		return sqlSession.update(NAMESPACE+"setRoutineUpdate", routineDTO);
	}

}
