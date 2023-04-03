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
	
}
