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
	public List<HealthMachineDTO> getHealthMachineTypeList(CategoryDTO categoryDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getHealthMachineTypeList",categoryDTO);
	}
	
	public HealthMachineDTO getHealthMachineDetail(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getHealthMachineDetail", healthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption1(RealHealthMachineDTO realHealthMachineDTO)throws Exception{

		return sqlSession.selectList(NAMESPACE+"getOption1", realHealthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption2(RealHealthMachineDTO realHealthMachineDTO)throws Exception{

		return sqlSession.selectList(NAMESPACE+"getOption2", realHealthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption3(RealHealthMachineDTO realHealthMachineDTO)throws Exception{

		return sqlSession.selectList(NAMESPACE+"getOption3", realHealthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption4(RealHealthMachineDTO realHealthMachineDTO)throws Exception{

		return sqlSession.selectList(NAMESPACE+"getOption4", realHealthMachineDTO);
	}
	public int setHealthMachineAdd(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setHealthMachineAdd", healthMachineDTO);
	}
	public int setMachineImg(HealthMachineImgDTO healthMachineImgDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setMachineImg", healthMachineImgDTO);
	}
	public int setOptionAdd(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setOptionAdd", realHealthMachineDTO);
	}
	
	
}
