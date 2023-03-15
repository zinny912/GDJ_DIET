package com.goody.diet.exercise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.util.Pager;

@Controller
@RequestMapping(value="/exercise/*")
public class ExerciseController {
	@Autowired
	private ExerciseService exerciseService;
	
	//list
	@GetMapping("list")
	public ModelAndView getExerciseList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<ExerciseDTO> ar = exerciseService.getExerciseList();
		
		mv.setViewName("exercise/list");
		mv.addObject("list", ar);
		
		return mv;
	}
	
	//routine
	@GetMapping("routine")
	public ModelAndView getExerciseRoutine(ModelAndView mv) throws Exception {
		mv.setViewName("exercise/routine");
		return mv;
	}
	
	//detail
	@GetMapping("body")
	public ModelAndView getExerciseBody(ExerciseDTO exerciseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		exerciseDTO = exerciseService.getExerciseBody(exerciseDTO);
		
		mv.setViewName("exercise/body");
		mv.addObject("dto", exerciseDTO);
		return mv;
	}

}
