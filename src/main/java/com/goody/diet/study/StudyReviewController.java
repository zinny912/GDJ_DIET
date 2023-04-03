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
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<StudyReviewDTO> ar = studyReviewService.getBoardList(pager);

		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("studyReview/list");

		return mv;
	}

	@PostMapping("add")
	public ModelAndView setBoardAdd(StudyReviewDTO studyReviewDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("sessionMember");
		System.out.println(memberDTO.getId());
		
		studyReviewDTO.setWriter(memberDTO.getId());
		int result = studyReviewService.setBoardAdd(studyReviewDTO);

		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	@GetMapping("detail")
	public ModelAndView getBoardDetail(StudyReviewDTO studyReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = studyReviewService.setHitUpdate(studyReviewDTO);
		StudyReviewDTO qnaDTO = studyReviewService.getBoardDetail(studyReviewDTO);

		mv.addObject("dto", qnaDTO);
		mv.setViewName("studyReview/detail");
		return mv;
	}



	@PostMapping("update")
	public ModelAndView setBoardUpdate(StudyReviewDTO studyReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
//		MemberDTO memberDTO = (MemberDTO) session.getAttribute("sessionMember");
//		System.out.println(memberDTO.getId());
//		
//		studyReviewDTO.setWriter(memberDTO.getId());
		int result = studyReviewService.setBoardUpdate(studyReviewDTO);

		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	@PostMapping("delete")
	public ModelAndView setBoardDelete(StudyReviewDTO studyReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = studyReviewService.setBoardDelete(studyReviewDTO);
		String message = "삭제 실패";
		if (result > 0) {
			message = "글이 삭제 되었습니다";
		}
		System.out.println(studyReviewDTO.getStudyNum());
		mv.addObject("result", message);
		mv.addObject("url", "/study/studyDetail?studyNum=" + studyReviewDTO.getStudyNum());
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("summerFile")
	public ModelAndView setBoardFileAdd(MultipartFile files,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(files.getOriginalFilename());
		String file = studyReviewService.setBoardFileAdd(files, session);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", file);
		return mv;
	}

}
