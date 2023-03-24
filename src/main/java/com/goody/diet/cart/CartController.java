package com.goody.diet.cart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	CartService cartService;
	
	@GetMapping("addToCart")
	public String setAddToCart(HttpSession session, HealthMachineDTO healthMachineDTO, Long count, StudyDTO studyDTO) throws Exception{
		//parameter로 상품id와 수량 혹은 수업
		CartDTO cartDTO = new CartDTO();
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("sessionMember");
		cartDTO.setId(memberDTO.getId());
		cartDTO.setMachineNum(healthMachineDTO.getMachineNum());
		cartDTO.setCount(count);
		cartDTO.setStudyNum(studyDTO.getStudyNum());
		
		cartService.setAddToCart(cartDTO);
		
		return null;
	}
	@GetMapping("cart")
	public String getCartList() throws Exception{
		return "/cart/cartList";
	}
	
}
