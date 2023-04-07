package com.goody.diet.exercise;

import java.util.List;

import com.goody.diet.board.BoardFileDTO;
import com.goody.diet.healthMachine.HealthMachineDTO;

public class ExerciseDTO extends HealthMachineDTO {
	
	private Long num;
	private Long machineNum;
	private String urlId;
	private Long power;
	private String bodyPart;
	private String time;
	private String detailTitle;
	private String highLight;
	private String info;
	
	private List<BoardFileDTO> boardFileDTOs;
	private Long machinName;
	private Long bodyNum;
	
	
	public Long getMachinName() {
		return machinName;
	}
	public void setMachinName(Long machinName) {
		this.machinName = machinName;
	}
	public void setBodyNum(Long bodyNum) {
		this.bodyNum = bodyNum;
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
	public String getBodyPart() {
		return bodyPart;
	}
	public void setBodyPart(String bodyPart) {
		this.bodyPart = bodyPart;
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

	public Long getBodyNum() {
		// TODO Auto-generated method stub
		return null;
	}

}
