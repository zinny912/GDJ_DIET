package com.goody.diet.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	public String setBoardFileAdd(MultipartFile files,HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/studyReviewFile/");
		System.out.println(realPath);
	
			if(files.isEmpty()) {
				//파일 업로드가 안된 게시물은 continue로 처음으로 올라감
				return null;
			}
			String fileName = fileManager.fileSave(files, realPath);
			return "/resources/upload/studyReviewFile/"+fileName;
	}
}
