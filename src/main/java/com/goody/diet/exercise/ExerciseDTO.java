package com.goody.diet.exercise;

import java.util.List;

import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;

public class ExerciseDTO extends HealthMachineDTO {
	
	private Long num;
	private Long machineNum;
	private String urlId;
	private Long power;
	private String time;
	private String detailTitle;
	private String highLight;
	private String info;
	
	private List<BoardFileDTO> boardFileDTOs;
	private HealthMachineDTO healthMachineDTOs;
	private String machinName;//info에서 사용
	
	private List<BodyDTO> bodyDTO;
	private Long bodyNum;
	
	
	

  

	public HealthMachineDTO getHealthMachineDTOs() {
		return healthMachineDTOs;
	}

	public void setHealthMachineDTOs(HealthMachineDTO healthMachineDTOs) {
		this.healthMachineDTOs = healthMachineDTOs;
	}

	public Long getBodyNum() {
        return bodyNum;
    }

    public void setBodyNum(Long bodyNum) {
        this.bodyNum = bodyNum;
    }

	
	
	public List<BodyDTO> getBodyDTO() {
		return bodyDTO;
	}
	public void setBodyDTO(List<BodyDTO> bodyDTO) {
		this.bodyDTO = bodyDTO;
	}
	
	
	public String getMachinName() {
		return machinName;
	}

	public void setMachinName(String machinName) {
		this.machinName = machinName;
	}

	public String getHighLight() {
		return highLight;
	}
	public void setHighLight(String highLight) {
		this.highLight = highLight;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getDetailTitle() {
		return detailTitle;
	}
	public void setDetailTitle(String detailTitle) {
		this.detailTitle = detailTitle;
	}
	
	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}
	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}
	
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Long getMachineNum() {
		return machineNum;
	}
	public void setMachineNum(Long machineNum) {
		this.machineNum = machineNum;
	}
	public Long getPower() {
		return power;
	}
	public void setPower(Long power) {
		this.power = power;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public String getUrlId() {
		return urlId;
	}
	public void setUrlId(String urlId) {
		this.urlId = urlId;
	}

}
