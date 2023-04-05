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
	public List<HealthMachineImgDTO> getMachineImgList(HealthMachineImgDTO healthMachineImgDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMachineImgList", healthMachineImgDTO);
	}
	public List<RealHealthMachineDTO> getRealHealthMachineList(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getRealHealthMachineList", realHealthMachineDTO);
	}
	
	public RealHealthMachineDTO getRealHealthMachineDetail(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getRealHealthMachineDetail", realHealthMachineDTO);
	}
	
	public List<CategoryDTO> getCategoryDetail(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCategoryDetail", healthMachineDTO);
	}
	//getDetail(getOption)
	public HealthMachineDTO getHealthMachineDetail(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getHealthMachineDetail", healthMachineDTO);
	}
	public HealthMachineDTO getHealthMachineDetail(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		HealthMachineDTO healthMachineDTO = new HealthMachineDTO();
		healthMachineDTO.setMachineNum(realHealthMachineDTO.getMachineNum());
		
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
	
	//HealthMachine Add
	public int setHealthMachineAdd(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setHealthMachineAdd", healthMachineDTO);
	}
	public int setMachineImg(HealthMachineImgDTO healthMachineImgDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setMachineImg", healthMachineImgDTO);
	}
	public int setOptionAdd(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setOptionAdd", realHealthMachineDTO);
	}
	public int setMachineThumnailAdd(HealthMachineImgDTO healthMachineImgDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setMachineThumnailAdd", healthMachineImgDTO);
	}
	//Category
	public List<CategoryDTO> getCategoryList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCategoryList");
	}
	
	public int setCategoryAdd(CategoryDTO categoryDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCategoryAdd", categoryDTO);	
	}
	public int setCategoryDelete(CategoryDTO categoryDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setCategoryDelete",categoryDTO);
	}
	public int setCategoryType(CategoryDTO categoryDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCategoryType", categoryDTO);
	}
	//	HealthMachine delete
	public int setHealthMachineDelete(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setHealthMachineDelete",healthMachineDTO);
	}
	public int setRealMachineDelete(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setRealMachineDelete",realHealthMachineDTO);
		
	}
	public int setMachineImgDelete(HealthMachineImgDTO healthMachineImgDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setMachineImgDelete", healthMachineImgDTO);
	}
	public int setMachineFileDelete(Long fileNum)throws Exception{
		return sqlSession.delete(NAMESPACE+"setMachineFileDelete", fileNum);
	}
	public int setCategoryTypeDelete(CategoryDTO categoryDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setCategoryTypeDelete", categoryDTO);
	}
	//healthmAchine update
	public int setHealthMachineUpdate(HealthMachineDTO healthMachineDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setHealthMachineUpdate", healthMachineDTO);
	}
	
} 
