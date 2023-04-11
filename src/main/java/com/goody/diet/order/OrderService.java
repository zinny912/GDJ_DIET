package com.goody.diet.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goody.diet.cart.CartDAO;
import com.goody.diet.cart.CartDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.member.DeliveryDTO;
import com.goody.diet.member.MemberDAO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;
import com.goody.diet.util.Pager;

@Service
public class OrderService {
	
	@Autowired OrderDAO orderDAO;
	@Autowired CartDAO cartDAO;
	
	public DeliveryDTO getPrimeDelivery (MemberDTO memberDTO) throws Exception {
		return orderDAO.getPrimeDelivery(memberDTO);
	}
	
	public List<OrderDTO> getOrderList(MemberDTO memberDTO) throws Exception {
		
		
	return orderDAO.getOrderList(memberDTO);
	}
	public int setUpdateCart(OrderDTO orderDTO,Long [] num,Long[] studyNum, Long[] realMachineNum, HttpSession session)throws Exception{
		//1. order생성
		int result= orderDAO.setOrder(orderDTO); 
		
		//2. CartUpdate
		CartDTO cartDTO = new CartDTO();
		for(Long cartNum:num) {
			cartDTO.setNum(cartNum);
			cartDTO.setOrderNum(orderDTO.getOrderNum());
			cartDTO.setId(orderDTO.getId());

			//cart status 2로 설정
			cartDAO.setCartStatusUpdate(cartDTO);
			//detail생성
			orderDAO.setOrderDetail(cartDTO);
		}
		
		for(Long studyNumber:studyNum) {
			cartDTO.setStudyNum(studyNumber);
			if(cartDTO.getStudyNum()!=null) {
				cartDAO.setMemberStudyNum(cartDTO);
				cartDAO.setStudyStock(cartDTO);
			}
		}
		
		for(Long realMachineNumber:realMachineNum) {
			cartDTO.setRealMachineNum(realMachineNumber);
	
			if(cartDTO.getRealMachineNum()!=null) {
				cartDAO.setMachineStock(cartDTO);
			}
		}
		return result;
	}


}
