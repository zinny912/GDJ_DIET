package com.goody.diet.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	CartDAO cartDAO;
	
	public List<CartDTO> getCartList(CartDTO cartDTO) throws Exception{
		return cartDAO.getCartList(cartDTO);
	}
	
	public int setCartStudyAdd(CartDTO cartDTO) throws Exception{
		return cartDAO.setCartStudyAdd(cartDTO);
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
	
	public int[] setCartDelete(Long[] checkedItems) throws Exception{
		int[] result = new int[checkedItems.length];
		for(int i=0; i<checkedItems.length; i++) {			
//	        longArray[i] = Long.parseLong(checkedItems[i]);
	        int result2 = cartDAO.setCartDelete(checkedItems[i]);
	        result[i] = result2;
	    }
		return result;
	}
}
