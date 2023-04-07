package com.goody.diet.healthMachine;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.goody.diet.util.Pager;

@Service
public class MachineQnaService {
	
	@Autowired
	private MachineQnaDAO machineQnaDAO;

	public List<MachineQnaDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		pager.makeNum(machineQnaDAO.getTotalCount(pager));
		return machineQnaDAO.getBoardList(pager);
	}
	
	public int setBoardAdd(MachineQnaDTO qnaDTO) throws Exception {
		return machineQnaDAO.setBoardAdd(qnaDTO);
	}
	
	public MachineQnaDTO getBoardDetail(MachineQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return machineQnaDAO.getBoardDetail(qnaDTO);
	}
	
	public int setBoardUpdate(MachineQnaDTO qnaDTO) throws Exception {
		return machineQnaDAO.setBoardUpdate(qnaDTO);
	}

	public int setBoardDelete(MachineQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return machineQnaDAO.setBoardDelete(qnaDTO);
	}
	
	public int setReplyAdd(MachineQnaDTO qnaDTO) throws Exception{
		//QnaDTO
		//num : 부모의 글번호
		//writer,title,contents :답글로 입력한 값
		//ref: null
		//step: null
		//depth: null
		
		//1. 부모의 정보를 조회
		MachineQnaDTO  parent = machineQnaDAO.getBoardDetail(qnaDTO);
		
		//ref: 부모의 ref
		qnaDTO.setRef(parent.getRef());
		
		//step: 부모의 step+1
		qnaDTO.setStep(parent.getStep()+1);
		
		//depth: 부모의 depth+1
		qnaDTO.setDepth(parent.getDepth()+1);
		
		//2. Step을 update
		int result = machineQnaDAO.setStepUpdate(qnaDTO);
		
		//3. 답글 insert
		result = machineQnaDAO.setReplyAdd(qnaDTO);			
		return result;
	}
	
	public int setHitUpdate(MachineQnaDTO qnaDTO) throws Exception{
		return machineQnaDAO.setHitUpdate(qnaDTO);
	}
}
