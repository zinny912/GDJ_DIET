package com.goody.diet.exercise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.util.Pager;

@Controller
@RequestMapping(value="/exercise/*")
public class ExerciseController {
	@Autowired
	private ExerciseService exerciseService;
	
	@GetMapping("exerciseList")
	public ModelAndView getExerciseList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<ExerciseDTO> ar = exerciseService.getExerciseList();
		
		mv.setViewName("exercise/exerciseList");
		mv.addObject("exerciseList", ar);
	
		
		return mv;
	}
	
	
	

}
