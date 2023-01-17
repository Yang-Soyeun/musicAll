package com.gdj.music.perfor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/perfor")
public class PerforController {
	
	//공연 리스트
	@RequestMapping("/performanceList.do")
	public String performanceList() {
		return "perfor/performanceList";
	}
	//공연 상세페이지
	@RequestMapping("/performanceView.do")
	public String performanceView() {
		return "perfor/performanceView";
	}

}
