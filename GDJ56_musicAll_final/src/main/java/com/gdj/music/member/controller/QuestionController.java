package com.gdj.music.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.member.model.service.MemberService;
import com.gdj.music.question.model.vo.Question;

@Controller
@RequestMapping("/member")
public class QuestionController {
		
	private MemberService service;

	@Autowired
	public QuestionController(MemberService service) {
		super();
		this.service = service;
	}
	
	
	@RequestMapping("/question.do")
	public String question() {
		
		return "/member/question";
		
	}
	
	@RequestMapping("/insertQ.do")
	public ModelAndView insertq(Question q, ModelAndView mv) {
		
	}
	
	
	
	
	
}
