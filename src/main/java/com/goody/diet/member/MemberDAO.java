package com.goody.diet.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	private final String NAMESPACE = "com.goody.diet.member.MemberDAO.";
	
	public MemberDTO getKakaoLogin (MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getKakaoLogin", memberDTO);
	}
	public int setKakaoJoin (MemberDTO memberDTO) {
		return sqlSession.insert(NAMESPACE+"setKakaoJoin", memberDTO);
	}

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
	
	public int setMemberRole(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setMemberRole", memberDTO);
	}
	
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setMemberDelete", memberDTO);
	}
	public int setMemberRoleDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setMemberRoleDelete", memberDTO);
	}	
}
