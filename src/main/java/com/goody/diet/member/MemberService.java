package com.goody.diet.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	public MemberDTO setMemberLogin(MemberDTO memberDTO) throws Exception {
		
		if(memberDTO.getPw()!=null) { 
			memberDTO=memberDAO.setMemberLogin(memberDTO);
		}else {
			memberDTO=null;
		}//비번 null이면 null받음
		return memberDTO;
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.setMemberJoin(memberDTO);
	}

	
}
