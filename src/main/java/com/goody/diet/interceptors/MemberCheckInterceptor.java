package com.goody.diet.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class MemberCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
//		System.out.println("--------멤버첵 인터셉터--------");
//		return super.preHandle(request, response, handler);
//		System.out.println(request.getSession().getAttribute("sessionMember"));
		
		if(request.getSession().getAttribute("sessionMember") != null) {
			
			return true;
		}else {
			//1. Forward Jsp
			System.out.println("로그인 안한경우");
			request.setAttribute("result", "권한이 충춘하지 않음. 로그인");
			request.setAttribute("url", "../../../../member/login"); //속성명, 속성
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");//mv가 없어서 구방식으로 반환.//IRV로 간다면 ..view와 .jsp를 붙여줌.
			view.forward(request, response);
			//Jsp를 거치지만 IRV를 안거침
			
			//2. Redirect
			response.sendRedirect("../../../../../member/login"); //Jsp를 안거치고 바로 나감.
			
			return false;
			
		}

		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
