package com.goody.diet;

import com.goody.diet.cart.CartDAO;
import com.goody.diet.cart.CartDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.DeliveryDTO;
import com.goody.diet.member.MemberDAO;

public class TestMain {

	public static void main(String[] args) {
		MemberDAO memberDAO = new MemberDAO();
		DeliveryDTO deliveryDTO = new DeliveryDTO();
		// TODO Auto-generated method stub
		CartDAO cartDAO = new CartDAO();
		CartDTO cartDTO = new CartDTO();
		cartDTO.setCount(2L);
		cartDTO.setMachineNum(2L);
		cartDTO.setId("test어드민");
		
//		HealthMachineDTO healthMachineDTO = new HealthMachineDTO();
//		healthMachineDTO.setMachineNum(2L);
		
		
		try {
			memberDAO.getDeliveryDetail(deliveryDTO);
//			int result=cartDAO.setAddToCart(cartDTO);
//			System.out.println(result);
			System.out.println("뭐");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
