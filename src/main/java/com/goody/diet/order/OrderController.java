package com.goody.diet.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.cart.CartDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@GetMapping("list")
	public ModelAndView getOrderList(ModelAndView mv, HttpSession session) throws Exception {
		
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		
		List<OrderDTO> orderDTOs=orderService.getOrderList(memberDTO);
		//페이지에 표시할 상품들의 정보들을 받아와야해..
		//cartmapper에서 
		//getHealthMachineForCartAndOrder
		//getRealHealthMachineForCartAndOrder
		//getStudyForCartAndOrder
		//들 받아오는데, JS에서 해도댐.
		
		
		return mv;
	}
	
	@GetMapping("setOrder")
	public ModelAndView setOrder(ModelAndView mv, HttpSession session, List<CartDTO> cartDTOs) throws Exception {
		//여기서 다처리하자..
		//장바구니->주문 //checked만 주문하려면 List로 받아야 함. (x id->cart->product 검색 안대..)
		//1. 상품->주문(장바구니)->주문? 주문도중 취소하면 장바구니에 남아야하는데 바로주문도 담기네...? //쿠팡에선 그냥 장바구니로 들어가네..
		//2. 상품->주문

		//cartDTO는 num만 보내주면 대..
		orderService.setOrder((MemberDTO)session.getAttribute("sessionMember"), cartDTOs);
		return mv;
	}


	
}
