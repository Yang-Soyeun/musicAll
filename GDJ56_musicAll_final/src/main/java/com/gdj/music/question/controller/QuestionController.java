package com.gdj.music.question.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.vo.Comment;
import com.gdj.music.member.model.service.MemberService;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.question.model.vo.Question;

@Controller
@RequestMapping("/question")
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
	
	//1:1문의 등록	
	@RequestMapping("/insertQ.do") 
	public void insertq(Question q, HttpSession session, HttpServletResponse response) throws IOException {
		
		Member m = (Member) session.getAttribute("loginMember");
		q.setMemberNo(m.getMember_No());
		
		int qt = service.insertq(q);
		
		response.getWriter().print(qt);
	}
	
	//상세화면
	@RequestMapping("/myqdetail.do")
	public ModelAndView myqDetail(int qsNo, ModelAndView mv) {
		
		Question q = new Question();
		q.setQsNo(qsNo);
		
		Comment cm = service.adminCommnet(q);
		
		Question qt = service.myqDetail(q);
		
		mv.addObject("cm",cm);
		mv.addObject("qt",qt);
		mv.setViewName("/member/myquestion");
		
		return mv;
	}
	
	//수정
	@RequestMapping("/updateQ.do")
	public void updateQ (Question qt, HttpServletResponse response) throws IOException {
		
		
		int num = service.updateQ(qt);
		
		
		response.getWriter().print(num);
		
	}
	
	//삭제
	@RequestMapping("/deleteQ.do")
	public void deleteQ(Question qt, HttpServletResponse response) throws IOException {
		
		int num = service.deleteQ(qt);
	
		response.getWriter().print(num);
	}
	
	
	 
	
	
	
	
	
}
