package com.goody.diet.study;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goody.diet.MyTestCase;
import com.goody.diet.util.Pager;

public class StudyReviewCommentTest extends MyTestCase {
	@Autowired
	private StudyReviewCommentDAO commentDAO;
	
	@Test
	public void getBoardListTest() throws Exception{
		Pager pager = new Pager();
		pager.makeRow();
		pager.setNum(7L);
		System.out.println(pager);
		List<StudyReviewCommentDTO> ar =commentDAO.getBoardList(pager);
		System.out.println(ar);
		assertNotEquals(0, ar.size());
	}
	
//	@Test
//	public void getBoardListTest() throws Exception{
//		Pager pager = new Pager();
//		
////		pager.setNum(7L);
////		pager.makeRow();
////		
////		System.out.println(pager);
//		
//		List<StudyReviewDTO> ar =studyReviewDAO.getBoardList(pager);
//		System.out.println(ar);
//		assertNotEquals(0, ar.size());
}
