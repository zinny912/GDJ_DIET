package com.goody.diet.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Service
public class OrderService {
	
	@Autowired
	OrderDAO orderDAO;
	
	public OrderDTO getOrderList(MemberDTO memberDTO) throws Exception {
		
		return null;
	}
	
	public int setOrderList(OrderDTO orderDTO) throws Exception {
		
		return orderDAO.setOrderList(orderDTO);
	}
	
	public int setOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
		
		return orderDAO.setOrderDetail(orderDetailDTO);
	}

}
