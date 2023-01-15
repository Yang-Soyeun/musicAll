package com.gdj.music.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	//마이페이지메인
	@RequestMapping("/mypageMain.do")
	public String mypageMain(){
		return "mypage/mypageMain";
	}
	//예매내역리스트
	@RequestMapping("/musicalList.do")
	public String musicalList(){
		
		return "mypage/musicalList";
	}
	
	//예매세부내역
	@RequestMapping("/musicalListView.do")
	public String musicalListView(){
		
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
	
	//상품구매내역
	@RequestMapping("/shoppingList.do")
	public String shoppingList() {
		return "mypage/shoppingList";
	}
}
