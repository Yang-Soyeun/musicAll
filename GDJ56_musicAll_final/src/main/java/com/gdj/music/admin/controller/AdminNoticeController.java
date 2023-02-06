package com.gdj.music.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")

public class AdminNoticeController {
	
	@RequestMapping("noticeList.do")
	public String noticeList() {
		
		return "admin/noticeList";
	}
	
}
