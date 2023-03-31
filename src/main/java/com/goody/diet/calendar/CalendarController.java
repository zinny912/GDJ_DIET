package com.goody.diet.calendar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    @Autowired
    private CalendarService calendarService;
	//일정보기	
	@GetMapping("list")
	public ModelAndView getCalendar(HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView();
	
			List<CalendarDTO> list = calendarService.getCalendar();
			request.setAttribute("list", list);
			System.out.println(list);
			
			mv.setViewName("calendar/list");
			//mv.addObject("list", list);
			//mv.setViewName("/common/ajaxResult");
			return mv;
		}
}
//@GetMapping("list")
//@ResponseBody
//public List<Map<String, Object>> getCalendar(HttpServletResponse response) throws Exception{
//	List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
//	
//    List<CalendarDTO> list = calendarService.getCalendar();
//    
//    for (CalendarDTO calendar : list) {
//
//        Map<String, Object> map = new HashMap<String, Object>();
//    	map.put("title", calendar.getTitle());
//        map.put("start", calendar.getStart());
//        map.put("end", calendar.getEnd());
//        result.add(map);
//    }
//   System.out.println("resultCheck:" +result);
//    return result;
//    ObjectMapper mapper = new ObjectMapper();
//    String json = mapper.writeValueAsString(result);
//
//    response.setContentType("application/json;charset=UTF-8");
//    response.getWriter().write(json);
//    
//}
//
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