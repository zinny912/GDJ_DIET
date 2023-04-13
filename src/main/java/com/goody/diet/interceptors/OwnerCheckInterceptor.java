package com.goody.diet.interceptors;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.goody.diet.healthMachine.MachineQnaDAO;
import com.goody.diet.healthMachine.MachineQnaDTO;
import com.goody.diet.healthMachine.MachineReviewDAO;
import com.goody.diet.healthMachine.MachineReviewDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyQnaDAO;
import com.goody.diet.study.StudyQnaDTO;
import com.goody.diet.study.StudyReviewDAO;
import com.goody.diet.study.StudyReviewDTO;


@Component
public class OwnerCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private StudyReviewDAO studyReviewDAO;
	@Autowired
	private MachineReviewDAO machineReviewDAO;
	
	@Autowired
	private StudyQnaDAO studyQnaDAO;
	@Autowired
	private MachineQnaDAO machineQnaDAO;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//update뿐만 아니라 delete 할때도 함께 사용할 수 있도록 만듦
		//밑에 주석처리는 update만 가능
		//num을 받아서 지우는걸 여기서 확인하고 지워준다
		//글의 작성자와 로그인한 id와 같은지 확인(notice에선 관리자로 들어오고, 그 관리자가 동일 id를 가진 관리자인지 check)
		//(qna는 writer와 member의 id가 동일한지 check)
		Long num =Long.parseLong(request.getParameter("num"));
		
		String uri = request.getRequestURI();
		uri = uri.substring(1, uri.lastIndexOf("/"));
		
		System.out.println("Reivew:"+uri);
		
		StudyReviewDTO studyReviewDTO = new StudyReviewDTO();
		MachineReviewDTO machineReviewDTO = new MachineReviewDTO();
		StudyQnaDTO studyQnaDTO = new StudyQnaDTO();
		MachineQnaDTO machineQnaDTO = new MachineQnaDTO();
		studyReviewDTO.setNum(num);
		if(uri.equals("review")) {
			studyReviewDTO = studyReviewDAO.getBoardDetail(studyReviewDTO);
			machineReviewDTO = machineReviewDAO.getBoardDetail(machineReviewDTO);
		}else {
			studyQnaDTO = studyQnaDAO.getBoardDetail(studyQnaDTO);
			machineQnaDTO = machineQnaDAO.getBoardDetail(machineQnaDTO);
		}

		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("sessionMember");
		if(!memberDTO.getId().equals(studyReviewDTO.getWriter())) {
			request.setAttribute("result", "작성자만 가능합니다.(수정, 삭제)");
			request.setAttribute("url", "./list");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
			return false;
		}
		
		return true;
	}
	
	
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		//postHandle()메소드는 ModelAndView가 존재(controller에서 ds로 받아오는 과정)
//		System.out.println("Owner Check Inerceptor");
//		//1. 로그인 한 사용자의 id 알아보기
//		MemberDTO memberDTO =(MemberDTO) request.getSession().getAttribute("member");
//		
//		//2. 작성자 내용을 modelAndView에서 꺼낸다. 속성명은 BoardDTO고, 꺼내고싶은건 writer
//		Map<String,Object> map = modelAndView.getModel();
//		BoardDTO boardDTO =(BoardDTO)map.get("dto");
//		//map.keySet().iterator(); //key값이 궁금할때 뭐가 있는지 확인할 수 있다.
//		
//		//3. check (글의 작성자와 로그인한 id와 같은지 확인 => update,delete 들어가서 수정하는 애들)
//		if(memberDTO == null || !boardDTO.getWriter().equals(memberDTO.getId())) {
//			modelAndView.setViewName("common/result");
//			modelAndView.addObject("result", "작성자만 가능합니다.(수정, 삭제)");
//			modelAndView.addObject("url", "./list");
//		}
//	}	
}
