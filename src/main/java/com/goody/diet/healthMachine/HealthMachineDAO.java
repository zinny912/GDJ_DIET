package com.goody.diet.healthMachine;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HealthMachineDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.healthMachine.HealthMachineDAO.";

	public List<HealthMachineDTO> getHealthMachineList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getHealthMachineList");
		
	}
	
	public int setHealthMachineAdd(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setHealthMachineAdd",healthMachineDTO);
	}
	public int setHealthMachineTopOptionAdd(HealthMachineTopOptionDTO healthMachineTopOptionDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setHealthMachineTopOptionAdd", healthMachineTopOptionDTO);
	}
	public int setHealtMachineBottomOptionAdd(HealthMachineBottomOptionDTO healthMachineBottomOptionDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setHealtMachineBottomOptionAdd", healthMachineBottomOptionDTO);
	}
	public int setHealthMachineImgAdd(HealthMachineImgDTO healthMachineImgDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setHealthMachineImgAdd", healthMachineImgDTO);
	}
	public List<HealthMachineDTO> getHealthMachineDetail(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getHealthMachineDetail",healthMachineDTO);
	}
}
