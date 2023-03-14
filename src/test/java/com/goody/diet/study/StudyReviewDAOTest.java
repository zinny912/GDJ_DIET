//package com.goody.diet.study;
//
//import static org.junit.Assert.*;
//
//import java.util.List;
//
//import org.junit.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.goody.diet.MyTestCase;
//import com.goody.diet.board.BbsDTO;
//import com.goody.diet.util.Pager;
//
//public class StudyReviewDAOTest extends MyTestCase{
//
//
//		@Autowired
//		private StudyReviewDAO studyReviewDAO;
//		
//		@Test
//		public void getBoardListTest() throws Exception{
//			Pager pager = new Pager();
//			
////			pager.setNum(7L);
////			pager.makeRow();
////			
////			System.out.println(pager);
//			
//			List<StudyReviewDTO> ar =studyReviewDAO.getBoardList(pager);
//			System.out.println(ar);
//			assertNotEquals(0, ar.size());
//	}
//		@Test
//		public void setBoardAddTest() throws Exception {
//			StudyReviewDTO studyReviewDTO = new StudyReviewDTO();
//			studyReviewDTO.setNum(9L);
//			studyReviewDTO.setStudyNum(1L);
//			studyReviewDTO.setTitle("오운완");
//			studyReviewDTO.setWriter("이진희");
//			studyReviewDTO.setContents("오늘운동완");
//			
//			studyReviewDTO.setHit(0L);
//			studyReviewDTO.setScore(4.5);
//			int result = studyReviewDAO.setBoardAdd(studyReviewDTO);
//			System.out.println(result);
//			assertEquals(1, result);
//			
//		}
//		@Test
//		public void setBoardUpdateTest() throws Exception {
//			StudyReviewDTO studyReviewDTO = new StudyReviewDTO();
//			studyReviewDTO.setNum(21L);
//			studyReviewDTO.setHit(3L);
//			studyReviewDTO.setScore(5.0);
//			studyReviewDTO.setStudyNum(1L);
//			studyReviewDTO.setTitle("룰루랄");
//			studyReviewDTO.setWriter("룰루");
//			studyReviewDTO.setContents("aaaa");
//		
//			int a  = studyReviewDAO.setBoardUpdate(studyReviewDTO);
//			assertEquals(1, a);
//
//		}	
//		
//		@Test	
//		public void setBoardDeleteTest() throws Exception {
//			StudyReviewDTO studyReviewDTO = new StudyReviewDTO();
//			studyReviewDTO.getNum();
//			
//			int result = studyReviewDAO.setBoardDelete(studyReviewDTO);
//			
//			assertEquals(1,result);
//		}
//
//}
