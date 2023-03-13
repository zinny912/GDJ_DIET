package com.goody.diet.study;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.util.Pager;

@Repository
public class StudyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.study.StudyDAO.";
	
	public Long getStudyCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getStudyCount",pager);
	}
	

}
