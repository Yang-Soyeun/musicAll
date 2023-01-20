package com.gdj.music.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.common.EmailSendModule;
import com.gdj.music.member.model.service.MemberService;
import com.gdj.music.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
@SessionAttributes({"loginMember"})//==model에 저장된 attribute 중 loginMember는 session이야
@RequestMapping("/member")
public class MemberController {
	
	
	  private MemberService service;
	  private EmailSendModule module;
	  
	  @Autowired 
	  public MemberController(MemberService service, EmailSendModule module) { 
		  super();
		  this.service = service; 
		  this.module = module;
	
	  }

	//로그인 화면 전환
	@RequestMapping("/login.do")
	public String loginView() {
		return "/member/login";
	}
	
	//로그인 구현
	@RequestMapping("/loginEnd.do")
	public void loginEnd(String memberId, String memberPw, HttpServletResponse response,Model model ) throws IOException{
		Member m = Member.builder().member_Id(memberId).password(memberPw).build();
		
		Member loginMember = service.loginEnd(m);
		
		System.out.println(loginMember);
		
		//DB에 등록된 아이디와 비밀번호가 일치하지 않으면!
		if(!memberPw.equals(loginMember.getPassword())) {
			response.getWriter().print(false);
		}else {
//			session.setAttribute("loginMember", loginMember);
			model.addAttribute("loginMember",loginMember);
			response.getWriter().print(true);
		}
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
	public String logOut(SessionStatus session) {
		
		if(!session.isComplete()) {//session이 소멸되지 않았으면
			session.setComplete();	//session 삭제
		}
		
		return "redirect:/";
	}
	
	//아이디찾기 팝업화면 이동
	@RequestMapping("/findId.do")
	public ModelAndView findid(String gbn, ModelAndView mav) {

		mav.addObject("gbn", gbn);
		mav.setViewName("/member/findid");
		
		return mav;
	}
	
	//아이디 찾기 ajax 구현
	@RequestMapping("/findidEnd.do")
	public void findidEnd(Member member,HttpServletResponse response) throws IOException {
		
		Member m = service.findidEnd(member);
		
		if(m==null) {
			response.getWriter().print("");
			
		}else {
			response.getWriter().print(m.getMember_Id());
		}
	}
	
	//비밀번호찾기 팝업화면 이동
	@RequestMapping("/findPw.do")
	public String findpw() {
		return "/member/findpw";
	}
	
	
	//비밀번호 찾기 ajax 구현
	@RequestMapping("/findpwEnd.do")
	public void findpwEnd(Member member,HttpServletResponse response) throws IOException {
		
		Member m = service.findpwEnd(member);
		
		System.out.println(member);
		System.out.println(m);
		

		
		if(m!=null) {
			//비밀번호 찾기시 아이디값 보여주기 위한 로직
			JsonObject jo = new JsonObject();
			
			jo.addProperty("member_id", m.getMember_Id());
			jo.addProperty("number", module.joinEmail(m.getEmail()));
			Gson g = new Gson();
			g.toJson(jo, response.getWriter());
		}else {
			response.getWriter().print(false);
		}
	}
	
	//비밀번호 변경구현
	@RequestMapping("/repassword.do")
	public void newPw(String newPw, String repwid,HttpServletResponse response) throws IOException {
		int result = service.newPw(newPw,repwid);
		
		response.getWriter().print(result);
		
	}
	
			
	
	
	
	
}
