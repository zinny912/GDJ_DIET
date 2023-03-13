package com.goody.diet.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	private final String NAMESPACE = "com.goody.diet.member.MemberDAO.";
	
	public void getMemberLogin() {
		
	}

	public MemberDTO setMemberLogin(MemberDTO memberDTO) throws Exception {
		memberDTO = sqlSession.selectOne(NAMESPACE+"setMemberLogin", memberDTO);
		System.out.println(memberDTO.getNames());
		return memberDTO;
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}

}
