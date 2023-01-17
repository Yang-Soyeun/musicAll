package com.gdj.music.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gdj.music.member.model.service.MemberService;
import com.gdj.music.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	  private MemberService service;
	  
	  @Autowired 
	  public MemberController(MemberService service) { 
		  this.service = service; 
	
	  }

	//로그인 화면 전환
	@RequestMapping("/login.do")
	public String loginView() {
		return "/member/login";
	}
	
	//로그인 구현
	@RequestMapping("/loginEnd.do")
	public String loginEnd(String memberId, String memberPw, HttpSession session) {
		Member m = Member.builder().member_Id(memberId).password(memberPw).build();
		
		Member loginMember = service.loginEnd(m);
		
		System.out.println(loginMember);
		
		//DB에 등록된 아이디와 비밀번호가 일치하지 않으면!
		if(!memberPw.equals(loginMember.getPassword())) {
			return "member/login";
		}
		//일치하면 session에 값을 넣어준다
		session.setAttribute("loginMember", loginMember);
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/join.do")
	public String joinView() {
		return "/member/join";
	}
}
