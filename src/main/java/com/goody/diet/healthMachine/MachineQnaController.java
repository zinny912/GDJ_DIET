package com.goody.diet.healthMachine;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goody.diet.study.StudyQnaDTO;
import com.goody.diet.util.Pager;

@Controller
@RequestMapping("/machineQna/**")
public class MachineQnaController {
	
	@Autowired
	private MachineQnaService machineQnaService;
	
//	@ModelAttribute("boardName")
//	public String getBoardName() {
//		return "qna";
//	}
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MachineQnaDTO> ar = machineQnaService.getBoardList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("machineQna/list");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setBoardAdd(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("machineQna/add");
		
		return mv;
	}
	

	@PostMapping("add")
	public ModelAndView setBoardAdd(MachineQnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = machineQnaService.setBoardAdd(qnaDTO);
		
		String message="등록 실패";
		if(result>0) {
			message="글이 등록 되었습니다";
		}
		
		mv.addObject("result",message);
		mv.addObject("url","/healthMachine/detail?machineNum="+qnaDTO.getMachineNum());
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(MachineQnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = machineQnaService.setHitUpdate(qnaDTO);
		qnaDTO = machineQnaService.getBoardDetail(qnaDTO);

		mv.addObject("dto", qnaDTO);
		mv.setViewName("machineQna/detail");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setBoardUpdate(MachineQnaDTO qnaDTO, ModelAndView mv) throws Exception{
		qnaDTO = machineQnaService.getBoardDetail(qnaDTO);
		
		mv.addObject("dto", qnaDTO);
		
		mv.setViewName("machineQna/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setBoardUpdate(MachineQnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = machineQnaService.setBoardUpdate(qnaDTO);
		String message="수정 실패";
		if(result>0) {
			message="글이 수정 되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "/healthMachine/detail?machineNum="+qnaDTO.getMachineNum());
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setBoardDelete(MachineQnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = machineQnaService.setBoardDelete(qnaDTO);
		String message="삭제 실패";
		if(result>0) {
			message="글이 삭제 되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "/healthMachine/detail?machineNum="+qnaDTO.getMachineNum());
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("reply")
	public ModelAndView setReplyAdd(MachineQnaDTO qnaDTO, ModelAndView mv) throws Exception{
		mv.setViewName("machineQna/reply");
		return mv;
	}
	
	@PostMapping("reply")
	public ModelAndView setReplyAdd(MachineQnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = machineQnaService.setReplyAdd(qnaDTO);
		
		String message="등록 실패";
		if(result>0) {
			message="글이 등록 되었습니다";
		}
		
		mv.setViewName("common/result");
		mv.addObject("result", message);
		mv.addObject("url","/healthMachine/detail?machineNum="+qnaDTO.getMachineNum());
		return mv;
	}
}
