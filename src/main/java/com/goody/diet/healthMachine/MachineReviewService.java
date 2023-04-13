package com.goody.diet.healthMachine;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.cart.CartDTO;
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
	
	public MachineReviewDTO getBoardDetail(MachineReviewDTO machineReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return machineReviewDAO.getBoardDetail(machineReviewDTO);
	}
	
	public int setHitUpdate(MachineReviewDTO machineReviewDTO) throws Exception{
		return machineReviewDAO.setHitUpdate(machineReviewDTO);
	}
	
	public int setBoardUpdate(MachineReviewDTO machineReviewDTO) throws Exception {
		return machineReviewDAO.setBoardUpdate(machineReviewDTO);
	}
	
	public int setBoardDelete(MachineReviewDTO machineReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return machineReviewDAO.setBoardDelete(machineReviewDTO);
	}
	
	public String setBoardFileAdd(MultipartFile files,HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/machineReviewFile/");
	
			if(files.isEmpty()) {
				//파일 업로드가 안된 게시물은 continue로 처음으로 올라감
				return null;
			}
			String fileName = fileManager.fileSave(files, realPath);
			return "/resources/upload/machineReviewFile/"+fileName;
	}

}
