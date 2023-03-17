package com.goody.diet.healthMachine;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.util.FileManager;

@Service
public class HealthMachineService {

	@Autowired
	private HealthMachineDAO healthMachineDAO;

	@Autowired
	private FileManager fileManager;
	
	public List<HealthMachineDTO> getHealthMachineList() throws Exception{
		return healthMachineDAO.getHealthMachineList();

	}
	public HealthMachineDTO getHealthMachineDetail(HealthMachineDTO healthMachineDTO) throws Exception{
		return healthMachineDAO.getHealthMachineDetail(healthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption1(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return healthMachineDAO.getOption1(realHealthMachineDTO);
	}
	
	public List<RealHealthMachineDTO> getOption2(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return healthMachineDAO.getOption2(realHealthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption3(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return healthMachineDAO.getOption3(realHealthMachineDTO);
	}
	public List<RealHealthMachineDTO> getOption4(RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		return healthMachineDAO.getOption4(realHealthMachineDTO);
	}
	
	
//	public int setHealthMachineAdd(HealthMachineDTO healthMachineDTO, MultipartFile [] files,HttpSession session)throws Exception{
//		int result = healthMachineDAO.setHealthMachineAdd(healthMachineDTO);
//		
//		String realPath = session.getServletContext().getRealPath("resources/upload/healthMachine");
//		for(MultipartFile file:files) {
//			String fileName = fileManager.fileSave(file, realPath);
//			HealthMachineImgDTO healthMachineImgDTO = new HealthMachineImgDTO();
//			healthMachineImgDTO.setMachineNum(healthMachineDTO.getMachineNum());
//			healthMachineImgDTO.setFileName(fileName);
//			healthMachineImgDTO.setOriName(file.getOriginalFilename());
//			result =healthMachineDAO.setHealthMachineImgAdd(healthMachineImgDTO);
//			
//		}
//		
//
//		
//		
//		return result;
//
//	}


	
	
	

}
