package com.goody.diet.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.util.Pager;

@Service
public class StudyService {
	
	@Autowired
	private StudyDAO studyDAO;
	
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		Long totalCount = studyDAO.getStudyCount(pager);
		
		pager.makeNum(totalCount);
		pager.makeRow();
		
		return studyDAO.getBoardList(pager);
	}
}
