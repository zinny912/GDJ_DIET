package com.goody.diet.healthMachine;

import java.util.List;

public class HealthMachineDTO {

	private Long machineNum;
	private Long categoryNum;
	private String machineName;
	private Double machineScore;
	private Long price;
	private Long salePrice;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	
	private List<HealthMachineImgDTO> healthMachineImgDTOs;
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
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Long salePrice) {
		this.salePrice = salePrice;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public List<HealthMachineImgDTO> getHealthMachineImgDTOs() {
		return healthMachineImgDTOs;
	}
	public void setHealthMachineImgDTOs(List<HealthMachineImgDTO> healthMachineImgDTOs) {
		this.healthMachineImgDTOs = healthMachineImgDTOs;
	}
	
		
}