package com.goody.diet.healthMachine;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goody.diet.MyTestCase;

public class HealthMachineDAOTest extends MyTestCase {
	
	@Autowired
	private HealthMachineDAO healthMachineDAO;
	
//	@Test
	public void getHealthMachineList() throws Exception{
		List<HealthMachineDTO> ar =healthMachineDAO.getHealthMachineList();
		assertNotNull(ar);
	}
//	@Test
	public void setHealthmachinieAdd()throws Exception{
		HealthMachineDTO dto = new HealthMachineDTO();
		dto.setCategoryNum(3L);
		dto.setMachineName("test");
		dto.setSalePrice(3L);
		dto.setPrice(3L);
		dto.setOption1("testoption1");
		dto.setOption2("testoption2");
		int result =  healthMachineDAO.setHealthMachineAdd(dto);
		assertNotEquals(1, result);
	}
	@Test
	public void setoptionAdd()throws Exception{
		RealHealthMachineDTO dto = new RealHealthMachineDTO();
		dto.setMachineNum(12L);
		dto.setOptId1("testid");
		dto.setOptName1("testName");
		dto.setStock(0L);
		int result= healthMachineDAO.setOptionAdd(dto);
		assertNotEquals(1, result);
	}
}
