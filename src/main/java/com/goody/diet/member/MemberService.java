package com.goody.diet.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	public String getIdCheck (MemberDTO memberDTO) throws Exception {
		String result = "사용불가";
		if(memberDTO.getId()!=null&&memberDTO.getId()!=""&&memberDAO.getMemberLogin(memberDTO)==null) {
			result = "사용가능";
		}
		if(memberDTO.getId()=="") {
			result = "필수정보";
		}
		if(memberDAO.getMemberLogin(memberDTO)!=null) {
			result = "중복아이디";
		}
		return result;
	}
	public String getEmailCheck (MemberDTO memberDTO) throws Exception {
		String result = "사용불가";
		if(memberDTO.getEmail()!=null&&memberDTO.getEmail()!=""&&memberDAO.getEmailCheck(memberDTO)==null) {
			result = "사용가능";
		}
		if(memberDTO.getEmail()=="") {
			result = "필수정보";
		}
		if(memberDAO.getEmailCheck(memberDTO)!=null) {
			result = "중복";
		}
		return result;
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
//		System.out.println("서비스왔니..?");
		if(memberDTO.getPw()!=null) { 
			MemberDTO result=memberDAO.getMemberLogin(memberDTO);
			if(result!=null && !result.getPw().equals(memberDTO.getPw())) { //@안될지몰라...
				memberDTO=null;
			}
		}else { //pw가 null이면
			memberDTO=null;
		}//비번 null이면 null받음
//		System.out.println("서비스 나왔니..?");
		return memberDTO;
	}

	public MemberDTO getMyPage(MemberDTO memberDTO) throws Exception {
		memberDTO = memberDAO.getMemberLogin(memberDTO);
		memberDTO.setPw(null);
		return memberDTO;
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.setMemberJoin(memberDTO);
	}

	
}
