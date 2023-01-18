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
	
	//포인트
	@RequestMapping("/pointList.do")
	public ModelAndView pointList(ModelAndView mv) {
		List<Point> list=service.selectPointList();//memberNo넣어야함 수정필요
		mv.addObject("mypoint",service.selectPointList());
		
		System.out.println(list);
		
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
