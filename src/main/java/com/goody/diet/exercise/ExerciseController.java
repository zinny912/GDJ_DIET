package com.goody.diet.exercise;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;

@Controller
@RequestMapping(value="/exercise/*")
public class ExerciseController {
	@Autowired
	private ExerciseService exerciseService;
	
	
	//AJAX로 데이터 저장
//    @PostMapping("/add")
//    public void setExerciseAdd(@RequestBody Routine routine) {
//        exerciseService.setExerciseAdd();
//    }

	
	//list : 이달의 루틴 테이블에 list 출력 
	@GetMapping("routine")
	public ModelAndView getCalendarList(ModelAndView mv) {
		  List<ExerciseDTO> calendar = null;
		  try {
		    calendar = exerciseService.getExerciseList();
		    mv.addObject("exerciseList", calendar);
		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  mv.setViewName("exercise/routine");
		  return mv;
		}
//	@RequestMapping(value="routine", method=RequestMethod.GET)
//	public ModelAndView getExerciseList() throws Exception{
//		ModelAndView mv = new ModelAndView();
//		List<ExerciseDTO> ar = exerciseService.getExerciseList();
//		mv.setViewName("exercise/routine");
//		mv.addObject("exercise", ar);
//		return mv;
//	}
	
	    

	   

	
	
	
	//이달의 루틴영상 play page  
	@GetMapping("video")
	public ModelAndView getExerciseVideo(ModelAndView mv, ExerciseDTO exerciseDTO) throws Exception {
		exerciseDTO = exerciseService.getExerciseVideo(exerciseDTO);
		mv.setViewName("exercise/video");
		mv.addObject("dto", exerciseDTO);
		return mv;
	}
	//list : 짧강효확 보내기 
	@GetMapping("body")
	public ModelAndView getExerciseBody(ExerciseDTO exerciseDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ExerciseDTO> ar = exerciseService.getExerciseList();
		mv.setViewName("exercise/body");
		mv.addObject("exercise", ar);
		return mv;
	}
	
	@GetMapping("info")
	public ModelAndView getExerciseInfo(ModelAndView mv, ExerciseDTO exerciseDTO)throws Exception{
		//exerciseDTO = exerciseService.getExerciseVideo(exerciseDTO);
		//List<ExerciseDTO> ar = exerciseService.getExerciseBody();
		//List<ExerciseDTO> ar2 = exerciseService.getExerciseMachine();

		//mv.setViewName("exercise/detail/info");
		//mv.addObject("machineList", ar2);
		mv.addObject("detailList", exerciseDTO);
		return mv;
		
	}
	
	@PostMapping("add")
	public ModelAndView setExerciseAdd(ModelAndView mv, ExerciseDTO exerciseDTO, MultipartFile [] Files, HttpSession session, HealthMachineDTO healthMachineDTO)throws Exception{
		int result = exerciseService.setExerciseAdd(exerciseDTO, Files, session, healthMachineDTO);
		String message="실패";
		if(result>0) {
			message="성공";
		}
		mv.addObject("url","./calendar");
		mv.addObject("result", message);
		mv.setViewName("common/result");
		return mv;
	}
	@GetMapping("add")
	public ModelAndView setExerciseAdd(HttpSession session, ExerciseDTO exerciseDTO)throws Exception{
	    ModelAndView mv = new ModelAndView();
	    List<ExerciseDTO> ar = exerciseService.getExerciseMachine(); 
	    //List<ExerciseDTO> ar2= exerciseService.getExerciseList();
	    for(int i=0; i<ar.size(); i++) {
	    	System.out.println(ar.get(i).getMachineName());
	    	System.out.println(ar.get(i).getMachineNum());
	    	System.out.println(ar.get(i).getBodyPart());
	    	System.out.println(ar.get(i).getCoordinate());
	    }
	    //mv.addObject("exerciseList",ar2);
	    mv.addObject("machineList", ar);
	    mv.setViewName("exercise/add");
	    return mv;
	}
//
//	//이달의 루틴 및 짧강효확 add 페이지 영상등록시 DB저장 목록들 불러오기  
//	@PostMapping("machine")
//	public ModelAndView getExerciseMachine(HttpSession session, ExerciseDTO exerciseDTO)throws Exception{
//		ModelAndView mv = new ModelAndView();
//		
//		mv.addObject("exerciseDTO", exerciseDTO);
//		mv.setViewName("exercise/add");
//		return mv;
//	}
//	
//	@GetMapping("add")
//	public ModelAndView setExerciseAdd(HttpSession session, ExerciseDTO exerciseDTO)throws Exception{
//	    ModelAndView mv = new ModelAndView();
//	    List<ExerciseDTO> ar = exerciseService.getExerciseMachine(); 
//	   // List<ExerciseDTO> ar = exerciseService.getExerciseList();
//	    for(int i=0; i<ar.size(); i++) {
//	    	System.out.println(ar);
//	    	System.out.println(ar.get(i).getHealthMachineDTOs().get(0).getMachineName());
//	    }
//	    mv.addObject("exerciseList", ar);
//	    mv.setViewName("exercise/add");
//	    return mv;
//
//	}

}
	
//	@PostMapping("routineName")
//	public ModelAndView getExerciseList(ModelAndView mv, ExerciseDTO exerciseDTO) throws Exception{
//		List<ExerciseDTO> ar = exerciseService.getExerciseList();
//		mv.addObject("dto", ar);
//		mv.setViewName("common/exerciAdd");
//		return mv;
//	}

//	

	
	// 이달의 루틴 add
//	@GetMapping("add")
//	public ModelAndView setExerciseAdd(HttpSession session)throws Exception{
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("exercise/add");
//		return mv;
//	}



