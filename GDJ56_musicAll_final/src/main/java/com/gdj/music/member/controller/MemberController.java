package com.gdj.music.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	//회원가입 선택
	@RequestMapping("/joinchoice.do")
	public String joinView() {
		return "/member/joinChoice";
	}
	
	//ajax 개인회원가입 페이지 이동
	@RequestMapping("/join.do")
	public String join(Member m) {
		
		System.out.println(m);
		
		return "/member/join";
	}
	
	//ajax 개인회원가입
	@RequestMapping("/joinend.do")
	public void joinend(Member m,HttpServletResponse response) throws IOException{
		
		int result = service.join(m);
		
		response.getWriter().print(result);
	}
	
	
	//로그아웃 구현
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
}
