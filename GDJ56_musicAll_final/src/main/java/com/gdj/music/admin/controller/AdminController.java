package com.gdj.music.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj.music.member.model.service.MemberService;
import com.gdj.music.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private MemberService service1;
	
	//관리자 페이지로 보내기 
	@RequestMapping("/adminMain.do")
	public String adminMain(){
		return "/admin/main";

	}
}
