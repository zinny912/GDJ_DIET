package com.goody.diet.healthMachine;

public class HealthMachineDTO {

	private Long machineNum;
	private Long categoryNum;
	private String machineName;
	private Double machineScore;
	private String machineDetail;
	private Long price;
	private Long stock;
	private Long sale;
	
	private HealthMachineTopOptionDTO healthMachineTopOptionDTO;
	private HealthMachineBottomOptionDTO healthMachineBottomOptionDTO;
	private HealthMachineImgDTO healthMachineImgDTO;
	
	public Long getMachineNum() {
		return machineNum;
	}
	public void setMachineNum(Long machineNum) {
		this.machineNum = machineNum;
	}
	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getMachineName() {
		return machineName;
	}
	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}
	public Double getMachineScore() {
		return machineScore;
	}
	public void setMachineScore(Double machineScore) {
		this.machineScore = machineScore;
	}
	public String getMachineDetail() {
		return machineDetail;
	}
	public void setMachineDetail(String machineDetail) {
		this.machineDetail = machineDetail;
	}
	public HealthMachineTopOptionDTO getHealthMachineTopOptionDTO() {
		return healthMachineTopOptionDTO;
	}
	public void setHealthMachineTopOptionDTO(HealthMachineTopOptionDTO healthMachineTopOptionDTO) {
		this.healthMachineTopOptionDTO = healthMachineTopOptionDTO;
	}
	public HealthMachineBottomOptionDTO getHealthMachineBottomOptionDTO() {
		return healthMachineBottomOptionDTO;
	}
	public void setHealthMachineBottomOptionDTO(HealthMachineBottomOptionDTO healthMachineBottomOptionDTO) {
		this.healthMachineBottomOptionDTO = healthMachineBottomOptionDTO;
	}
	public HealthMachineImgDTO getHealthMachineImgDTO() {
		return healthMachineImgDTO;
	}
	public void setHealthMachineImgDTO(HealthMachineImgDTO healthMachineImgDTO) {
		this.healthMachineImgDTO = healthMachineImgDTO;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	public Long getSale() {
		return sale;
	}
	public void setSale(Long sale) {
		this.sale = sale;
	}
	
	
	
}
