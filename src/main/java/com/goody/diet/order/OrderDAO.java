package com.goody.diet.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.goody.diet.order.OrderDAO.";

	public OrderDTO getOrderList(MemberDTO memberDTO) {
		
		return null;
	}
	
	public int setOrderList(OrderDTO orderDTO) throws Exception {
		return 0;
	}
	
	public int setOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setOrderDetail", orderDetailDTO);
	}
	
}
