package com.goody.diet.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.study.StudyDTO;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	CartService cartService;
	
	@GetMapping("cartList")
	public ModelAndView setBoardAdd(CartDTO cartDTO,HttpSession session) throws Exception{
		System.out.println("list");
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		System.out.println(memberDTO.getId());
		cartDTO.setId(memberDTO.getId());
		List<CartDTO> ar = cartService.getCartList(cartDTO);
		System.out.println(ar.size());
		mv.setViewName("cart/cartList");
		mv.addObject("list", ar);
		return mv;
	}
	
	@PostMapping("cartAdd")
	public ModelAndView setCartStudyAdd(CartDTO cartDTO,HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("add");
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		System.out.println(memberDTO.getId());
		cartDTO.setId(memberDTO.getId());
		String studyNum = request.getParameter("studyNum");
		
		List<CartDTO> dtos = cartService.getCartList(cartDTO);
		for (CartDTO dto : dtos) {
			if(studyNum.equals(String.valueOf(dto.getStudyNum()))) {
				mv.setViewName("common/result");
				mv.addObject("result", "이미 존재하는 상품입니다");
				mv.addObject("url", "./cartList");
				return mv;
			}
		}
		int result = cartService.setCartStudyAdd(cartDTO);
		mv.setViewName("redirect:./cartList");
		return mv;
	}
	
	@PostMapping("cartDelete")
	public ModelAndView setCartDelete(Long[] checkedItems) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("test");
		for (Long long1 : checkedItems) {			
			System.out.println(long1);
		}
		/* String[] checkedItems = request.getParameterValues("checkedItems"); */
		int[] result = cartService.setCartDelete(checkedItems);
			
		mv.addObject("result", result[0]);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("payment")
	public ModelAndView setCartPayment(CartDTO cartDTO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		System.out.println(memberDTO.getId());
		cartDTO.setId(memberDTO.getId());
		List<CartDTO> ar = cartService.getCartList(cartDTO);
		mv.setViewName("cart/payment");
		mv.addObject("list", ar);
		return mv;
	}

}
