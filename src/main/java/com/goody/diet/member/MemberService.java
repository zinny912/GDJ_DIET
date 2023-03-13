package com.goody.diet.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	public MemberDTO setMemberLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.setMemberLogin(memberDTO);
	}
	
}
