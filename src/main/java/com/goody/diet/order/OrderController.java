package com.goody.diet.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.member.MemberDTO;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	@GetMapping("list")
	public ModelAndView getOrderList(ModelAndView mv, MemberDTO memberDTO) {
		
		return mv;
	}
}
