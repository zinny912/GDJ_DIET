package com.goody.diet.calendar;

public class CalendarDTO {
		
		private Long num;
		private String title;
		private String video;
		private String start;
		private String end;
		private String days;
	   
		public String getDays() {
			return days;
		}
		public void setDays(String days) {
			this.days = days;
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
		public String getVideo() {
			return video;
		}
		public void setVideo(String video) {
			this.video = video;
		}
		public String getStart() {
			return start;
		}
		public void setStart(String start) {
			this.start = start;
		}
		public String getEnd() {
			return end;
		}
		public void setEnd(String end) {
			this.end = end;
		}
}