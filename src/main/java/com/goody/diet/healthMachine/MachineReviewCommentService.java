package com.goody.diet.healthMachine;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.util.Pager;

@Service
public class MachineReviewCommentService {
	
	@Autowired
	private MachineReviewCommentDAO commentDAO;
	
	public List<MachineReviewCommentDTO> getBoardList(Pager pager) throws Exception {
		pager.setPerPage(5L);
		pager.makeRow();
		
		pager.makeNum(commentDAO.getTotalCount(pager));
		
		return commentDAO.getBoardList(pager);
	}
	
	public int setBoardAdd(MachineReviewCommentDTO commentDTO) throws Exception {
		return	commentDAO.setBoardAdd(commentDTO);
	}
	
	public int setBoardDelete(MachineReviewCommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return commentDAO.setBoardDelete(commentDTO);
	}
	
}
