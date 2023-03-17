package com.goody.diet.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.util.Pager;


@Controller
@RequestMapping("/study/")
public class StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@GetMapping("studyList")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<BbsDTO> ar  = studyService.getBoardList(pager);
		
		mv.setViewName("study/studyList");
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		return mv;
	}
	
	@GetMapping("studyDetail")
	public ModelAndView getBoardDetail(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		StudyDTO studyDTO = studyService.getBoardDetail(pager);
		
		mv.setViewName("study/studyDetail");
		mv.addObject("dto", studyDTO);
		
		return mv;
	}
} 
