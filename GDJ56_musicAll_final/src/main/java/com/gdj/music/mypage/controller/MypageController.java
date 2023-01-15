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
	
	//관심공연
	@RequestMapping("/likeMusical.do")
	public String likeMusical() {
		return "mypage/likeMusical";
	}
	
	//포인트
	@RequestMapping("/pointList.do")
	public String pointList() {
		return "mypage/pointList";
	}
}
