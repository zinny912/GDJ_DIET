package com.goody.diet.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goody.diet.util.Pager;

@Service
public class StudyQnaService{

	@Autowired
	private StudyQnaDAO qnaDAO;
	
	public int setBoardAdd(StudyQnaDTO qnaDTO) throws Exception {
		return qnaDAO.setBoardAdd(qnaDTO);
	}
	
	public int setBoardUpdate(StudyQnaDTO qnaDTO) throws Exception {
		return qnaDAO.setBoardUpdate(qnaDTO);
	}

	public int setBoardDelete(StudyQnaDTO qnaDTO, HttpSession httpSession) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setBoardDelete(qnaDTO);
	}
	
	public int setBoardDelete(StudyQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setBoardDelete(qnaDTO);
	}
	
	public StudyQnaDTO getBoardDetail(StudyQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getBoardDetail(qnaDTO);
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

	public List<StudyQnaDTO> getBoardList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(qnaDAO.getTotalCount(pager));
		return qnaDAO.getBoardList(pager);
	}

	public int setHitUpdate(StudyQnaDTO qnaDTO) throws Exception{
		return qnaDAO.setHitUpdate(qnaDTO);
	}
	
}