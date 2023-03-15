package com.goody.diet.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	private final String NAMESPACE = "com.goody.diet.member.MemberDAO.";
	

	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		memberDTO = sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
//		System.out.println(memberDTO.getNames());
		return memberDTO;
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}

	public MemberDTO getEmailCheck (MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getEmailCheck", memberDTO);
	}
}
