package com.goody.diet.exercise;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView setRoutineAdd(ModelAndView mv, ExerciseDTO exerciseDTO, MultipartFile [] Files, HttpSession session)throws Exception{
		int result = exerciseService.setExerciseAdd(exerciseDTO, Files, session, exerciseDTO);
		String message="실패";
		if(result>0) {
			message="성공";
		}
		mv.addObject("url","./routine");
		mv.addObject("result", message);
		mv.setViewName("common/result");
		return mv;
	}
	@GetMapping("add")
	public ModelAndView setRoutineAdd(HttpSession session, ExerciseDTO exerciseDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("exercise/add");
	    return mv;
	}
	
	
	@PostMapping("routineAdd")
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
	@GetMapping("routineAdd")
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
	    mv.setViewName("exercise/routineAdd");
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

//
//@ResponseBody
//@PostMapping("add")
//public List<Map<String, Object>> test(
//		@RequestBody List<Map<String, Object>> param) {
//	
//	return param;
//}
//@Autowired
//private SqlSession sqlSession;

//@RequestMapping(value = "/ajaxTest", method = RequestMethod.POST)
//@ResponseBody // 서버에서 클라이언트에게 응답 데이터를 전송하기 위해서 사용
//public HashMap<String, Object> ajaxTest ( HttpServletRequest request ) {
//	
//	Enumeration<?> requestData = request.getParameterNames(); // Ajax 를 통해 온 key 값 저장
//	
//	HashMap<String, Object> resultMap = new HashMap<String, Object>(); // Client 에 보내줄 Map
//	HashMap<String, Object> dbSaveDataMap = new HashMap<String, Object>(); // DB 에 저장할 Map
//	
//	while (requestData.hasMoreElements()) {
//		String key = requestData.nextElement().toString(); // Ajax 에서 보낸 key 값
//		
//		String data = request.getParameter(key); // Ajax 에서 보낸 data 값
//		
//		dbSaveDataMap.put(key, data); // Map 저장
//	}
//	testDao dao = sqlSession.getMapper(testDao.class);
//	
//	// 저장할 데이터가 없으면 0, 있으면 Insert 한 갯수 ( ex : 1 )
//	resultMap.put("status", dbSaveDataMap.size() != 0 ? dao.writeTest(dbSaveDataMap) : 0);
//			
//	return resultMap;
//}

//AJAX로 데이터 저장
//@PostMapping("/add")
//public void setExerciseAdd(@RequestBody Routine routine) {
//    exerciseService.setExerciseAdd();
//}


//list : 이달의 루틴 테이블에 list 출력 
//@GetMapping("routine")
//public ModelAndView getCalendarList(ModelAndView mv) throws E {
//	  List<ExerciseDTO> calendar = null;
//	  try {
//	    calendar = exerciseService.getExerciseList();
//	    mv.addObject("exerciseList", calendar);
//	  } catch (Exception e) {
//	    e.printStackTrace();
//	  }
//	  mv.setViewName("exercise/routine");
//	  return mv;
//	}

