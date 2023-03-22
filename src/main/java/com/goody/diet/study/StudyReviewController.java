package com.goody.diet.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.board.BbsService;
import com.goody.diet.util.Pager;
import com.goody.diet.member.MemberDTO;

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
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(StudyReviewDTO studyReviewDTO, MultipartFile[] addFiles,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("member");
		//bankBookCommentDTO.setWriter(memberDTO.getId());
		studyReviewDTO.setWriter(memberDTO.getId());
		System.out.println("num : "+studyReviewDTO.getStudyNum());
		int result = studyReviewService.setBoardAdd(studyReviewDTO, addFiles, session);
		
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	

}
