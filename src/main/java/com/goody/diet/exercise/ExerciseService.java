package com.goody.diet.exercise;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	
	public List<ExerciseDTO> getExerciseList() throws Exception {
		return exerciseDAO.getExerciseList();
	}
	
	//detail
	public ExerciseDTO getExerciseBody(ExerciseDTO exerciseDTO) throws Exception {
		return exerciseDAO.getExerciseBody(exerciseDTO);
	}
	
	public ExerciseDTO getExerciseVideo(ExerciseDTO exerciseDTO) throws Exception {
		return exerciseDAO.getExerciseVideo(exerciseDTO);
	}
	
	public List<HealthMachineDTO> getExerciseMachine() throws Exception {
		return exerciseDAO.getExerciseMachine();
	}
	public ExerciseDTO getExerciseInfo() throws Exception{
		return exerciseDAO.getExerciseInfo();
	}

	public int setExerciseAdd(ExerciseDTO exerciseDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception{
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
