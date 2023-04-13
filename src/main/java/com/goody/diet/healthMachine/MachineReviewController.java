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

import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyReviewDTO;
import com.goody.diet.util.Pager;

@Controller
@RequestMapping("/machineReview/**")
public class MachineReviewController {
	
	@Autowired
	private MachineReviewService machineReviewService;
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MachineReviewDTO> ar = machineReviewService.getBoardList(pager);

		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("machineReview/list");

		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(MachineReviewDTO machineReviewDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("sessionMember");
		
		
		machineReviewDTO.setWriter(memberDTO.getId());
		int result = machineReviewService.setBoardAdd(machineReviewDTO);

		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(MachineReviewDTO machineReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = machineReviewService.setHitUpdate(machineReviewDTO);
		MachineReviewDTO qnaDTO = machineReviewService.getBoardDetail(machineReviewDTO);

		mv.addObject("dto", qnaDTO);
		mv.setViewName("machineReview/detail");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setBoardUpdate(MachineReviewDTO machineReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
//		MemberDTO memberDTO = (MemberDTO) session.getAttribute("sessionMember");
//		System.out.println(memberDTO.getId());
//		
//		studyReviewDTO.setWriter(memberDTO.getId());
		int result = machineReviewService.setBoardUpdate(machineReviewDTO);

		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	@PostMapping("delete")
	public ModelAndView setBoardDelete(MachineReviewDTO machineReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = machineReviewService.setBoardDelete(machineReviewDTO);
		String message = "삭제 실패";
		if (result > 0) {
			message = "글이 삭제 되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "/healthMachine/detail?machineNum=" + machineReviewDTO.getMachineNum());
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("summerFile")
	public ModelAndView setBoardFileAdd(MultipartFile files,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String file = machineReviewService.setBoardFileAdd(files, session);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", file);
		return mv;
	}

}
