package com.goody.diet.cart;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goody.diet.MyTestCase;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.DeliveryDTO;
import com.goody.diet.member.MemberDAO;

public class CartTest extends MyTestCase{

	@Autowired
	private CartDAO cartDAO;
	
	@Test
	public void test() throws Exception {
		CartDTO cartDTO = new CartDTO();
		cartDTO.setId("admin");
		List<CartDTO> ar = cartDAO.getCartList(cartDTO);
		assertNotEquals(0, ar.size());
		
	}

}
