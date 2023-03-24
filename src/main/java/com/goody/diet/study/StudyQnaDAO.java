package com.goody.diet.study;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.util.Pager;

@Repository
public class StudyQnaDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.goody.diet.study.StudyQnaDAO.";

	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}

	public List<StudyQnaDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList", pager);
	}
	
	public int setBoardAdd(StudyQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardAdd", qnaDTO);
	}
	
	public int setBoardUpdate(StudyQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardUpdate", qnaDTO);
	}
	
	public int setBoardDelete(StudyQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setBoardDelete", qnaDTO);
	}
	
	public StudyQnaDTO getBoardDetail(StudyQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getBoardDetail", qnaDTO);
	}
	
	public int setStepUpdate(StudyQnaDTO qnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setStepUpdate", qnaDTO);
	}
	
	public int setReplyAdd(StudyQnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setReplyAdd", qnaDTO);
	}
	
	public int setHitUpdate(StudyQnaDTO qnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setHitUpdate", qnaDTO);
	}
	

}