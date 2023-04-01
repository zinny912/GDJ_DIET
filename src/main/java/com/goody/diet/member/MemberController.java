package com.goody.diet.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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


	@PostMapping("kakaoLogin")
	public ModelAndView getKakaoLogin(ModelAndView mv, MemberDTO memberDTO, HttpSession session) throws Exception {
		System.out.println("카카오왓니?");
		memberDTO = memberService.getKakaoLogin(memberDTO);
		if(memberDTO!=null) {
			memberService.getMyPage(memberDTO);
			session.setAttribute("sessionMember", memberDTO);	
		}
		mv.setViewName("redirect:/");

//		MemberAuthDTO result = (MemberAuthDTO)session.getAttribute("sessionMember");
//		System.out.println("세션: "+result.getEmail());
		return mv;
	}
//------------------카카오 끝----------------------
	
	
	@GetMapping("dummiHome")
	public String dummiHome() throws Exception {
		return "/member/dummiHome";
	}

	@PostMapping("delete")
	public ModelAndView setMemberDelete(ModelAndView mv, HttpSession session) throws Exception {
		System.out.println("post delete 왓니?");
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		int delResult=memberService.setMemberDelete(memberDTO);
		session.invalidate();
		
		System.out.println("del ajax 가니?: " +delResult);
		mv.addObject("result", delResult);
		mv.setViewName("/member/ajaxResult");
		return mv;
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
//		System.out.println("ajax옴?: "+memberDTO.getPw());
//		memberDTO.setLoginType("general"); //내가젖소..ㅠ
		System.out.println(memberDTO.getPw());
		memberDTO = memberService.getMemberLogin(memberDTO);
		System.out.println("----------getMemberLogin---------");
//		System.out.println("타입: "+memberDTO.getLoginType());
		
		if(memberDTO!=null) {
//			memberService.getMyPage(memberDTO);
			session.setAttribute("sessionMember", memberDTO);			
//			mv.setViewName("redirect:./dummiHome");
//			MemberDTO result = (MemberDTO)session.getAttribute("sessionMember");
//			System.out.println("세션: "+result+" 이메일"+result.getEmail());	
			
			mv.addObject("result", "굳^^");
			mv.setViewName("/member/ajaxResult");
		}else {//로그인실패
			mv.addObject("result", "id/pw불일치"); //trim인데 띄어쓰기댐?
			mv.setViewName("/member/ajaxResult");
		}
		
		
		
		return mv;
	}
	@GetMapping("logout")
	public String getMemberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("myPage")
	public ModelAndView getMyPage(ModelAndView mv, HttpSession session) throws Exception {
		
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		
		System.out.println("로그인타입: "+memberDTO.getLoginType());
		
		
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
	
		System.out.println("join result값: "+result);
		
		//주소록에도 복제
		if(result==1) {
		DeliveryDTO deliveryDTO = new DeliveryDTO();
		deliveryDTO.setId(memberDTO.getId());
		deliveryDTO.setAddress(memberDTO.getAddress());
		deliveryDTO.setRecipient(memberDTO.getNames());
		deliveryDTO.setRecipientTel(memberDTO.getPhone());
		memberService.setDeliveryAdd(deliveryDTO);
//		System.out.println(memberDTO.getAddress());
		}
		
		mv.setViewName("redirect:../");
		mv.addObject("result", result);
		return mv;
	}
	
	//--이메일체크
	@GetMapping("verificationCode")
	public ModelAndView sendVerificationCode(ModelAndView mv, HttpSession httpSession, String emailVer) {
		SendEmail sendEmail= new SendEmail();
		System.out.println("-----------------");
		System.out.println(emailVer);
		String result = sendEmail.generateEmail(httpSession, emailVer);
		mv.addObject("result", result);
		mv.setViewName("/member/ajaxResult");
		return mv;
	}
	@GetMapping("verificationCodeCheck")
	public ModelAndView verificationCodeCheck(String verificationCode, ModelAndView mv, HttpSession httpSession) {
		System.out.println(verificationCode);
		System.out.println("string이니?: "+httpSession.getAttribute("verificationCode"));
		
		if(verificationCode.equals(httpSession.getAttribute("verificationCode"))) {
			mv.addObject("result", "yes");
		}else {
			mv.addObject("result", "실패.");
		}
		mv.setViewName("/member/ajaxResult");
		return mv;
	}
	//--이메일 끝
	
	//--업데이트--
	@GetMapping("update")
	public String setMyPageUpdate() {
		return "/member/updateCheck";
	}
	@GetMapping("update2")
	public String setUpdateCheck() {
		return "/member/update";
	}	
	
	@GetMapping("emailUpdate")
	public ModelAndView setEmailUpdate(DeliveryDTO deliveryDTO, MemberDTO memberDTO, ModelAndView mv) throws Exception {
		int result=memberService.setEmailUpdate(memberDTO);
		mv.addObject("result", result);
		mv.setViewName("/member/ajaxResult");
		//인증번호를 받고 submit버튼 누르면, 바로 업데이트되고 버튼 삭제
		return mv;
	}
	
	@GetMapping("delivery")
	public ModelAndView getDeliveryPage(HttpSession session, ModelAndView mv) throws Exception {
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		
		if(memberDTO.getId()!=null) {
			mv.addObject("deliveryList", memberService.getDeliveryPage(memberDTO));
			mv.setViewName("/member/delivery");			
		}else {
			mv.setViewName("/member/login");	
		}

		
		return mv;
	}
	@GetMapping("deliveryNew")
	public String setDeliveryAdd() throws Exception {
		return "/member/deliveryNew";
	}
	@PostMapping("deliveryAdd")
	public ModelAndView setDeliveryAdd(String primaryAddress, DeliveryDTO deliveryDTO, ModelAndView mv) throws Exception {
		
		//member address 업데이트.(대표주소)
		if(primaryAddress!=null&&primaryAddress.equals("1")) {
			MemberDTO memberDTO= new MemberDTO();
			memberDTO.setId(deliveryDTO.getId());
			memberDTO.setAddress(deliveryDTO.getAddress());
			memberService.setMemberAddressUpdate(memberDTO);
		}
		
		int result = memberService.setDeliveryAdd(deliveryDTO);
		mv.setViewName("redirect:./delivery");
		mv.addObject("result", result);
		//memberDTO ID를 session에서 꺼내든 parameter로 받아오든, deliveryDTO를 추가.
		return mv;
	}
	@GetMapping("deliveryDelete")
	public String setDeliveryDelete(DeliveryDTO deliveryDTO) throws Exception {
		int result=memberService.setDeliveryDelete(deliveryDTO);
		return "/member/delivery";
	}
	
	@GetMapping("deliveryUpdate")
	public ModelAndView setdeliveryUpdate(DeliveryDTO deliveryDTO) throws Exception {
		ModelAndView mv = new ModelAndView();

		deliveryDTO=memberService.getDeliveryDetail(deliveryDTO);

		//상세주소랑 나눠줘야대네..
		String address=deliveryDTO.getAddress();
		String addressPost=address.substring(0, address.indexOf(","));
		String addressDetail=address.substring(address.indexOf(",")+1);
		mv.addObject("addressPost", addressPost);
		mv.addObject("addressDetail", addressDetail);
		
		mv.setViewName("/member/deliveryUpdate");
		mv.addObject("deliveryDTO",deliveryDTO);
		return mv;
	}
	@PostMapping("deliveryUpdate")
	public ModelAndView setdeliveryUpdate(String primaryAddress, DeliveryDTO deliveryDTO, ModelAndView mv) throws Exception {
		
		System.out.println("--------------setdeliveryUpdate---------------");
		System.out.println(deliveryDTO.getAddress());
		
		int result=memberService.setdeliveryUpdate(deliveryDTO);
		
		System.out.println("업데이트 후: "+deliveryDTO.getId());
		//member address 업데이트.(대표주소)
		System.out.println("primaryAddress: "+primaryAddress);
		if(primaryAddress!=null&&primaryAddress.equals("1")) {
			MemberDTO memberDTO= new MemberDTO();
			memberDTO.setId(deliveryDTO.getId());
			memberDTO.setAddress(deliveryDTO.getAddress());
			memberService.setMemberAddressUpdate(memberDTO);
		}
		
		mv.setViewName("redirect:./delivery");
		return mv;
	}
	
	//대표주소 변경 어떤 dto로 받을지.
	@GetMapping("addressUpdate")
	public ModelAndView setMemberAddressUpdate(MemberDTO memberDTO, ModelAndView mv) throws Exception {
		int result = memberService.setMemberAddressUpdate(memberDTO);
		mv.setViewName("redirect:../");
		mv.addObject("result", result);
		//ajax로 deliveryDTO중 대표 주소 정하기. 결과 return
		return mv;
	}
	@GetMapping("primaryAddress")
	public void setPrimaryAddress(DeliveryDTO deliveryDTO, ModelAndView mv) throws Exception {
		
	}

	
	//password Update
	@PostMapping("pwUpCheck")
	public ModelAndView passwordChangeCheck(MemberDTO memberDTO, ModelAndView mv, HttpSession httpSession) throws Exception {
		MemberDTO memberCheck=(MemberDTO)httpSession.getAttribute("sessionMember");
//		System.out.println("보낸pw: "+memberDTO.getPw());
		mv.setViewName("member/ajaxResult");
		if(memberCheck.getPw().equals(memberDTO.getPw())) { //로그인안해서 null보내면 오류
//			System.out.println("마자마자");
			mv.addObject("result", 1);
			
		}else {
			mv.addObject("result", 0);
		}
		return mv;
	}
	@PostMapping("pwChange")
	public ModelAndView setPasswordUpdate(MemberDTO memberDTO, ModelAndView mv, HttpSession httpSession) throws Exception {
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPw());
		int result=memberService.setPasswordUpdate(memberDTO);
		System.out.println(result);
		mv.setViewName("member/ajaxResult");
		mv.addObject("result", result);
		return mv;
	}
	

}
