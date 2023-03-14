package com.goody.diet.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.board.BbsDAO;
import com.goody.diet.board.BbsDTO;
import com.goody.diet.board.BbsService;
import com.goody.diet.util.Pager;

@Service
public class StudyReviewService implements BbsService {
	
	@Autowired
	private BbsDAO studyReviewDAO;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession httpSession) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

}
