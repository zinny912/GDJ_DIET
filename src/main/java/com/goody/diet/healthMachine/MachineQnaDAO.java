package com.goody.diet.healthMachine;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.study.StudyQnaDTO;
import com.goody.diet.util.Pager;

@Repository
public class MachineQnaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.goody.diet.healthMachine.MachineQnaDAO.";
	
	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}

	public List<MachineQnaDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList", pager);
	}
	
	public int setBoardAdd(MachineQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardAdd", qnaDTO);
	}
	
	public MachineQnaDTO getBoardDetail(MachineQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getBoardDetail", qnaDTO);
	}
	
	public int setBoardUpdate(MachineQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardUpdate", qnaDTO);
	}
	
	public int setBoardDelete(MachineQnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setBoardDelete", qnaDTO);
	}
	
	public int setStepUpdate(MachineQnaDTO qnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setStepUpdate", qnaDTO);
	}
	
	public int setReplyAdd(MachineQnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setReplyAdd", qnaDTO);
	}
	
	public int setHitUpdate(MachineQnaDTO qnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setHitUpdate", qnaDTO);
	}
}
