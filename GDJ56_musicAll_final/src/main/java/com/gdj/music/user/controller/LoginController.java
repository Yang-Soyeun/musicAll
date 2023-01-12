package com.gdj.music.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	/*
	 * private LoginService service;
	 * 
	 * @Autowired public LoginController(LoginService service) { this.service =
	 * service; }
	 */
	
	@RequestMapping("/user/login.do")
	public String loginView() {
		return "/user/login";
	}
	
	@RequestMapping("/user/join.do")
	public String joinView() {
		return "/user/join";
	}
}
