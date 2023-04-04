package com.goody.diet.cart;

import java.util.List;

import com.goody.diet.healthMachine.HealthMachineDTO;
import com.goody.diet.healthMachine.RealHealthMachineDTO;
import com.goody.diet.study.StudyDTO;

public class CartDTO {

	private Long num;
	private String id;
	private Long machineNum;
	private Long studyNum;
	private Long count;
	
	private List<StudyDTO> studyDTOs;
	private List<HealthMachineDTO> healthMachineDTOs; 
	private List<RealHealthMachineDTO> realHealthMachineDTOs;
	
	
	public List<RealHealthMachineDTO> getRealHealthMachineDTOs() {
		return realHealthMachineDTOs;
	}
	public void setRealHealthMachineDTOs(List<RealHealthMachineDTO> realHealthMachineDTOs) {
		this.realHealthMachineDTOs = realHealthMachineDTOs;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public List<StudyDTO> getStudyDTOs() {
		return studyDTOs;
	}
	public void setStudyDTOs(List<StudyDTO> studyDTOs) {
		this.studyDTOs = studyDTOs;
	}
	public List<HealthMachineDTO> getHealthMachineDTOs() {
		return healthMachineDTOs;
	}
	public void setHealthMachineDTOs(List<HealthMachineDTO> healthMachineDTOs) {
		this.healthMachineDTOs = healthMachineDTOs;
	}
	
}
