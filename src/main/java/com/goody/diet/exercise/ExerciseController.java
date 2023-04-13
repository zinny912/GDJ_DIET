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
	//exerciseDTO가 아닌 bodyDTO타입으로 리스트를 받아야함
	//exerciseDTO로 bodyNum을 받으면 처음 서버를키고 exerciseDTO에있는 bodyDTO<List>에 있는 setBodyNum으로 bodyNum이 들어가려하는데 타입이 맞지 않기 때문에 null이뜸
	//그렇기때문에 bodyDTO로 받아야함
	@GetMapping("info")
	public ModelAndView getExerciseTypeList(ModelAndView mv, BodyDTO bodyDTO) throws Exception{
//		System.out.println(exerciseDTO.getBodyNum());
//		exerciseDTO=exerciseService.getExerciseDetail(exerciseDTO);
		//위의 코드들은 보통 service에서 합친다! 그렇기때문에 보통 controller에선 파라미터만 서비스로 보내는 역할을 함.
		List<ExerciseDTO> ar = exerciseService.getExerciseTypeList(bodyDTO);
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
		List<HealthMachineDTO> machines = exerciseService.getHealthMachineList();
		mv.addObject("body",ar);
		mv.addObject("machines", machines);
		mv.setViewName("exercise/add");
		return mv;
	}
	
	@PostMapping("add")//bodyNum 여러개로 변경하였습니다.
	public ModelAndView setExerciseAdd(HttpSession session, ExerciseDTO exerciseDTO, MultipartFile [] Files,Long [] bodyNum)throws Exception{
		ModelAndView mv = new ModelAndView();		//Long타입으로 받는이유 : html에서 name 여러개일때 배열로 받아야 하는데 dto타입은 모두 list로 setter를 만들어 놓았기 때문에 list로 받을 수 없다 그렇기 때문에 번호만(Num)만 추출하여 service 에서 각각의 타입에 대입해야함
		
//		
		int result = exerciseService.setExerciseAdd(session, exerciseDTO, Files, bodyNum);
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
		
		System.out.println(exerciseDTO.getNum());
		exerciseDTO = exerciseService.getExerciseDetail(exerciseDTO);//현재 있는 exerciseDTO
		List<BodyDTO> ar= exerciseService.getBodyList();//전체 body리스트
		List<HealthMachineDTO> machines = exerciseService.getHealthMachineList();//전체 machine리스트
		mv.addObject("bodyList", ar);
		mv.addObject("machines", machines);
		mv.addObject("dto", exerciseDTO);
		mv.setViewName("exercise/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setExerciseUpdate(ExerciseDTO exerciseDTO, MultipartFile[] Files, HttpSession session,Long [] bodyNum) throws Exception{
		ModelAndView mv = new ModelAndView();

		int result = exerciseService.setExerciseUpdate(exerciseDTO,Files,session,bodyNum);
		mv.setViewName("common/result");
		mv.addObject("result", "수정성공");
		mv.addObject("url", "./info?bodyNum="+exerciseDTO.getBodyNum());
		
		return mv;
	}

	@PostMapping("delete")
	public ModelAndView setExerciseDelete(ExerciseDTO exerciseDTO, Long fileNum,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();

		int result = exerciseService.setExerciseDelete(exerciseDTO, fileNum,session);
		mv.setViewName("common/result");
		mv.addObject("result", "삭제성공");
		mv.addObject("url", "./info?bodyNum="+exerciseDTO.getBodyNum());
		return mv;
	}

}	
