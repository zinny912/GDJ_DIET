package com.goody.diet.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.util.Pager;
import com.goody.diet.board.BoardFileDTO;

@Repository
public class StudyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.study.StudyDAO.";
	
	//스터디 구매 페이지 페이징 설정 
	public Long getStudyCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getStudyCount",pager);
	}
	
	public List<StudyDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList",pager);
	}
	
	public StudyDTO getBoardDetail(StudyDTO studyDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getBoardDetail", studyDTO);
	}
	
	public int setBoardAdd(StudyDTO studyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardAdd", studyDTO);
	}

	public int setBoardFileAdd(StudyBoardFileDTO studyBoardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardFileAdd", studyBoardFileDTO);
	}
	
	public int setBoardUpdate(StudyDTO studyDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setBoardUpdate", studyDTO);
	}
	
	public int setBoardFileDelete(Long fileNum) throws Exception {
		return sqlSession.delete(NAMESPACE+"setBoardFileDelete", fileNum);
	}
	
	public int setBoardDelete(StudyDTO studyDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setBoardDelete", studyDTO);
	}
}
