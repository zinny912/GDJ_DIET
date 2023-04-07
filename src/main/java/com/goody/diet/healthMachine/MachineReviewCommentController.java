package com.goody.diet.healthMachine;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.member.MemberDTO;
import com.goody.diet.util.Pager;

@Controller
@RequestMapping("/machineReviewComment/*")
public class MachineReviewCommentController {

	@Autowired
	private MachineReviewCommentService commentService;

	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView getBoardList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MachineReviewCommentDTO> ar = commentService.getBoardList(pager);
		
		mv.addObject("list",ar);
		mv.setViewName("common/commentList");
		
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(MachineReviewCommentDTO commentDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		//bankBookCommentDTO.setWriter(memberDTO.getId());
		commentDTO.setWriter(memberDTO.getId());
		int result = commentService.setBoardAdd(commentDTO);	
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setBoardDelete(MachineReviewCommentDTO commentDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = commentService.setBoardDelete(commentDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}	
}
