package com.goody.diet.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.util.Pager;

@Service
public class StudyReviewCommentService {
	
	@Autowired
	private StudyReviewCommentDAO commentDAO;
	
	public List<StudyReviewCommentDTO> getBoardList(Pager pager) throws Exception {
		pager.setPerPage(5L);
		pager.makeRow();
		
		pager.makeNum(commentDAO.getTotalCount(pager));
		
		return commentDAO.getBoardList(pager);
	}
	
	public int setBoardAdd(StudyReviewCommentDTO commentDTO) throws Exception {
		return	commentDAO.setBoardAdd(commentDTO);
	}
	
	public int setBoardDelete(StudyReviewCommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return commentDAO.setBoardDelete(commentDTO);
	}
	
}
