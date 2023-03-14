package com.goody.diet.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.util.Pager;

@Repository
public class StudyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.study.StudyDAO.";
	
	//스터디 구매 페이지 페이징 설정 
	public Long getStudyCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getStudyCount",pager);
	}
	
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList",pager);
	}
	
	
}
