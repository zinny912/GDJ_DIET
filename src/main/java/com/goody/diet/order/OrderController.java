package com.goody.diet.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.cart.CartDAO;
import com.goody.diet.cart.CartDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.HealthMachineImgDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@GetMapping("list")
	public ModelAndView getOrderList(ModelAndView mv, HttpSession session) throws Exception {
		System.out.println("------------------오더리스트-----------------");
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		List<OrderDTO> orderDTOs=orderService.getOrderList(memberDTO);	//여기 다 resultmap으로 detail까지 다 담김.
		mv.addObject("orderList", orderDTOs);
		mv.setViewName("/order/orderListPage");
		return mv;
	}
	
	
	@GetMapping("listDetail") 
	public ModelAndView getOrderDetailList(ModelAndView mv, OrderDetailDTO orderDetailDTO) throws Exception {
		System.out.println("------------------오더디테일-----------------");	
		System.out.println(orderDetailDTO.getOrderDetailNum());
		orderDetailDTO=orderService.getOrderDetail(orderDetailDTO);
		
		if(orderDetailDTO.getMachineNum()!=null) {			
			HealthMachineDTO healthMachineDTO = orderService.getHealthMachineForCartAndOrder(orderDetailDTO);
			String healthMachine=healthMachineDTO.getMachineName();
			//getRealHealthMachineForCartAndOrder	//상품 색상,무게 등 불러옴
			RealHealthMachineDTO realHealthMachineDTO = orderService.getRealHealthMachineForCartAndOrder(orderDetailDTO);
			
			//링크용
			mv.addObject("healthMachineDTO", healthMachineDTO);
			//상품 요약만 string으로
			if(realHealthMachineDTO!=null) {			
				if(healthMachineDTO.getOption1()!=null) {
					healthMachine=healthMachine+", "+realHealthMachineDTO.getOptName1();
				}
				if(healthMachineDTO.getOption2()!=null) {
					healthMachine=healthMachine+", "+realHealthMachineDTO.getOptName2();
				}
				if(healthMachineDTO.getOption3()!=null) {
					healthMachine=healthMachine+", "+realHealthMachineDTO.getOptName3();
				}
				if(healthMachineDTO.getOption4()!=null) {
					healthMachine=healthMachine+", "+realHealthMachineDTO.getOptName4();
				}
			}
			mv.addObject("healthMachine", healthMachine);
			
			//이미지만
//			if(healthMachineDTO.getHealthMachineImgDTOs().get(0)!=null) {//만약 이미지 없음				
//				HealthMachineImgDTO healthMachineImgDTO=healthMachineDTO.getHealthMachineImgDTOs().get(0);
//				mv.addObject("HealthMachineImgDTO", healthMachineImgDTO);
//			}
		}
		//getStudyForCartAndOrder
		if(orderDetailDTO.getStudyNum()!=null) {	
			StudyDTO studyDTO = orderService.getStudyForCartAndOrder(orderDetailDTO);
			mv.addObject("studyDTO", studyDTO);
		}
		
		  
		mv.setViewName("/order/detailAjax");
		return mv; 
	}
	  
	  
	 
	
	@GetMapping("checkout")
	public ModelAndView setOrder(ModelAndView mv) throws Exception {

		mv.setViewName("/order/paymentPage");
		return mv;
	}	
//	@GetMapping("setOrder")
//	public ModelAndView setOrder(ModelAndView mv, HttpSession session, List<CartDTO> cartDTOs) throws Exception {
//		//여기서 다처리하자..
//		//장바구니->주문 //checked만 주문하려면 List로 받아야 함. (x id->cart->product 검색 안대..)
//		//1. 상품->주문(장바구니)->주문? 주문도중 취소하면 장바구니에 남아야하는데 바로주문도 담기네...? //쿠팡에선 그냥 장바구니로 들어가네..
//		//2. 상품->주문
//
//		//cartDTO는 num만 보내주면 대..
//		orderService.setOrder((MemberDTO)session.getAttribute("sessionMember"), cartDTOs);
//		//결제페이지로..가야댐.. 그냥 주문된걸로 칠께..
//		mv.setViewName("./paymentPage");
//		return mv;
//	}


	
}
