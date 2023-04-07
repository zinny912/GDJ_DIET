package com.goody.diet.healthMachine;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.study.StudyReviewDTO;
import com.goody.diet.util.FileManager;
import com.goody.diet.util.Pager;

@Service
public class MachineReviewService {
	
	@Autowired
	private MachineReviewDAO machineReviewDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public List<MachineReviewDTO> getBoardList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(machineReviewDAO.getTotalCount(pager));
		
		return machineReviewDAO.getBoardList(pager);
	}
	
	public int setBoardAdd(MachineReviewDTO machineReviewDTO) throws Exception {
		return machineReviewDAO.setBoardAdd(machineReviewDTO);
		
	}
	
}
