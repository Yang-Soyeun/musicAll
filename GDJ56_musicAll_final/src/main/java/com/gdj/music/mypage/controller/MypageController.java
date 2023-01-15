package com.gdj.music.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	//예매세부내역
	@RequestMapping("/musicalListView.do")
	public String musicalViewList(){
		
		return "mypage/musicalListView";
	}
	
}
