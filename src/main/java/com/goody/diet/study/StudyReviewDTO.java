package com.goody.diet.study;

import java.sql.Date;

import com.goody.diet.board.BbsDTO;

public class StudyReviewDTO extends BbsDTO {
	
	private Long studyNum;
	private String title;
	private Long score;
	private Long hit;
		
	public Long getStudyNum() {
		return studyNum;
	}
	public void setStudyNum(Long studyNum) {
		this.studyNum = studyNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public Long getScore() {
		return score;
	}
	public void setScore(Long score) {
		this.score = score;
	}


}
