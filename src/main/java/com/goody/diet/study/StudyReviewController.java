package com.goody.diet.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.goody.diet.board.BbsService;

@Controller
public class StudyReviewController {
	
	@Autowired
	private BbsService studyReviewService;
	

}
