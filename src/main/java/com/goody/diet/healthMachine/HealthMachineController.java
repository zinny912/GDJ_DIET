package com.goody.diet.healthMachine;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
	@PostMapping("RealMachineList")
	public ModelAndView getRealHealthMachineList(ModelAndView mv,HealthMachineDTO healthMachineDTO)throws Exception{
		healthMachineDTO = healthMachineService.getRealHealthMachineList(healthMachineDTO);
		
		mv.addObject("dto",healthMachineDTO);
		mv.setViewName("common/realHealthMachineList");
		return mv;
	}
	@PostMapping("filterOption")//옵션 선택해서 리스트 뽑아오기
	public ModelAndView getRealHealthMachineFilterList(ModelAndView mv,RealHealthMachineDTO realHealthMachineDTO)throws Exception{
		List<RealHealthMachineDTO> ar= healthMachineService.getRealHealthMachineList(realHealthMachineDTO);
		HealthMachineDTO healthMachineDTO = new HealthMachineDTO();
		healthMachineDTO.setMachineNum(realHealthMachineDTO.getMachineNum());
		healthMachineDTO= healthMachineService.getHealthMachineDetail(healthMachineDTO);
		healthMachineDTO.setRealHealthMachineDTOs(ar);
		mv.addObject("dto",healthMachineDTO);
		mv.setViewName("common/realHealthMachineList");
		return mv;
		
	}
	@GetMapping("detail")
	public ModelAndView getHealthMachineDetail(ModelAndView mv,HealthMachineDTO healthMachineDTO)throws Exception{
		healthMachineDTO =healthMachineService.getHealthMachineDetail(healthMachineDTO);
		Long review = healthMachineService.getMachineReviewCount(healthMachineDTO);
		Long qna = healthMachineService.getMachineQnaCount(healthMachineDTO);

		mv.addObject("dto", healthMachineDTO);
		mv.addObject("review", review);
		mv.addObject("qna", qna);
		mv.setViewName("healthMachine/detail");
		return mv;
	}
	@GetMapping("add")
	public ModelAndView setHealthMachineAdd(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CategoryDTO> ar= healthMachineService.getCategoryList();
		mv.addObject("category",ar);
		mv.setViewName("healthMachine/add");
		return mv;
	}
	@GetMapping("categoryAdd")
	public ModelAndView getCategoryList(ModelAndView mv)throws Exception{
		List<CategoryDTO> ar = healthMachineService.getCategoryList();
		
		mv.addObject("list",ar);
		mv.setViewName("common/categoryResult");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setHealthMachineAdd(ModelAndView mv, HealthMachineDTO healthMachineDTO,Long []  categoryDTOs, MultipartFile [] Files, HttpSession session)throws Exception{
		
		int result = healthMachineService.setHealthMachineAdd(healthMachineDTO, Files, session, categoryDTOs);
		//		System.out.println("카테고리 머신 : " + categoryDTO.getMachineNum());
		//		System.out.println("헬스머신 넘 : "+healthMachineDTO.getMachineNum());
		String message="실패";
		if(result>0) {
			message="성공";
		}
		mv.addObject("url","./list");
		mv.addObject("result", message);
		mv.setViewName("common/result");
		return mv;
	}

	@PostMapping("delete")
	public ModelAndView setHealthMachineDelete(ModelAndView mv, HealthMachineDTO healthMachineDTO, HttpSession session)throws Exception{
		int result = healthMachineService.setHealthMachineDelete(healthMachineDTO, session);
		String mes = "삭제실패";
		if(result>0) {
			mes = "삭제성공";

		}
		mv.addObject("result", mes);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");

		return mv;
	}
	@PostMapping("categoryTypeDelete")
	public ModelAndView setcategoryTypeDelete(ModelAndView mv, CategoryDTO categoryDTO)throws Exception{
		int result = healthMachineService.setcategoryTypeDelete(categoryDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	@GetMapping("update")
	public ModelAndView setHealthMachineUpdate(ModelAndView mv,HealthMachineDTO healthMachineDTO) throws Exception{
		healthMachineDTO = healthMachineService.getHealthMachineDetail(healthMachineDTO);
		
		mv.addObject("dto", healthMachineDTO);
		mv.setViewName("healthMachine/update");
		return mv;
	}
	@PostMapping("update")
	public ModelAndView  setHealthMachineUpdate(ModelAndView mv, HealthMachineDTO healthMachineDTO,Long []  categoryDTOs, Long thumnailNum, MultipartFile [] Files, Long [] fileNum, HttpSession session)throws Exception{
		int result = healthMachineService.setHealthMachineUpdate(healthMachineDTO, categoryDTOs, thumnailNum, Files, fileNum,session);
		String mes = "업데이트 실패";
		if(result>0) {
			mes = "업데이트 성공";

		}
		mv.addObject("result", mes);
		mv.addObject("url", "./list");
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
		RealHealthMachineDTO realHealthMachineDTO = new RealHealthMachineDTO();
		realHealthMachineDTO.setMachineNum(healthMachineDTO.getMachineNum());

		List<RealHealthMachineDTO> ar1 = healthMachineService.getOption1(realHealthMachineDTO);
		List<RealHealthMachineDTO> ar2 = healthMachineService.getOption2(realHealthMachineDTO);
		List<RealHealthMachineDTO> ar3 = healthMachineService.getOption3(realHealthMachineDTO);
		List<RealHealthMachineDTO> ar4 = healthMachineService.getOption4(realHealthMachineDTO);

		mv.addObject("dto", healthMachineDTO);
		mv.addObject("optList1", ar1);
		mv.addObject("optList2", ar2);
		mv.addObject("optList3", ar3);
		mv.addObject("optList4", ar4);
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
		//post여도 파라미터 값 넘기기 가능
		mv.addObject("result", message);
		mv.setViewName("common/result");
		return mv;

	}

	@PostMapping("optionDelete")
	public ModelAndView setOptionDelete(ModelAndView mv, RealHealthMachineDTO realHealthMachineDTO) throws Exception{
		System.out.println(realHealthMachineDTO.getOptId1());
		System.out.println(realHealthMachineDTO.getOptId2());
		System.out.println(realHealthMachineDTO.getOptId3());
		System.out.println(realHealthMachineDTO.getOptId4());
		
		int result =healthMachineService.setRealHealthMachineDelete(realHealthMachineDTO);

		String message="실패";
		if(result>0) {
			message="성공";
		}
//		mv.addObject("url","./detail?machineNum="+realHealthMachineDTO.getMachineNum());
////		mv.addObject("result", message);
////		mv.setViewName("common/result");
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;

	}
	
	@PostMapping("summerFile")
	public ModelAndView setBoardFileAdd(MultipartFile files,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String file = healthMachineService.setBoardFileAdd(files, session);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", file);
		return mv;
	}

}
