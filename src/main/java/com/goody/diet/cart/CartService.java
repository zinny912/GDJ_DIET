package com.goody.diet.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	CartDAO cartDAO;
	
	public int setAddToCart(CartDTO cartDTO) {
		return cartDAO.setAddToCart(cartDTO);
	}
	
}
