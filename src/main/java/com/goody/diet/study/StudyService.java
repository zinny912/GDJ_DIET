package com.goody.diet.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.util.FileManager;
import com.goody.diet.util.Pager;
import com.goody.diet.board.BoardFileDTO;

@Service
public class StudyService {
	
	@Autowired
	private StudyDAO studyDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public List<StudyDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub		
		pager.makeRow();
		pager.makeNum(studyDAO.getStudyCount(pager));
		return studyDAO.getBoardList(pager);
	}
	
	public StudyDTO getBoardDetail(StudyDTO studyDTO) throws Exception{
		return studyDAO.getBoardDetail(studyDTO);
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
	
	public int setBoardAdd(StudyDTO studyDTO, MultipartFile [] multipartFiles, HttpSession session)  throws Exception {
		int result = studyDAO.setBoardAdd(studyDTO);
		
		//file을 HDD에 저장
		String realPath = session.getServletContext().getRealPath("resources/upload/study/");
		System.out.println(realPath);
		
		for(MultipartFile multipartFile:multipartFiles) {
			if(multipartFile.isEmpty()) {
				//파일 업로드가 안된 게시물은 continue로 처음으로 올라감
				continue;
			}
			String fileName = fileManager.fileSave(multipartFile, realPath);
			System.out.println(fileName);
			//DB에 INSERT
			StudyBoardFileDTO studyBoardFileDTO = new StudyBoardFileDTO();
			studyBoardFileDTO.setStudyNum(studyDTO.getStudyNum());
			studyBoardFileDTO.setFileName(fileName);
			studyBoardFileDTO.setOriName(multipartFile.getOriginalFilename());
			
			result = studyDAO.setBoardFileAdd(studyBoardFileDTO);
		}
		
		return result;
	}
	
	public int setBoardUpdate(StudyDTO studyDTO, MultipartFile[] multipartFiles, HttpSession session, Long fileNum)
			throws Exception {
		//qnaFiles Delete
		int result =  studyDAO.setBoardFileDelete(fileNum);

		//qna Update
		result = studyDAO.setBoardUpdate(studyDTO);
		
		
		//qnaFiles Insert
		//file을 HDD에 저장
		String realPath = session.getServletContext().getRealPath("resources/upload/study/");
		System.out.println(realPath);
		
		for(MultipartFile multipartFile:multipartFiles) {
			if(multipartFile.isEmpty()) {
				//파일 업로드가 안된 게시물은 continue로 처음으로 올라감
				continue;
			}
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			//DB에 INSERT
			StudyBoardFileDTO studyBoardFileDTO = new StudyBoardFileDTO();
			studyBoardFileDTO.setStudyNum(studyDTO.getStudyNum());
			studyBoardFileDTO.setFileName(fileName);
			studyBoardFileDTO.setOriName(multipartFile.getOriginalFilename());
			
			result = studyDAO.setBoardFileAdd(studyBoardFileDTO);
		}
		
		return result;
	}
	
	public int setBoardDelete(StudyDTO studyDTO, Long fileNum) throws Exception {
		//studyFile Delete
		int result =  studyDAO.setBoardFileDelete(fileNum);
		
		//study Delete
		result = studyDAO.setBoardDelete(studyDTO);
		return result;
	}
}
