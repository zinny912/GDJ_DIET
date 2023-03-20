package com.goody.diet.member;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goody.diet.MyTestCase;

public class memberTest extends MyTestCase{

	@Autowired
	MemberDAO memberDAO;
	
	@Test
	public void test() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("HM");
		memberDTO.setPw("1234");
		memberDTO = memberDAO.getMemberLogin(memberDTO);
		assertNotNull(memberDTO);
	}
	
}
