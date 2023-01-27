package com.gdj.music.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj.music.member.model.service.MemberService;
import com.gdj.music.member.model.vo.Member;
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
	public void insertq(Question q, HttpSession session, HttpServletResponse response) throws IOException {
		
		Member m = (Member) session.getAttribute("loginMember");
		q.setMemberNo(m.getMember_No());
		
		int qt = service.insertq(q);
		
		
		response.getWriter().print(qt);
	}
	 
	
	
	
	
	
}
