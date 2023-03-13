package com.goody.diet.board.studyqna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.board.BoardDAO;
import com.goody.diet.board.BoardDTO;
import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.util.Pager;

public class StudyQnaDAO implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.goody.diet.studyqna.StudyQnaDTO.";

	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return 0L;
	}

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getTotalCount", pager);
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setBoardFileAdd(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardFileDTO> getBoardFileList(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setBoardFileDelete(Long fileNum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
