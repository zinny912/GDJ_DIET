package com.goody.diet.healthMachine;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goody.diet.MyTestCase;
import com.goody.diet.util.Pager;

public class MachineQnaDAOTest extends MyTestCase {

	@Autowired
	private MachineQnaDAO machineQnaDAO;
	
	@Test
	public void getBoardList() throws Exception {
		Pager pager = new Pager();
		pager.makeRow();
		pager.setNum(2L);
		System.out.println(pager);
		List<MachineQnaDTO> ar =machineQnaDAO.getBoardList(pager);
		System.out.println(ar);
		assertNotEquals(0, ar.size());
	}

}