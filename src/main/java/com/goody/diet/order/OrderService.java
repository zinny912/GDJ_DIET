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
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

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



}
