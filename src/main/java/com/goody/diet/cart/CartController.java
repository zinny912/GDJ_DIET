package com.goody.diet.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.member.MemberDTO;
import com.goody.diet.order.getToken;
import com.goody.diet.study.StudyDTO;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	CartService cartService;
	
	@GetMapping("cartList")
	public ModelAndView setBoardAdd(CartDTO cartDTO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		cartDTO.setId(memberDTO.getId());
		List<CartDTO> ar = cartService.getCartList(cartDTO);
		
//		태현 MachineList넣기
		
		
//		System.out.println(ar.size());
		mv.setViewName("cart/cartList");
		mv.addObject("list", ar);
		return mv;
	}
	
	@PostMapping("cartAdd")
	public ModelAndView setCartStudyAdd(CartDTO cartDTO,HttpSession session,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		cartDTO.setId(memberDTO.getId());
		List<CartDTO> ar = cartService.getCartList(cartDTO);
		for (CartDTO cartDTO2 : ar) {
			if(cartDTO2.getStatus()==0 && cartDTO2.getStudyNum()!=null) {
				mv.setViewName("common/result");
				mv.addObject("result", "이미 장바구니에 클래스가 존재합니다. 장바구니를 확인하세요.");
				mv.addObject("url", "./cartList");
				return mv;
			}
		}
		
//		String studyNum = request.getParameter("studyNum");
//		
//		List<CartDTO> dtos = cartService.getCartList(cartDTO);
//		for (CartDTO dto : dtos) {
//			if(studyNum.equals(String.valueOf(dto.getStudyNum()))) {
//				mv.setViewName("common/result");
//				mv.addObject("result", "이미 존재하는 상품입니다");
//				mv.addObject("url", "./cartList");
//				return mv;
//			}
//		}
		int result = cartService.setCartStudyAdd(cartDTO);
		mv.setViewName("common/result");
		mv.addObject("result", "장바구니로 이동합니다.");
		mv.addObject("url", "./cartList");
		return mv;
	}
	@PostMapping("cartCheckedUpdate")
	public ModelAndView setCartCheckUpdate(CartDTO cartDTO, Long[] checkedItems,HttpSession session, Long [] cartNum,Long [] count,Long totalCost) throws Exception{
		ModelAndView mv = new ModelAndView();
//		System.out.println(totalCost);
		System.out.println(checkedItems.length);
		/* String[] checkedItems = request.getParameterValues("checkedItems"); */
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		cartDTO.setId(memberDTO.getId());
		List<CartDTO> ar = cartService.setCartCheckUpdate(cartDTO,checkedItems,session,cartNum,count);
//		String token = getToken.getpaymentToken();
		
		mv.addObject("list", ar);
		mv.addObject("totalCost", totalCost);
//		mv.addObject("token", token);
		mv.setViewName("cart/payment");
		
		
//		String mes = "결제 창 이동 실패";
//		if(result[0]>0) {
//			mes = "결제 창으로 이동합니다.";
//
//		}	
//		mv.addObject("result", mes);
//		mv.addObject("url", "./payment");
//		mv.setViewName("common/result");
		return mv;
	}
	
	//태현
	@PostMapping("cartMachineAdd")
	public ModelAndView setCartMachineAdd(ModelAndView mv,CartDTO cartDTO,RealHealthMachineDTO realHealthMachineDTO, HttpSession session)throws Exception{
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
		cartDTO.setId(memberDTO.getId());
		int result = cartService.setCartMachineAdd(cartDTO, realHealthMachineDTO, session);
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
		
	}
	@PostMapping("cartDelete")
	public ModelAndView setCartDelete(Long[] checkedItems) throws Exception{
		ModelAndView mv = new ModelAndView();
		/* String[] checkedItems = request.getParameterValues("checkedItems"); */
		int[] result = cartService.setCartDelete(checkedItems);
			
		mv.addObject("result", result[0]);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	

//	@GetMapping("payment")
//	public ModelAndView setCartPayment(CartDTO cartDTO,HttpSession session) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		MemberDTO memberDTO =(MemberDTO) session.getAttribute("sessionMember");
//		
//		cartDTO.setId(memberDTO.getId());
//		
//		List<CartDTO> ar = cartService.getPaymentList(cartDTO);
//		mv.setViewName("cart/payment");
//		mv.addObject("list", ar);
//		return mv;
//	}

}
