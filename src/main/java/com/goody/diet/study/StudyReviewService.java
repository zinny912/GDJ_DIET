package com.goody.diet.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.goody.diet.util.Pager;
import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.util.FileManager;

@Service
public class StudyReviewService {
	
	@Autowired
	private StudyReviewDAO studyReviewDAO;
	
	@Autowired
	private FileManager fileManager;

	public List<StudyReviewDTO> getBoardList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(studyReviewDAO.getTotalCount(pager));
		
		return studyReviewDAO.getBoardList(pager);
	}

	public int setBoardAdd(StudyReviewDTO studyReviewDTO) throws Exception {
		return studyReviewDAO.setBoardAdd(studyReviewDTO);
		
	}
	
	public StudyReviewDTO getBoardDetail(StudyReviewDTO studyReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return studyReviewDAO.getBoardDetail(studyReviewDTO);
	}
	
	public int setHitUpdate(StudyReviewDTO studyReviewDTO) throws Exception{
		return studyReviewDAO.setHitUpdate(studyReviewDTO);
	}
	
	public int setBoardUpdate(StudyReviewDTO studyReviewDTO) throws Exception {
		return studyReviewDAO.setBoardUpdate(studyReviewDTO);
	}
	
	public int setBoardDelete(StudyReviewDTO studyReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return studyReviewDAO.setBoardDelete(studyReviewDTO);
	}
//
//	
//	public int setBoardUpdate(StudyReviewDTO studyReviewDTO) throws Exception {
//		
//		return studyReviewDAO.setBoardUpdate(studyReviewDTO);
//	}
//
//	
//	public int setBoardDelete(StudyReviewDTO studyReviewDTO, HttpSession httpSession) throws Exception {
//		// TODO Auto-generated method stub
//		return studyReviewDAO.setBoardDelete(studyReviewDTO);
//	}
	
	
	

}
