package com.goody.diet.exercise;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/routine/*")
public class RoutineController {
	
	@Autowired
	private RoutineService routineService;
	
	// 루틴 리스트 캘린더에 뿌리기
	@GetMapping("calendar")
	public ModelAndView getRoutineList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<RoutineDTO> ar = routineService.getRoutineList();
		mv.setViewName("routine/calendar");
		mv.addObject("routine", ar);
		return mv;
	}
	@GetMapping("/list")
	public ModelAndView getSelectList(RoutineDTO routineDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<RoutineDTO> ar = routineService.getSelectList();
		mv.setViewName("routine/list");
		return mv;
	}
	
	
	//이달의 루틴영상 play page  - routine detail 
	@GetMapping("video")
	public ModelAndView getRoutineVideo(ModelAndView mv, RoutineDTO routineDTO) throws Exception {
		routineDTO = routineService.getRoutineVideo(routineDTO);
		mv.setViewName("routine/video");
		mv.addObject("dto", routineDTO);
		return mv;
	}
	// 루틴 등록 
	// JSON 데이터를 받아서 Java 객체로 변환하고 MyBatis를 사용하여 DB에 저장하는 메소드
//    @PostMapping("/routineAdd")
//    @ResponseBody
//    public String saveData(@RequestBody List<RoutineDTO> routineDTOs) {
//        for (RoutineDTO routineDTO : routineDTOs) {
//            routineService.saveRoutine(routineDTO);
//        }
//        return "success";
//    }
	

	
	@GetMapping("add")
	public ModelAndView setRoutineAdd() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("routine/add");
		return mv;
	}

	@PostMapping("add")
	public ModelAndView setRoutineAdd(ModelAndView mv, RoutineDTO routineDTO, HttpSession session) throws Exception {
		int result = routineService.setRoutineAdd(routineDTO, session);
		
		String message="실패";
		if(result>0) {
			message="성공";
		}
		mv.addObject("result", message);
		mv.setViewName("common/result");
		return mv;	
	}
	
	@GetMapping("update")
	public ModelAndView setRoutineUpdate(ModelAndView mv, RoutineDTO routineDTO, HttpSession session) throws Exception {
		routineDTO = routineService.getRoutineVideo(routineDTO);
		List<RoutineDTO> ar = routineService.getSelectList();
		//mv.addObject("dto", routineDTO);
		System.out.println(ar);
		mv.addObject("list", ar);
		mv.setViewName("routine/update");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView  setRoutineUpdate(RoutineDTO routineDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = routineService.setRoutineUpdate(routineDTO, session);
		String msg = "업데이트 실패";
		if(result>0) {
			msg = "업데이트 성공";
		}
		mv.addObject("result", msg);
		mv.addObject("url", "./calendar");
		mv.setViewName("common/result");
		return mv;
	}
	
	
	
//	@PostMapping("add")
//	public ModelAndView setRoutineAdd(ModelAndView mv, @RequestBody String eventData, HttpSession session) throws Exception {
//	    ObjectMapper objectMapper = new ObjectMapper();
//	    RoutineDTO routineDTO = objectMapper.readValue(eventData, RoutineDTO.class);
//	    int result = routineService.setRoutineAdd(routineDTO, session);
//	    String message = "실패";
//	    if(result > 0) {
//	        message = "성공";
//	    }
//	    mv.addObject("url", "./calendar");
//	    mv.addObject("result", message);
//
//	    List<HealthMachineDTO> machineList = routineService.getRoutineMachine();
//	    mv.addObject("machineList", machineList);
//
//	    mv.setViewName("routine/routindAdd");
//	    return mv;
//	}


	
//	@GetMapping("machineAdd")
//	public ModelAndView getRoutineMachine(ModelAndView mv) throws Exception {
//		List<HealthMachineDTO> ar = routineService.getRoutineMachine();
//		mv.addObject("machine",ar);
//		mv.setViewName("common/machineList");
//		return mv;
//	}
	
//	@PostMapping("add")
//	public ModelAndView setRoutineAdd(ModelAndView mv, RoutineDTO routineDTO, HttpSession session) throws Exception {
//	    int result = routineService.setRoutineAdd(routineDTO, session);
//	    String message = "실패";
//	    if(result > 0) {
//	        message = "성공";
//	    }
//	    mv.addObject("url", "./calendar");
//	    mv.addObject("result", message);
//
//	    List<HealthMachineDTO> machineList = routineService.getRoutineMachine();
//	    mv.addObject("machineList", machineList);
//
//	    mv.setViewName("routine/add");
//	    return mv;
//	}
//	@GetMapping("add")
//	public ModelAndView setRoutineAdd(HttpSession session) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		List<HealthMachineDTO> ar = routineService.getRoutineMachine();
//		    mv.addObject("machineList", ar);
//		    mv.setViewName("routine/add");
//		    return mv;
//	
//	}

	
}
