package com.goody.diet.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("login")
	public String setMemberLogin() throws Exception {
		return "/member/login";
	}
	@PostMapping("login")
	public ModelAndView setMemberLogin(ModelAndView mv, MemberDTO memberDTO, HttpSession session) throws Exception {
		memberDTO = memberService.setMemberLogin(memberDTO);
		if(memberDTO!=null) {
			session.setAttribute("sessionMember", memberDTO);			
		}
		mv.setViewName("redirect:../");
		
		return mv;
	}

	@GetMapping("join")
	public String setMemberJoin() throws Exception {
		return "/member/join";
	}
	public ModelAndView setMemberJoin(MemberDTO memberDTO, ModelAndView mv) throws Exception {
		int result = memberService.setMemberJoin(memberDTO);
		
		mv.setViewName("redirect:../");
		mv.addObject("result", result);
		return mv;
	}

}
