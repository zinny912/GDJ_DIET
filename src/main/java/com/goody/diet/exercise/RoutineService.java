package com.goody.diet.exercise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoutineService {
	
	@Autowired
	private RoutineDAO routineDAO;
	
	// List - 이달의 루틴 영상리스트 
	public List<RoutineDTO> getRoutineList() throws Exception {
		return routineDAO.getRoutineList();
	}
	// Detail - 이달의 루틴 영상 재생 
	public RoutineDTO getRoutineVideo(RoutineDTO routineDTO) throws Exception {
		return routineDAO.getRoutineVideo(routineDTO);
	}
	

}
