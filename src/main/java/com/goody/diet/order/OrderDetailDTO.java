package com.goody.diet.order;

public class OrderDetailDTO {

	private Long orderDetailNum;
	private Long machineNum;
	private Long studyNum;
	private Long orderNum;
	private Long count;
	private Long price;
	
	public Long getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(Long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public Long getMachineNum() {
		return machineNum;
	}
	public void setMachineNum(Long machineNum) {
		this.machineNum = machineNum;
	}
	public Long getStudyNum() {
		return studyNum;
	}
	public void setStudyNum(Long studyNum) {
		this.studyNum = studyNum;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	
}
