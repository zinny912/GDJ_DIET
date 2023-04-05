package com.goody.diet.exercise;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoutineDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.exercise.RoutineDAO.";
	
	//List - routine 캘린더
	public List<RoutineDTO> getRoutineList () throws Exception{
		return sqlSession.selectList(NAMESPACE+"getRoutineList");	
	}

	public RoutineDTO getRoutineVideo(RoutineDTO routineDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getRoutineVideo", routineDTO);
	}
	

}
