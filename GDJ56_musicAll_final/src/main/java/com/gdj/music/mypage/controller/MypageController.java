package com.gdj.music.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.mypage.model.service.MypageService;
import com.gdj.music.reservation.model.vo.Point;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private MypageService service;
	@Autowired
	public MypageController(MypageService service) {
		this.service=service;
	}
	
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
	
	//포인트내역출력
	@RequestMapping("/pointList.do")
	public ModelAndView pointList(ModelAndView mv,int member_No) {
		
		List<Point> list=service.selectPointList(member_No);
		Point result=service.selectPoint(member_No);
		
		mv.addObject("mypoint",list);//전체포인트이력
		mv.addObject("mpPoint",result);//남은포인트
		
		mv.setViewName("mypage/pointList");
		return mv;
	}
	
	//상품구매내역
	@RequestMapping("/shoppingList.do")
	public String shoppingList() {
		return "mypage/shoppingList";
	}
	//내가 쓴 글
	@RequestMapping("/myContentList.do")
	public String myContentList() {
		return "mypage/myContentList";
	}
}
