package com.goody.diet.board.studyqna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/studyQna/**")
public class StudyQnaController {

	@Autowired
	private StudyQnaService studyQnaService;
	
}
