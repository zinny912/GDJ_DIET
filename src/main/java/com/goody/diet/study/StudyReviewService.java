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

	public int setBoardAdd(StudyReviewDTO studyReviewDTO,MultipartFile [] multipartFiles, HttpSession session) throws Exception {
		int result = studyReviewDAO.setBoardAdd(studyReviewDTO);
		
		//file을 HDD에 저장
		String realPath = session.getServletContext().getRealPath("resources/upload/studyReivew/");
		System.out.println(realPath);
		
		for(MultipartFile multipartFile:multipartFiles) {
			if(multipartFile.isEmpty()) {
				//파일 업로드가 안된 게시물은 continue로 처음으로 올라감
				continue;
			}
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			//DB에 INSERT
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setNum(studyReviewDTO.getNum());
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			
			result = studyReviewDAO.setBoardFileAdd(boardFileDTO);
		}
		return result;
		
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
