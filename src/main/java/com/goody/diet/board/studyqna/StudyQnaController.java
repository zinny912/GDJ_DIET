package com.goody.diet.board.studyqna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.util.Pager;

@Controller
@RequestMapping("/studyQna/**")
public class StudyQnaController {

	@Autowired
	private StudyQnaService studyQnaService;
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BbsDTO> ar = studyQnaService.getBoardList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("studyQna/list");
		
		return mv;
	}
}
