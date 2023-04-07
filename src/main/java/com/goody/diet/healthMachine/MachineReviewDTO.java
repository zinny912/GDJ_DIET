package com.goody.diet.healthMachine;

import java.sql.Date;
import java.util.List;

import com.goody.diet.board.BoardFileDTO;


public class MachineReviewDTO {
	private Long num;
	private Long machineNum;
	private String contents;
	private String writer;
	private Date regDate;
	private Long hit;
	private Double score;
	
	private List<HealthMachineDTO> healthMachineDTOs;

		
	public Long getMachineNum() {
		return machineNum;
	}
	public void setMachineNum(Long machineNum) {
		this.machineNum = machineNum;
	}
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public List<HealthMachineDTO> getHealthMachineDTOs() {
		return healthMachineDTOs;
	}
	public void setHealthMachineDTOs(List<HealthMachineDTO> healthMachineDTOs) {
		this.healthMachineDTOs = healthMachineDTOs;
	}

}
