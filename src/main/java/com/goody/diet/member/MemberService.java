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
	
	public MemberDTO setMemberLogin(MemberDTO memberDTO) throws Exception {
		
		if(memberDTO.getPw()!=null) { 
			MemberDTO result=memberDAO.getMemberLogin(memberDTO);
			if(!result.getPw().equals(memberDTO.getPw())) { //@안될지몰라...
				memberDTO=null;
			}
		}else {
			memberDTO=null;
		}//비번 null이면 null받음
		return memberDTO;
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.setMemberJoin(memberDTO);
	}

	
}
