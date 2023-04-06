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
import com.goody.diet.member.DeliveryDTO;
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
		//ajax나, sql문 아니면 order랑 cart랑 연결이 안댐..
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		List<OrderDTO> orderDTOs=orderService.getOrderList(memberDTO);	

		
		mv.addObject("orderDTOs", orderDTOs);
		mv.setViewName("/order/orderListPage");
		return mv;
	}
	@GetMapping("cartList")
	public ModelAndView getCartList(ModelAndView mv, OrderDTO orderDTO) throws Exception {
		List<CartDTO> cartDTOs = orderService.getCartList(orderDTO);
		List<StudyDTO> studyDTOs = new ArrayList<StudyDTO>(); 
		List<HealthMachineDTO> HealthMachineDTOs = new ArrayList<HealthMachineDTO>();
		for(CartDTO cartDTO:cartDTOs) {
			studyDTOs.add(orderService.getStudy(cartDTO));
			HealthMachineDTOs.add(orderService.getHealthMachine(cartDTO));
			//밖에서 cartDTO랑 어떻게 매치시킴? if문으로 num이랑 하자..
		}
		mv.setViewName("../common/ajaxResult");
		mv.addObject("cartDTOs", cartDTOs);
		mv.addObject("studyDTOs", studyDTOs);
		mv.addObject("HealthMachineDTOs", HealthMachineDTOs);
		return mv;
	}
//	public ModelAndView getStudy(ModelAndView mv, CartDTO cartDTO) throws Exception {
//		orderService.getStudy(cartDTO);
//		return 
//	}	
//	public ModelAndView getRealHealthMachine(ModelAndView mv, CartDTO cartDTO) throws Exception {
//		orderService.getRealHealthMachine(cartDTO);
//		return
//	}		

	
////구////구////구////구////구////구////구////구////구////구////구////구////구////구////구
//	@GetMapping("listDetail") 
//	public ModelAndView getOrderDetailList(ModelAndView mv, OrderDetailDTO orderDetailDTO) throws Exception {
//		System.out.println("------------------오더디테일-----------------");	
//		System.out.println(orderDetailDTO.getOrderDetailNum());
//		orderDetailDTO=orderService.getOrderDetail(orderDetailDTO);
//		
//		if(orderDetailDTO.getMachineNum()!=null) {			
//			HealthMachineDTO healthMachineDTO = orderService.getHealthMachineForCartAndOrder(orderDetailDTO);
//			String healthMachine=healthMachineDTO.getMachineName();
//			//getRealHealthMachineForCartAndOrder	//상품 색상,무게 등 불러옴
//			RealHealthMachineDTO realHealthMachineDTO = orderService.getRealHealthMachineForCartAndOrder(orderDetailDTO);
//			
//			//링크용
//			mv.addObject("healthMachineDTO", healthMachineDTO);
//			//상품 요약만 string으로
//			if(realHealthMachineDTO!=null) {			
//				if(healthMachineDTO.getOption1()!=null) {
//					healthMachine=healthMachine+", "+realHealthMachineDTO.getOptName1();
//				}
//				if(healthMachineDTO.getOption2()!=null) {
//					healthMachine=healthMachine+", "+realHealthMachineDTO.getOptName2();
//				}
//				if(healthMachineDTO.getOption3()!=null) {
//					healthMachine=healthMachine+", "+realHealthMachineDTO.getOptName3();
//				}
//				if(healthMachineDTO.getOption4()!=null) {
//					healthMachine=healthMachine+", "+realHealthMachineDTO.getOptName4();
//				}
//			}
//			mv.addObject("healthMachine", healthMachine);
//			
//			//이미지만
////			if(healthMachineDTO.getHealthMachineImgDTOs().get(0)!=null) {//만약 이미지 없음				
////				HealthMachineImgDTO healthMachineImgDTO=healthMachineDTO.getHealthMachineImgDTOs().get(0);
////				mv.addObject("HealthMachineImgDTO", healthMachineImgDTO);
////			}
//		}
//		//getStudyForCartAndOrder
//		if(orderDetailDTO.getStudyNum()!=null) {	
//			StudyDTO studyDTO = orderService.getStudyForCartAndOrder(orderDetailDTO);
//			mv.addObject("studyDTO", studyDTO);
//		}
//		
//		  
//		mv.setViewName("/order/detailAjax");
//		return mv; 
//	}
	  
	///////////////////////배송지///////////////////////
	@GetMapping("newPaymentOrder")
	public ModelAndView getPaymentOrder(HttpSession session, DeliveryDTO deliveryDTO, ModelAndView mv) throws Exception {
		System.out.println("-------------------getPaymentOrder-------------------");
		System.out.println(deliveryDTO.getAddressNum());
		
		//세션에서 뽑기 복잡한듯?
		if(deliveryDTO.getAddressNum()==null) {
			MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
			deliveryDTO=orderService.getPrimeDelivery(memberDTO);			
		}
		
		mv.addObject("deliveryDTO", deliveryDTO);
		mv.setViewName("/order/paymentPageAddressAjax");
		return mv;
	}
	
	///////////////////////test 주문페이지/////////////////////
	@GetMapping("checkout")
	public ModelAndView setOrder(ModelAndView mv) throws Exception {
		mv.setViewName("/order/paymentPage");
		return mv;
	}	


	
}
