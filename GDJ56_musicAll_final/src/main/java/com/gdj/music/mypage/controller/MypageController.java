package com.gdj.music.mypage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.common.interceptor.PageFactory;
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
	public ModelAndView pointList(ModelAndView mv,int No,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
		int member_No=No;
		List<Point> list=service.selectPointListPage(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);//전체포인트이력
		Point result=service.selectPoint(member_No);//남은포인트
		
		int totalData=service.selectPointCount(member_No);//페이징처리 위한 카운트
//		System.out.println(list);
//		System.out.println(totalData);
		
		mv.addObject("mypoint",list);//전체포인트이력
		mv.addObject("mpPoint",result);//남은포인트
		mv.addObject("pageBar",PageFactory.searchPage(cPage,numPerpage,totalData,"pointList.do",member_No));
		
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
