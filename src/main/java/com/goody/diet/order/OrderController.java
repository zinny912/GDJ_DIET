package com.goody.diet.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@GetMapping("list")
	public ModelAndView getOrderList(ModelAndView mv, MemberDTO memberDTO) throws Exception {
//		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		
		return mv;
	}
	
	@GetMapping("setOrderList")
	public ModelAndView setOrderList(ModelAndView mv, HttpSession session) throws Exception {
		//장바구니->주문
		//상품->주문
		OrderDTO orderDTO = new OrderDTO();
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		orderDTO.setId(memberDTO.getId());
		orderService.setOrderList(orderDTO);
		return mv;
	}
	
	@GetMapping("orderDetail")
	public ModelAndView setOrderDetail(ModelAndView mv, OrderDetailDTO orderDetailDTO) throws Exception {
		orderService.setOrderDetail(orderDetailDTO);
	
		return mv;
	}

	
}
