package com.goody.diet.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import com.goody.diet.healthMachine.HealthMachineDAO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.member.MemberDTO;

@Service
public class CartService {

	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	HealthMachineDAO helHealthMachineDAO;
	
	//민지
	public List<CartDTO> getCartList(CartDTO cartDTO) throws Exception{
		return cartDAO.getCartList(cartDTO);
	}
	
	public int setCartStudyAdd(CartDTO cartDTO) throws Exception{
		return cartDAO.setCartStudyAdd(cartDTO);
	}
	
	public List<CartDTO> getPaymentList(CartDTO cartDTO) throws Exception{
		return cartDAO.getPaymentList(cartDTO); 
	}
	
	public int[] setCartCheckUpdate(Long[] checkedItems) throws Exception{
		int[] result = new int[checkedItems.length];
		for(int i=0; i<checkedItems.length; i++) {			
//	        longArray[i] = Long.parseLong(checkedItems[i]);
	        int result2 = cartDAO.setCartCheckUpdate(checkedItems[i]);
	        result[i] = result2;
	    }
		return result;
	}
	
	public int[] setUnCartCheckUpdate(Long[] uncheckedItems) throws Exception{
		int[] result = new int[uncheckedItems.length];
		for(int i=0; i<uncheckedItems.length; i++) {			
//	        longArray[i] = Long.parseLong(checkedItems[i]);
	        int result2 = cartDAO.setCartUnCheckUpdate(uncheckedItems[i]);
	        result[i] = result2;
	    }
		return result;
	}
	
	public int[] setCartDelete(Long[] checkedItems) throws Exception{
		int[] result = new int[checkedItems.length];
		for(int i=0; i<checkedItems.length; i++) {			
//	        longArray[i] = Long.parseLong(checkedItems[i]);
	        int result2 = cartDAO.setCartDelete(checkedItems[i]);
	        result[i] = result2;
	    }
		return result;
	}
	
	//태현
	//		cart에 넣기
	public int setCartMachineAdd(CartDTO cartDTO,RealHealthMachineDTO realHealthMachineDTO, HttpSession session)throws Exception{
		
		realHealthMachineDTO= helHealthMachineDAO.getRealHealthMachineDetail(realHealthMachineDTO);
		//realMachineNum
		cartDTO.setRealMachineNum(realHealthMachineDTO.getRealMachineNum());
		
		//
		List<CartDTO> dtos = cartDAO.getCartList(cartDTO);
		for(CartDTO dto : dtos) {
			if(cartDTO.getRealMachineNum()==dto.getRealMachineNum()) {
				return cartDAO.setCartMachineCount(cartDTO);
			}
		}
		
		return cartDAO.setCartMachineAdd(cartDTO);
	}
	
//	public int[] setCartDelete(String[] checkedItems) throws Exception{
//		long[] longArray = new long[checkedItems.length];
//		int i=0;
//		int[] result = new int[checkedItems.length];
//		for(String str : checkedItems) {			
//			longArray[i++] = Long.parseLong(str);
//			int result2 = cartDAO.setCartDelete(longArray[i]);
//			result[i] = result2;
//		}
//		return result;
//	}
	

}
