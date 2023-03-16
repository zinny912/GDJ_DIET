package com.goody.diet.healthMachine;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	public ModelAndView getHealthMachineList(ModelAndView mv) throws Exception{
		List<HealthMachineDTO> ar = healthMachineService.getHealthMachineList();
		mv.addObject("list", ar);
		mv.setViewName("healthMachine/list");
		return mv;
	}
	@GetMapping("add")
	public ModelAndView setHealthMachineAdd(ModelAndView mv) throws Exception{
		mv.setViewName("healthMachine/add");
		return mv;
	}
	@PostMapping("add")
	public ModelAndView setHealthMachineAdd(ModelAndView mv, HealthMachineDTO healthMachineDTO,HttpSession session, MultipartFile [] files) throws Exception{
		int result = healthMachineService.setHealthMachineAdd(healthMachineDTO, files, session);
		mv.setViewName("redirect:./list");
		return mv;
	}
	@GetMapping("detail")
	public ModelAndView getHealthMachineDetail(ModelAndView mv, HealthMachineDTO healthMachineDTO) throws Exception{
		List<HealthMachineDTO> ar = healthMachineService.getHealthMachineDetail(healthMachineDTO);
//		System.out.println(ar.get(0).getMachineName());
		mv.addObject("list", ar);
		mv.setViewName("healthMachine/detail");
		
		return mv;
	}
	@GetMapping("optionAdd")
	public ModelAndView setMachineOptionAdd(ModelAndView mv, HealthMachineDTO healthMachineDTO)throws Exception{
		mv.setViewName("healthMachine/optionAdd");
		return mv;
	}
	@PostMapping("optionAdd")
	public ModelAndView setMachineOptionAdd(ModelAndView mv)throws Exception{
		
		return mv;
	}
}
