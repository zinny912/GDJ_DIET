package com.goody.diet.order;

import java.sql.Date;
import java.util.List;

import com.goody.diet.cart.CartDTO;

public class OrderDTO {

	private Long orderNum;
	private String id;
	private Date orderDate;
	private Long orderStatus;
	private List<CartDTO> cartDTOs;
	
	
	

	public List<CartDTO> getCartDTOs() {
		return cartDTOs;
	}
	public void setCartDTOs(List<CartDTO> cartDTOs) {
		this.cartDTOs = cartDTOs;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Long getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Long orderStatus) {
		this.orderStatus = orderStatus;
	}

	
	
	
}
