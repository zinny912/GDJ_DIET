package com.goody.diet.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.cart.CartDAO;
import com.goody.diet.cart.CartDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Service
public class OrderService {
	
	@Autowired OrderDAO orderDAO;
	@Autowired CartDAO cartDAO;
	
	public List<OrderDTO> getOrderList(MemberDTO memberDTO) throws Exception {
	return orderDAO.getOrderList(memberDTO);
}
	
//	public int setOrderList(OrderDTO orderDTO, List<CartDTO> cartDTOs) throws Exception {
//		StudyDTO studyDTO = new StudyDTO();
//		RealHealthMachineDTO healthMachineDTO = new RealHealthMachineDTO();
//		//주문리스트 
//		orderDAO.setOrderList(orderDTO);
//		//주문리스트 상세
//		Long totalPrice=0L;
//		//장바구니 mapper에서 불러오면 안댐.. checked만 불러와야대.... 
//		for(CartDTO cartDTO:cartDTOs) {
//			OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
//			orderDetailDTO.setOrderNum(orderDTO.getOrderNum());
//			
//			if(cartDTO.getMachineNum()!=null) {
//				orderDetailDTO.setMachineNum(cartDTO.getMachineNum());			
//				orderDetailDTO.setCount(cartDTO.getCount());
//				totalPrice=totalPrice + 
//			}
//			if(cartDTO.getStudyNum()!=null) {
//				orderDetailDTO.setStudyNum(cartDTO.getStudyNum());				
//			}
//			
//		}
//		orderDTO.setOrderDetailDTOs(null);
//
//		
//		return 0;
//	}
	
	
//	public int setOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
//		return orderDAO.setOrderDetail(orderDetailDTO);
//	}

//	public int setOrder(MemberDTO memberDTO, List<CartDTO> cartDTOs) throws Exception {
//		StudyDTO studyDTO = new StudyDTO();
//
//		//orderDTO 어디서 만들지..
//		OrderDTO orderDTO=new OrderDTO();
//		
//		orderDAO.setOrder(orderDTO);
//		
//		for(CartDTO cartDTO:cartDTOs) {
//			OrderDetailDTO orderDetailDTO=new OrderDetailDTO();
//			
//			if(cartDTO.getMachineNum()!=null) {
//				HealthMachineDTO healthMachineDTO=cartDAO.getHealthMachineForCartAndOrder(cartDTO);
//				orderDetailDTO.setMachineNum(healthMachineDTO.getMachineNum());
//			}
//			if(cartDTO.getStudyNum()!=null) {
//				cartDAO.getStudyForCartAndOrder(cartDTO);			
//			}			
//			
//			orderDAO.setOrderDetail(orderDetailDTO);
//		}		
//		
//		
//		
//		return 0;
//	}
	
	
	public void setOrder( List<CartDTO> cartDTOs,HttpSession session) throws Exception {
		//orderDTO 어디서 만들지..
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		OrderDTO orderDTO=new OrderDTO();
		orderDAO.setOrder(orderDTO);
		
		//checked된 cartDTO -> orderDetailDTO 복사
		for(CartDTO cartDTO:cartDTOs) {
			OrderDetailDTO orderDetailDTO = new OrderDetailDTO();			
			if(cartDTO.getMachineNum()!=null) {
				orderDetailDTO.setMachineNum(cartDTO.getMachineNum());
			}
			if(cartDTO.getStudyNum()!=null) {
				orderDetailDTO.setStudyNum(cartDTO.getStudyNum());			
			}			
			orderDAO.setOrderDetail(orderDetailDTO);
		}		
	}	
	
	public OrderDetailDTO getOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
		return orderDAO.getOrderDetail(orderDetailDTO);
	}	

	public HealthMachineDTO getHealthMachineForCartAndOrder(OrderDetailDTO orderDetailDTO) {
		return orderDAO.getHealthMachineForCartAndOrder(orderDetailDTO);
	}
	public RealHealthMachineDTO getRealHealthMachineForCartAndOrder(OrderDetailDTO orderDetailDTO) {
		return orderDAO.getRealHealthMachineForCartAndOrder(orderDetailDTO);
	}
	public StudyDTO getStudyForCartAndOrder(OrderDetailDTO orderDetailDTO) {
		return orderDAO.getStudyForCartAndOrder(orderDetailDTO);
	}	
	
}
