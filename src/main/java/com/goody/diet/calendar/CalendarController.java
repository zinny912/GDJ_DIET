package com.goody.diet.calendar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/calendar/*")
public class CalendarController {
	@Autowired
	private CalendarService calendarService;
	
	@GetMapping("calendar")
	@ResponseBody
	public List<CalendarDTO> getCalendar() throws Exception{
	    List<CalendarDTO> list = calendarService.getCalendar();
	    return list;
	}
}
	//일정보기
		
//	@GetMapping("routine")
//	public ModelAndView getCalendar(HttpSession session) throws Exception{
//			ModelAndView mv = new ModelAndView();
//			
//			List<CalendarDTO> ar = calendarService.getCalendar();
//			session.setAttribute("calendarList", ar);
//			
//			mv.setViewName("calendar/routine");
//			mv.addObject("list", ar);
//			mv.setViewName("/common/ajaxResult");
//			return mv;
//		}
//}

////일정보기
//		@RequestMapping(value = "/calendar", method = RequestMethod.GET)
//		public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request) {
//			String viewpage = "calendar";
//			List<Calendar> calendar = null;
//			try {
//				calendar = calendarService.getCalendar();
//				request.setAttribute("calendarList", calendar);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			mv.setViewName(viewpage);
//			return mv;
//		}