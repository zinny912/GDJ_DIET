package com.goody.diet.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.goody.diet.util.Pager;


@Repository
public class StudyReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.goody.diet.study.StudyReviewDAO.";

	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",pager);
	}
	
	public List<StudyReviewDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList",pager);
	}
	
	public int setBoardAdd(StudyReviewDTO studyReviewDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setBoardAdd", studyReviewDTO);
	}
	public int setStudyScoreUpdate(StudyReviewDTO studyReviewDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setStudyScoreUpdate",studyReviewDTO);
	}
	public StudyReviewDTO getBoardDetail(StudyReviewDTO studyReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getBoardDetail", studyReviewDTO);
	}
	
	public int setHitUpdate(StudyReviewDTO studyReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setHitUpdate", studyReviewDTO);
	}
	
	public int setBoardUpdate(StudyReviewDTO studyReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardUpdate", studyReviewDTO);
	}
	
	public int setBoardDelete(StudyReviewDTO studyReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setBoardDelete", studyReviewDTO);
	}
	

}
