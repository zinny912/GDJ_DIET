package com.goody.diet.study;

public class StudyBoardFileDTO {
	private Long FileNum;
	private Long StudyNum;
	private String fileName;
	private String oriName;
	
	
	public Long getFileNum() {
		return FileNum;
	}
	public void setFileNum(Long fileNum) {
		FileNum = fileNum;
	}
	
	public Long getStudyNum() {
		return StudyNum;
	}
	public void setStudyNum(Long studyNum) {
		StudyNum = studyNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	
}