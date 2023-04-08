package com.goody.diet.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goody.diet.cart.CartDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.member.DeliveryDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.goody.diet.order.OrderDAO.";
	
	public DeliveryDTO getPrimeDelivery (MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPrimeDelivery", memberDTO);
	}

	public List<OrderDTO> getOrderList (MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getOrderList", memberDTO);
	}
	public int setOrder(OrderDTO orderDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setOrder", orderDTO);	
	}
	public int setOrderDetail(CartDTO cartDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setOrderDetail", cartDTO);
	}
	
}
