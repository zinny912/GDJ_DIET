package com.goody.diet.member;

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
	public ModelAndView setMemberLogin(ModelAndView mv, MemberDTO memberDTO) throws Exception {
		memberService.setMemberLogin(memberDTO);
		return mv;
	}

}
