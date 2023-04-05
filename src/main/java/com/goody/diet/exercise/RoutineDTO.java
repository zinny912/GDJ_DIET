package com.goody.diet.exercise;

import java.util.Date;

public class RoutineDTO {
	
	private Long num;
	private String title;
	private Date startDay;
	private Date endDay;
	private String videoId;
	private String machineNum;
	
	
	
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
	public String getMachineNum() {
		return machineNum;
	}
	public void setMachineNum(String machineNum) {
		this.machineNum = machineNum;
	}
	
	
	

}
