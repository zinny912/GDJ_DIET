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
		
		System.out.println("member "+ memberDTO);
		
		List<OrderDTO> orderDTOs=orderService.getOrderList(memberDTO);	//여기 다 resultmap으로 detail까지 다 담김.
		mv.addObject("orderList", orderDTOs);

		for(OrderDTO orderDTO:orderDTOs) {

				System.out.println("orderDTO "+orderDTO.getId());
				System.out.println("orderDetailDTOs "+orderDTO.getOrderDetailDTOs().size());
	
			List<OrderDetailDTO> orderDetailDTOs = orderDTO.getOrderDetailDTOs();
			mv.addObject("orderDetailDTOs",orderDetailDTOs);
				
//				List<HealthMachineDTO> healthMachineDTOs = new ArrayList<HealthMachineDTO>();
//				List<RealHealthMachineDTO> realHealthMachineDTOs = new ArrayList<RealHealthMachineDTO>();
//				List<StudyDTO> studyDTOs = new ArrayList<StudyDTO>();
//			
//			for(OrderDetailDTO orderDetailDTO: orderDetailDTOs) {
//				
//					System.out.println("order num "+orderDetailDTO.getOrderNum());
//					System.out.println(orderDetailDTO.getPrice());
//					System.out.println(orderDetailDTO.getOrderDetailNum());
//				
//				//페이지에 표시할 상품들의 정보들을 받아와야해..			//
//				//getHealthMachineForCartAndOrder		//상품 정보와, 이미지 불러옴
//				if(orderDetailDTO.getMachineNum()!=null) {			
//					healthMachineDTOs.add(orderService.getHealthMachineForCartAndOrder(orderDetailDTO));
//					//getRealHealthMachineForCartAndOrder	//상품 색상,무게 등 불러옴
//					realHealthMachineDTOs.add(orderService.getRealHealthMachineForCartAndOrder(orderDetailDTO));					
//				}
//				//getStudyForCartAndOrder
//				if(orderDetailDTO.getStudyNum()!=null) {	
//					studyDTOs.add(orderService.getStudyForCartAndOrder(orderDetailDTO));
//				}
//
//			}
//			
//			mv.addObject("studyDTOs", studyDTOs);
//			mv.addObject("healthMachineDTOs", healthMachineDTOs);
//			mv.addObject("realHealthMachineDTOs", realHealthMachineDTOs);
	
			//들 받아오는데, JS에서 해도댐.
			//한꺼번에 불러오면 상품들이 어느 주문에 속한지 어떻게 알지? 한 order에 몇개의 상품이 올지 몰라서 한거번에 못받아옴.. mv.addObject를 if문으로 작성해..

		}
		
		mv.setViewName("/order/orderListPage");
		return mv;
	}
	
	
	  @GetMapping("listDetail") 
	  public ModelAndView getOrderList(ModelAndView mv, OrderDTO orderDTO) throws Exception {
	  
		  List<OrderDetailDTO> orderDetailDTOs = orderDTO.getOrderDetailDTOs();
		  for(OrderDetailDTO orderDetailDTO:orderDetailDTOs) { 
			  String healthMachine = "";
				if(orderDetailDTO.getMachineNum()!=null) {					
				HealthMachineDTO healthMachineDTO = orderService.getHealthMachineForCartAndOrder(orderDetailDTO);
				healthMachine=healthMachineDTO.getMachineName();
				//getRealHealthMachineForCartAndOrder	//상품 색상,무게 등 불러옴
				RealHealthMachineDTO realHealthMachineDTO = orderService.getRealHealthMachineForCartAndOrder(orderDetailDTO);
				
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
				mv.addObject("healthMachine", healthMachine);
				mv.addObject("HealthMachineImgDTOs", healthMachineDTO.getHealthMachineImgDTOs());
//				mv.addObject("realHealthMachineDTO", realHealthMachineDTO);
			}
			//getStudyForCartAndOrder
			if(orderDetailDTO.getStudyNum()!=null) {	
				StudyDTO studyDTO = orderService.getStudyForCartAndOrder(orderDetailDTO);
				mv.addObject("studyDTO", studyDTO);
			}
		  
		  } 
		  mv.setViewName("./detailAjax");
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
		//결제페이지로..가야댐.. 그냥 주문된걸로 칠께..
		mv.setViewName("./orderListPage");
		return mv;
	}


	
}
