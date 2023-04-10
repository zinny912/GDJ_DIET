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
import com.goody.diet.study.StudyDTO;



@Controller
@RequestMapping(value="/exercise/*")
public class ExerciseController {
	@Autowired
	private ExerciseService exerciseService;
	
	//짧강효확 리스트 첫 페이지 
	@GetMapping("body")
	public ModelAndView getBodyList(ModelAndView mv, BodyDTO bodyDTO) throws Exception{
		List<BodyDTO> ar = exerciseService.getBodyList();
		mv.addObject("body", ar);
		mv.setViewName("exercise/body");
		return mv;
	}
	//짧강효확 상세페이지 
	@GetMapping("info")
	public ModelAndView getExerciseTypeList(ModelAndView mv, ExerciseDTO exerciseDTO) throws Exception{
		System.out.println(exerciseDTO.getBodyNum());
//		exerciseDTO=exerciseService.getExerciseDetail(exerciseDTO);
		List<ExerciseDTO> ar = exerciseService.getExerciseTypeList(exerciseDTO);
		mv.addObject("body",ar);
		mv.setViewName("exercise/info");
		return mv;
	}
	//짧강효확 비디오 페이지 
	@GetMapping("video")
	public ModelAndView getBodyVideo(ModelAndView mv, ExerciseDTO exerciseDTO) throws Exception {
		exerciseDTO = exerciseService.getBodyVideo(exerciseDTO);
		mv.setViewName("exercise/video");
		mv.addObject("dto", exerciseDTO);
		return mv;
	}
	// 짧강효확 추가 
	@GetMapping("add")
	public ModelAndView setExerciseAdd(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BodyDTO> ar= exerciseService.getBodyList();
		System.out.println("aaa:" +ar.get(0).getBodyNum());
		mv.addObject("body",ar);
		mv.setViewName("exercise/add");
		return mv;
	}
	@GetMapping("machineList")
	public ModelAndView getExerciseMachine() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ExerciseDTO> ar = exerciseService.getExerciseMachine();
		System.out.println("MachineName:" + ar.get(0).getMachineName());
		mv.addObject("body",ar);
		mv.setViewName("exercise/add");
		mv.setViewName("exercise/update");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setExerciseAdd(HttpSession session, ExerciseDTO exerciseDTO, MultipartFile [] Files,HealthMachineDTO healthMachineDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(exerciseDTO.getBodyNum());
		int result = exerciseService.setExerciseAdd(exerciseDTO, Files, session, healthMachineDTO);
		//System.out.println("카테고리 머신 : " + bodyDTO.getBodyNum());
		System.out.println("헬스머신 넘 : "+exerciseDTO.getNum());
		String message="실패";
		if(result>0) {
			message="성공";
		}
		mv.addObject("url","./info?bodyNum="+exerciseDTO.getBodyNum());
		mv.addObject("result",message);
		mv.setViewName("common/result");
		return mv;
	}
	// 짧강효확 수정 
	@GetMapping("update")
	public ModelAndView setExerciseUpdate(ExerciseDTO exerciseDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		exerciseDTO = exerciseService.getExerciseDetail(exerciseDTO);
		mv.addObject("dto", exerciseDTO);
		
		mv.setViewName("exercise/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setExerciseUpdate(ExerciseDTO exerciseDTO, MultipartFile[] addFiles, HttpSession session, Long fileNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(fileNum);
		int result = exerciseService.setExerciseUpdate(exerciseDTO, addFiles, session, fileNum);
		mv.setViewName("common/result");
		mv.addObject("result", "수정성공");
		mv.addObject("url", "./update?num="+exerciseDTO.getNum());
		
		return mv;
	}

	@PostMapping("delete")
	public ModelAndView setExerciseDelete(ExerciseDTO exerciseDTO, Long fileNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(exerciseDTO.getNum());
		int result = exerciseService.setExerciseDelete(exerciseDTO, fileNum);
		mv.setViewName("common/result");
		mv.addObject("result", "삭제성공");
		mv.addObject("url", "./info?bodyNum="+exerciseDTO.getBodyNum());
		return mv;
	}

}	
