package com.goody.diet.healthMachine;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@RequestMapping(value = "/healthMachine/*")
@Controller
public class HealthMachineController {

	@Autowired
	private HealthMachineService healthMachineService;

	@GetMapping("list")
	public ModelAndView getHealthMachineList(ModelAndView mv,CategoryDTO categoryDTO) throws Exception{
		List<HealthMachineDTO> ar = healthMachineService.getHealthMachineList(categoryDTO);
		mv.addObject("list", ar);
		mv.setViewName("healthMachine/list");
		return mv;
	}
	@GetMapping("detail")
	public ModelAndView getHealthMachineDetail(ModelAndView mv,HealthMachineDTO healthMachineDTO)throws Exception{
		healthMachineDTO =healthMachineService.getHealthMachineDetail(healthMachineDTO);
		mv.addObject("dto", healthMachineDTO);
		mv.setViewName("healthMachine/detail");
		return mv;
	}
	@GetMapping("add")
	public ModelAndView setHealthMachineAdd(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("healthMachine/add");
		return mv;
	}

	@PostMapping("add")
	public ModelAndView setHealthMachineAdd(ModelAndView mv, HealthMachineDTO healthMachineDTO, MultipartFile [] Files, HttpSession session)throws Exception{
		int result = healthMachineService.setHealthMachineAdd(healthMachineDTO, Files, session);
		String message="실패";
		if(result>0) {
			message="성공";
		}
		mv.addObject("url","./list");
		mv.addObject("result", message);
		mv.setViewName("common/result");
		return mv;
	}


	//	----------------option-----------------------------------
	@PostMapping("option1")
	public ModelAndView getOption1(ModelAndView mv, RealHealthMachineDTO realHealthMachineDTO)throws Exception{

		List<RealHealthMachineDTO> ar = healthMachineService.getOption1(realHealthMachineDTO);
		mv.addObject("optList", ar);
		mv.setViewName("common/optionReply");
		return mv;
	}
	@PostMapping("option2")
	public ModelAndView getOption2(ModelAndView mv, RealHealthMachineDTO realHealthMachineDTO)throws Exception{

		List<RealHealthMachineDTO> ar = healthMachineService.getOption2(realHealthMachineDTO);
		mv.addObject("optList", ar);
		mv.setViewName("common/optionReply");
		return mv;
	}
	@PostMapping("option3")
	public ModelAndView getOption3(ModelAndView mv, RealHealthMachineDTO realHealthMachineDTO)throws Exception{

		List<RealHealthMachineDTO> ar = healthMachineService.getOption3(realHealthMachineDTO);
		mv.addObject("optList", ar);
		mv.setViewName("common/optionReply");
		return mv;
	}
	@PostMapping("option4")
	public ModelAndView getOption4(ModelAndView mv, RealHealthMachineDTO realHealthMachineDTO)throws Exception{

		List<RealHealthMachineDTO> ar = healthMachineService.getOption4(realHealthMachineDTO);
		mv.addObject("optList", ar);
		mv.setViewName("common/optionReply");
		return mv;
	}
	@GetMapping("optionAdd")
	public ModelAndView setOptionAdd(ModelAndView mv, HealthMachineDTO healthMachineDTO)throws Exception{
		healthMachineDTO= healthMachineService.getHealthMachineDetail(healthMachineDTO);
		mv.addObject("dto", healthMachineDTO);
		mv.setViewName("healthMachine/optionAdd");
		return mv;
	}
	@PostMapping("optionAdd")
	public ModelAndView setOptionAdd(ModelAndView mv, RealHealthMachineDTO realHealthMachineDTO,MultipartFile [] Files, HttpSession session)throws Exception{
		int result = healthMachineService.setOptionAdd(realHealthMachineDTO, Files, session);
		
		String message="실패";
		if(result>0) {
			message="성공";
		}
		mv.addObject("url","./detail?machineNum="+realHealthMachineDTO.getMachineNum());
		mv.addObject("result", message);
		mv.setViewName("common/result");
		return mv;
		
	}
}
