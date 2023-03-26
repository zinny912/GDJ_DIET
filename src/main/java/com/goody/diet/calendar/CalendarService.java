package com.goody.diet.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	
		@Autowired
		private CalendarDAO calendarDAO;
		
		public List<CalendarDTO> getCalendar() throws Exception{
			return calendarDAO.getCalendar();
		}
	}
