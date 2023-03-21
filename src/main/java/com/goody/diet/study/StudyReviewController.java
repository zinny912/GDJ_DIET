package com.goody.diet.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.board.BbsService;
import com.goody.diet.util.Pager;

@Controller
@RequestMapping("/studyReview/**")
public class StudyReviewController {
	
	@Autowired
	private StudyReviewService studyReviewService;
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<StudyReviewDTO> ar = studyReviewService.getBoardList(pager);
		
		mv.addObject("list",ar);
		mv.addObject("pager", pager);
		mv.setViewName("studyReview/list");
		
		return mv;
	}
	
	

}
