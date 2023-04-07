package com.goody.diet.member;

import java.util.List;

import com.goody.diet.cart.CartDTO;

public class DeliveryDTO {
	private String addressNum;
	private String id;
	private String address;
	private String recipient;
	private String recipientTel;
	List<CartDTO> cartDTOs;
	

	
	public List<CartDTO> getCartDTOs() {
		return cartDTOs;
	}
	public void setCartDTOs(List<CartDTO> cartDTOs) {
		this.cartDTOs = cartDTOs;
	}
	public String getAddressNum() {
		return addressNum;
	}
	public void setAddressNum(String addressNum) {
		this.addressNum = addressNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getRecipientTel() {
		return recipientTel;
	}
	public void setRecipientTel(String recipientTel) {
		this.recipientTel = recipientTel;
	}
	

}
