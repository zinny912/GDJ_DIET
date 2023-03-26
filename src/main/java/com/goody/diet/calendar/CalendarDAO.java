package com.goody.diet.calendar;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CalendarDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goody.diet.calendar.CalendarDAO.";
		
	public List<CalendarDTO> getCalendar() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCalendar");	
	}
}	
	
	