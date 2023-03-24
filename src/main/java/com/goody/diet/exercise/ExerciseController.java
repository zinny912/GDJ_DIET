package com.goody.diet.exercise;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.util.Pager;

@Controller
@RequestMapping(value="/exercise/*")
public class ExerciseController {
	@Autowired
	private ExerciseService exerciseService;
	
	//list //routine
	@GetMapping("routine")
	public ModelAndView getExerciseList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<ExerciseDTO> ar = exerciseService.getExerciseList();
	//	System.out.println(ar.get(0).getBoardFileDTOs().get(0).getOriName());
	//	ExerciseDTO dto=exerciseService.getExerciseBody(exerciseDTO);
		
		mv.setViewName("exercise/routine");
		mv.addObject("routine", ar);
	//	mv.addObject("exerciseDTO", dto);
		
		return mv;
	}

	@GetMapping("body")
	public ModelAndView getExerciseList(ModelAndView mv) throws Exception{
		List<ExerciseDTO> ar = exerciseService.getExerciseList();
		mv.addObject("body", ar);
		mv.setViewName("exercise/body");
		return mv;
	}
		
//	@GetMapping("body")
//	public ModelAndView getExerciseBody(ModelAndView mv,ExerciseDTO exerciseDTO)throws Exception{
//		exerciseDTO =exerciseService.getExerciseBody(exerciseDTO);
//		mv.addObject("dto", exerciseDTO);
//		mv.setViewName("exercise/body");
//		return mv;
//	}
	
	//add
	@GetMapping("add")
	public ModelAndView setExerciseAdd(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("exercise/add");
		return mv;
	}
	@PostMapping("add")
	public ModelAndView setExerciseAdd(ModelAndView mv, ExerciseDTO exerciseDTO, MultipartFile [] Files, HttpSession session)throws Exception{
		int result = exerciseService.setExerciseAdd(exerciseDTO, Files, session);
		String message="실패";
		if(result>0) {
			message="성공";
		}
		mv.addObject("url","./routine");
		mv.addObject("result", message);
		mv.setViewName("common/result");
		return mv;
	}

	//add 페이지 영상등록시 목록들 
	//운동기구 
	@PostMapping("machine")
	public ModelAndView getExerciseMachine(ModelAndView mv, HealthMachineDTO healthMachineDTO)throws Exception{
	List<HealthMachineDTO> ar = exerciseService.getExerciseMachine();
	mv.addObject("machineList", ar);
	mv.setViewName("common/exerciseAdd");
	return mv;
	}
	
	@PostMapping("routineName")
	public ModelAndView getExerciseList(ModelAndView mv, ExerciseDTO exerciseDTO) throws Exception{
		List<ExerciseDTO> ar = exerciseService.getExerciseList();
		mv.addObject("dto", ar);
		mv.setViewName("common/exerciseAdd");
		return mv;
	}
	
	
	//루틴영상 
	
	@GetMapping("video")
	public ModelAndView getExerciseVideo(ModelAndView mv, ExerciseDTO exerciseDTO) throws Exception {
		exerciseDTO = exerciseService.getExerciseVideo(exerciseDTO);
		
		mv.setViewName("exercise/video");
		mv.addObject("dto", exerciseDTO);
		return mv;
	}
	
	

}

