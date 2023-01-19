package com.gdj.music.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminPerfor")
public class AdminPerforController {
	
	
	@RequestMapping("/performanceList.do")
	public String adminPerformanceList() {
		return "/admin/Perfor/adminPerformanceList";
	}
	
	@RequestMapping("/performanceAssign.do")
	public String adminPerformanceAssign() {
		return "/admin/Perfor/adminPerformanceAssign";
	}

}
