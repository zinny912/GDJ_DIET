package com.goody.diet.exercise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/routine/*")
public class RoutineController {
	
	@Autowired
	private RoutineService routineService;
	
	@GetMapping("calendar")
	public ModelAndView getRoutineList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<RoutineDTO> ar = routineService.getRoutineList();
		mv.setViewName("routine/calendar");
		mv.addObject("routine", ar);
		return mv;
	}
	
	//이달의 루틴영상 play page  
	@GetMapping("video")
	public ModelAndView getRoutineVideo(ModelAndView mv, RoutineDTO routineDTO) throws Exception {
		routineDTO = routineService.getRoutineVideo(routineDTO);
		mv.setViewName("routine/video");
		mv.addObject("dto", routineDTO);
		return mv;
	}

}
