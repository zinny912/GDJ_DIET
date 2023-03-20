package com.goody.diet.board.studyqna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.board.BoardDTO;
import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.board.BoardService;
import com.goody.diet.util.FileManager;
import com.goody.diet.util.Pager;

@Service
public class StudyQnaService implements BoardService{

	@Autowired
	private StudyQnaDAO qnaDAO;
	
	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(qnaDAO.getTotalCount(pager));
		return qnaDAO.getBoardList(pager);
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception {
		return 0;
	}
	

	public int setBoardAdd(StudyQnaDTO qnaDTO) throws Exception {
		return qnaDAO.setBoardAdd(qnaDTO);
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		return 0;
	}
	
	public int setBoardUpdate(StudyQnaDTO qnaDTO) throws Exception {
		return qnaDAO.setBoardUpdate(qnaDTO);
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession httpSession) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setBoardDelete(bbsDTO);
	}

	public int setBoardDelete(StudyQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setBoardDelete(qnaDTO);
	}
	
	@Override
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public StudyQnaDTO getBoardDetail(StudyQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getBoardDetail(qnaDTO);
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session, Long[] fileNums)
			throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//reply Insert
	public int setReplyAdd(StudyQnaDTO qnaDTO) throws Exception{
			//QnaDTO
			//num : 부모의 글번호
			//writer,title,contents :답글로 입력한 값
			//ref: null
			//step: null
			//depth: null
			
			//1. 부모의 정보를 조회
			StudyQnaDTO  parent = qnaDAO.getBoardDetail(qnaDTO);
			
			//ref: 부모의 ref
			qnaDTO.setRef(parent.getRef());
			
			//step: 부모의 step+1
			qnaDTO.setStep(parent.getStep()+1);
			
			//depth: 부모의 depth+1
			qnaDTO.setDepth(parent.getDepth()+1);
			
			//2. Step을 update
			int result = qnaDAO.setStepUpdate(qnaDTO);
			
			//3. 답글 insert
			result = qnaDAO.setReplyAdd(qnaDTO);			
			return result;
		}
	
}