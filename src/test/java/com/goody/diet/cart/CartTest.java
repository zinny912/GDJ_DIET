package com.goody.diet.cart;

import static org.junit.Assert.*;

import org.junit.Test;

import com.goody.diet.MyTestCase;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.DeliveryDTO;
import com.goody.diet.member.MemberDAO;

public class CartTest extends MyTestCase{

	@Test
	public void test() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		DeliveryDTO deliveryDTO = new DeliveryDTO();
		// TODO Auto-generated method stub
		CartDAO cartDAO = new CartDAO();
		CartDTO cartDTO = new CartDTO();
		cartDTO.setCount(2L);
		cartDTO.setMachineNum(2L);
		cartDTO.setId("test어드민");
		
		HealthMachineDTO healthMachineDTO = new HealthMachineDTO();
		healthMachineDTO.setMachineNum(2L);
		
		
//		memberDAO.getDeliveryDetail(deliveryDTO);
		int result=cartDAO.setAddToCart(cartDTO);
		System.out.println(result);
		System.out.println("뭐");
		assertEquals(1, result);
	}

}
