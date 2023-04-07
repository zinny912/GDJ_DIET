package com.goody.diet.exercise;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.util.FileManager;
import com.goody.diet.util.Pager;

@Service
public class ExerciseService {
	
	@Autowired
	private ExerciseDAO exerciseDAO;
    
	//@Autowired
	//private ServletContext servletContext;
	
	//private FileManager fileManager;
	
	//짧강효확 첫 페이지 부위별 링크 걸기 
	public List<BodyDTO> getBodyList() throws Exception {
		return exerciseDAO.getBodyList();
	}
	
	public List<ExerciseDTO> getBodyDetailList(Long bodyNum) throws Exception {
		return exerciseDAO.getBodyDetailList(bodyNum);
	}
	
	//detail - 짧강효확 페이지 
//	public List<ExerciseDTO> getDetail() throws Exception {
//		return exerciseDAO.getExerciseBody();
//	}
	
	//detail - 영상출력 페이지 
	public ExerciseDTO getExerciseVideo(ExerciseDTO exerciseDTO) throws Exception {
		return exerciseDAO.getExerciseVideo(exerciseDTO);
	}
	
	// 머신 이름 리스트 불러오기 
//	public List<ExerciseDTO> getExerciseMachine() throws Exception {
//		List<ExerciseDTO> exerciseDTOs = exerciseDAO.getExerciseMachine();
//		for (ExerciseDTO exerciseDTO : exerciseDTOs) {
//			List<HealthMachineDTO> healthMachineDTOs = exerciseDTO.getHealthMachineDTOs();
//			if (healthMachineDTOs != null && !healthMachineDTOs.isEmpty()) {
//				exerciseDTO.setMachineName(healthMachineDTOs.get(0).getMachineName());
//				exerciseDTO.setMachineNum(healthMachineDTOs.get(0).getMachineNum());
//				System.out.println("machineNum : " + exerciseDTO.getMachineNum());
//				System.out.println("machineName : " + exerciseDTO.getMachineName());
//				System.out.println("exercise: " + exerciseDTO.getBodyPart());
//			}
//	
//		}
//		return exerciseDTOs;
//	}
	
	// add 
	public int setExerciseAdd(ExerciseDTO exerciseDTO, MultipartFile [] multipartFiles, HttpSession session, HealthMachineDTO healthMachineDTO) throws Exception{
		int result = exerciseDAO.setExerciseAdd(exerciseDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/routine/");
		System.out.println(realPath);
		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				System.out.println("실패");
				continue;
			}
			FileManager fileManager = new FileManager();
			String fileName = fileManager.fileSave(multipartFile, realPath);
			BoardFileDTO exerciseImgDTO = new BoardFileDTO();
			exerciseImgDTO.setNum(exerciseDTO.getNum());
			exerciseImgDTO.setFileName(fileName);
			exerciseImgDTO.setOriName(multipartFile.getOriginalFilename());
			System.out.println("filename : "+exerciseImgDTO.getFileName());
			System.out.println("oriname : "+exerciseImgDTO.getOriName());
			
			result = exerciseDAO.setExerciseImg(exerciseImgDTO);
		}
		return result;
	}

	



	
}
