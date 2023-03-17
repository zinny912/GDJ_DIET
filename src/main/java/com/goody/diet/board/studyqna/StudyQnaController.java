package com.goody.diet.board.studyqna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.board.BbsDTO;
import com.goody.diet.board.BoardDTO;
import com.goody.diet.util.Pager;

@Controller
@RequestMapping("/studyQna/**")
public class StudyQnaController {

	@Autowired
	private StudyQnaService studyQnaService;
	
	@ModelAttribute("boardName")
	public String getBoardName() {
		return "qna";
	}
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BbsDTO> ar = studyQnaService.getBoardList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("studyQna/list");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setBoardAdd() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studyQna/add");
		
		return mv;
	}
	

	@PostMapping("add")
	public ModelAndView setBoardAdd(StudyQnaDTO studyQnaDTO, MultipartFile[] addFiles,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = studyQnaService.setBoardAdd(studyQnaDTO, null, session);
		
		String message="등록 실패";
		if(result>0) {
			message="글이 등록 되었습니다";
		}
		
		mv.addObject("result",message);
		mv.addObject("url","/study/studyDetail?studyNum="+studyQnaDTO.getStudyNum());
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(StudyQnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = studyQnaService.getBoardDetail(qnaDTO);
		
		mv.addObject("dto", boardDTO);
		mv.setViewName("studyQna/detail");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setBoardUpdate(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		boardDTO = studyQnaService.getBoardDetail(boardDTO);
		
		mv.addObject("dto", boardDTO);
		
		mv.setViewName("studyQna/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setBoardUpdate(BoardDTO boardDTO, MultipartFile[] addFiles, HttpSession session, Long[] fileNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(fileNum);
		int result = studyQnaService.setBoardUpdate(boardDTO, null, session, null);
		mv.setViewName("common/result");
		mv.addObject("result", "수정성공");
		mv.addObject("url", "/studyQna/detail?num="+boardDTO.getNum());
		
		return mv;
	}
}
