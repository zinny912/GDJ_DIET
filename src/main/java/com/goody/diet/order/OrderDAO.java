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

	public List<OrderDTO> getOrderList (MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getOrderList", memberDTO);
	}
//	public List<OrderDetailDTO> getOrderDetailList(OrderDTO orderDTO) {		
//		return sqlSession.selectList(NAMESPACE+"getOrderDetailList", orderDTO);
//	}
	
	

	public int setOrder(OrderDTO orderDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setOrder", orderDTO);
	}
	public int setOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setOrderDetail", orderDetailDTO);
	}
	
}
