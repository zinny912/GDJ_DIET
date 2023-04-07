package com.goody.diet.exercise;


import java.util.List;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.goody.diet.healthMachine.HealthMachineDTO;


@Controller
@RequestMapping(value="/exercise/*")
public class ExerciseController {
	@Autowired
	private ExerciseService exerciseService;
	
	//부위별 링크 짧강효확 보내기 
	@GetMapping("body")
	public ModelAndView getBodyList(BodyDTO bodyDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BodyDTO> ar = exerciseService.getBodyList();
		mv.setViewName("exercise/body");
		mv.addObject("bodyList", ar);
		return mv;
	}
	//bodyNum별 detail List 
	@GetMapping("info2")
	public ModelAndView getBodyDetailList(@Param("bodyNum")Long bodyNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<ExerciseDTO> exerciseList = exerciseService.getBodyDetailList(bodyNum);
		mav.setViewName("detail/info");
		mav.addObject("exerciseList", exerciseList);
		return mav;
	}

	
//	@GetMapping("info")
//	public ModelAndView getExerciseInfo(ModelAndView mv, ExerciseDTO exerciseDTO)throws Exception{
//		//exerciseDTO = exerciseService.getExerciseVideo(exerciseDTO);
//		//List<ExerciseDTO> ar = exerciseService.getExerciseBody();
//		//List<ExerciseDTO> ar2 = exerciseService.getExerciseMachine();
//
//		//mv.setViewName("exercise/detail/info");
//		//mv.addObject("machineList", ar2);
//		mv.addObject("detailList", exerciseDTO);
//		return mv;
//		
//	}
//	@PostMapping("add")
//	public ModelAndView setRoutineAdd(ModelAndView mv, ExerciseDTO exerciseDTO, MultipartFile [] Files, HttpSession session)throws Exception{
//		int result = exerciseService.setExerciseAdd(exerciseDTO, Files, session, exerciseDTO);
//		String message="실패";
//		if(result>0) {
//			message="성공";
//		}
//		mv.addObject("url","./routine");
//		mv.addObject("result", message);
//		mv.setViewName("common/result");
//		return mv;
//	}
//	@GetMapping("add")
//	public ModelAndView setRoutineAdd(HttpSession session, ExerciseDTO exerciseDTO)throws Exception{
//		ModelAndView mv = new ModelAndView();
//	    mv.setViewName("exercise/add");
//	    return mv;
//	}
//	
//	
//	@PostMapping("add")
//	public ModelAndView setExerciseAdd(ModelAndView mv, ExerciseDTO exerciseDTO, MultipartFile [] Files, HttpSession session, HealthMachineDTO healthMachineDTO)throws Exception{
//		int result = exerciseService.setExerciseAdd(exerciseDTO, Files, session, healthMachineDTO);
//		String message="실패";
//		if(result>0) {
//			message="성공";
//		}
//		mv.addObject("url","./calendar");
//		mv.addObject("result", message);
//		mv.setViewName("common/result");
//		return mv;
//	}
//	@GetMapping("add")
//	public ModelAndView setExerciseAdd(HttpSession session, ExerciseDTO exerciseDTO)throws Exception{
//	    ModelAndView mv = new ModelAndView();
//	    List<ExerciseDTO> ar = exerciseService.getExerciseMachine(); 
//	    //List<ExerciseDTO> ar2= exerciseService.getExerciseList();
//	    for(int i=0; i<ar.size(); i++) {
//	    	System.out.println(ar.get(i).getMachineName());
//	    	System.out.println(ar.get(i).getMachineNum());
//	    	System.out.println(ar.get(i).getBodyPart());
//	    	System.out.println(ar.get(i).getCoordinate());
//	    }
//	    //mv.addObject("exerciseList",ar2);
//	    mv.addObject("machineList", ar);
//	    mv.setViewName("exercise/routineAdd");
//	    return mv;
//	}


}
	


