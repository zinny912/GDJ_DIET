package com.goody.diet.healthMachine;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.cart.CartDTO;
import com.goody.diet.study.StudyReviewDTO;
import com.goody.diet.util.Pager;

@Repository
public class MachineReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.goody.diet.healthMachine.MachineReviewDAO.";
	
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",pager);
	}
	
	public List<MachineReviewDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardList",pager);
	}
	
	public int setBoardAdd(MachineReviewDTO machineReviewDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setBoardAdd", machineReviewDTO);
	}
	
	public MachineReviewDTO getBoardDetail(MachineReviewDTO machineReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getBoardDetail", machineReviewDTO);
	}
	
	public int setHitUpdate(MachineReviewDTO machineReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setHitUpdate", machineReviewDTO);
	}
	
	public int setBoardUpdate(MachineReviewDTO machineReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setBoardUpdate", machineReviewDTO);
	}
	
	public int setBoardDelete(MachineReviewDTO machineReviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setBoardDelete", machineReviewDTO);
	}
}
