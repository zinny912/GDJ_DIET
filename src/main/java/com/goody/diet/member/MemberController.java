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

	
//그냥 JS에서 할게요...ㅠ
//	@RequestMapping(value = "kakaoLogin")
//    public String kakaoLogin() throws Exception {
//    	System.out.println("왔어...");
////    	String kakaoUrl="https://kauth.kakao.com/oauth/authorize?client_id=4dbfcfd2f5a649a659ccd93aa0364e69&redirect_uri=https://localhost/oauth&response_type=code";
////    	String url = "/member/kakao";
////    	return kakaoUrl;
//    	
//    	String restAPI="4dbfcfd2f5a649a659ccd93aa0364e69";
//        StringBuffer loginUrl = new StringBuffer();
//        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
//        loginUrl.append(restAPI); //REST API
//        loginUrl.append("&redirect_uri=");
//        loginUrl.append("https://localhost/oauth"); //redirect URL
//        loginUrl.append("&response_type=code");
//        
//        return "redirect:"+loginUrl.toString();
//    }	

	
	
//------------------카카오 끝----------------------
	
	@GetMapping("dummiHome")
	public String dummiHome() throws Exception {
		return "/member/dummiHome";
	}
	
	@GetMapping("agree")
	public ModelAndView setMemberAgree(ModelAndView mv) throws Exception {
		mv.setViewName("member/agree");
		return mv;
	}
	
	@GetMapping("login")
	public String setMemberLogin() throws Exception {
		return "/member/login";
	}
	@PostMapping("login")
	public ModelAndView getMemberLogin(ModelAndView mv, MemberDTO memberDTO, HttpSession session) throws Exception {
//		System.out.println("컨트롤러왔니..?");
		memberDTO = memberService.getMemberLogin(memberDTO);
		if(memberDTO!=null) {
			session.setAttribute("sessionMember", memberDTO);			
		}
		mv.setViewName("redirect:./dummiHome");
		
		return mv;
	}
	@GetMapping("logout")
	public String getMemberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:./dummiHome";
	}
	
	@GetMapping("myPage")
	public ModelAndView getMyPage(ModelAndView mv, HttpSession session) throws Exception {
		
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		if(memberDTO!=null) {
			memberDTO = memberService.getMyPage(memberDTO);
		}
		mv.addObject("mypage",memberDTO );
		mv.setViewName("/member/myPage");
		return mv;
	}

	@PostMapping("idCheck")
	public ModelAndView getIdCheck (MemberDTO memberDTO, ModelAndView mv) throws Exception {
//		System.out.println(memberDTO.getId());
		String result = memberService.getIdCheck(memberDTO);
//		System.out.println(result);
		mv.addObject("result", result);
		mv.setViewName("/member/ajaxResult");
		return mv;
	}
	@PostMapping("emailCheck")
	public ModelAndView getEmailCheck (MemberDTO memberDTO, ModelAndView mv) throws Exception {
//		System.out.println(memberDTO.getId());
		String result = memberService.getEmailCheck(memberDTO);
//		System.out.println(result);
		mv.addObject("result", result);
		mv.setViewName("/member/ajaxResult");
		return mv;
	}
	
	@GetMapping("join")
	public String setMemberJoin() throws Exception {
		return "/member/join";
	}
	@PostMapping("join")
	public ModelAndView setMemberJoin(MemberDTO memberDTO, ModelAndView mv) throws Exception {
		int result = memberService.setMemberJoin(memberDTO);
		
		System.out.println(memberDTO.getAddress());
		
		mv.setViewName("redirect:../");
		mv.addObject("result", result);
		return mv;
	}

}
