package com.goody.diet.exercise;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public ExerciseDTO getExerciseBody(ExerciseDTO exerciseDTO) throws Exception {
		return exerciseDAO.getExerciseBody();
	}
	
	public ExerciseDTO getExerciseVideo(ExerciseDTO exerciseDTO) throws Exception {
		return exerciseDAO.getExerciseVideo(exerciseDTO);
	}

	
}
