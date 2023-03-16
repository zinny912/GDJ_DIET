package com.goody.diet.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.util.FileManager;
import com.goody.diet.util.Pager;

@Service
public class StudyService {
	
	@Autowired
	private StudyDAO studyDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub		
		pager.makeRow();
		pager.makeNum(studyDAO.getStudyCount(pager));
		return studyDAO.getBoardList(pager);
	}
	
	public StudyDTO getBoardDetail(Pager pager) throws Exception{
		return studyDAO.getBoardDetail(pager);
	}
}
