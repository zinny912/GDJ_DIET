package com.goody.diet.exercise;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.goody.diet.healthMachine.HealthMachineDTO;


public class RoutineDTO extends HealthMachineDTO {
	
	private Long num;
	private String title;
	private Date startDay;
	private Date endDay;
	private String videoId;
	private Long machineNum;
	private List<HealthMachineDTO> healthMachineDTOs;
	
	
	public List<HealthMachineDTO> getHealthMachineDTOs() {
		return healthMachineDTOs;
	}
	public void setHealthMachineDTOs(List<HealthMachineDTO> healthMachineDTOs) {
		this.healthMachineDTOs = healthMachineDTOs;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getEndDay() {
		return endDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	
	public Long getMachineNum() {
		return machineNum;
	}
	public void setMachineNum(Long machineNum) {
		this.machineNum = machineNum;
	}
	public String getStartDate() {
	    SimpleDateFormat startDay = new SimpleDateFormat("yyyy-MM-dd");
	    return startDay.format(this.startDay);
	}

	public String getEndDate() {
	    SimpleDateFormat endDay = new SimpleDateFormat("yyyy-MM-dd");
	    return endDay.format(this.endDay);
	}
	
}
	