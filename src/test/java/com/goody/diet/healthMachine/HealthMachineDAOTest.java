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
	public void setHealthMachineTopOptionAdd()throws Exception{
		HealthMachineTopOptionDTO dto = new HealthMachineTopOptionDTO();
		dto.setOptionName("옵션top1");
		dto.setMachineNum(26L);
		healthMachineDAO.setHealthMachineTopOptionAdd(dto);
		assertNotEquals(0, dto);
	}
}
