package com.goody.diet.study;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goody.diet.MyTestCase;
import com.goody.diet.board.BbsDTO;
import com.goody.diet.util.Pager;

public class StudyDAOTest extends MyTestCase {

	@Autowired
	private StudyDAO studyDAO;
	
	@Test
	public void getBoardList() throws Exception{
		Pager pager = new Pager();
		List<BbsDTO> ar = studyDAO.getBoardList(pager);
		System.out.println(ar);
		assertNotEquals(0, ar.size());
	}
	
	

}
