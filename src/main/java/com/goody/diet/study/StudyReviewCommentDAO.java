package com.goody.diet.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.goody.diet.util.Pager;

@Repository
public class StudyReviewCommentDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.goody.diet.study.StudyReviewCommentDAO.";
	
	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",pager);
	}

	public List<StudyReviewCommentDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList",pager);
	}
	
	public int setBoardAdd(StudyReviewCommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardAdd", commentDTO);
	}
	
	public int setBoardDelete(StudyReviewCommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setBoardDelete", commentDTO);
	}
	
}
