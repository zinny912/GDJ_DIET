package com.goody.diet.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	//스터디구매 리스트 불러오기
	public List<StudyDTO> getStudyList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getStudyList", pager);
	}
	
	//스터디 구매 상세페이지
	public StudyDTO getStudyDetail(StudyDTO studyDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getStudyDetail", studyDTO);
	}
	
	//스터디 등록 
	public int setStudyAdd(StudyDTO studyDTO)throws Exception {
		return sqlSession.insert(NAMESPACE+"setStudyAdd", studyDTO);
	}
	
	//스터디 삭제 
	public int setStudyDelete(StudyDTO studyDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setStudyDelete", studyDTO);
	}
	
	//스터디 수정 
	public int setStudyUpdate(StudyDTO studyDTO)throws Exception {
		return sqlSession.update(NAMESPACE+"setStudyUpdate", studyDTO);
		}
	
}
