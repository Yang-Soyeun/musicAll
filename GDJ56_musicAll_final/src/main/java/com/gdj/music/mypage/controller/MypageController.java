package com.gdj.music.mypage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.mypage.model.service.MypageService;
import com.gdj.music.question.model.vo.Question;
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
		
		mv.addObject("mypoint",list);//전체포인트이력
		mv.addObject("mpPoint",result);//남은포인트
		mv.addObject("pageBar",PageFactory.searchPage(cPage,numPerpage,totalData,"pointList.do",member_No));
		
		mv.setViewName("mypage/pointList");
		return mv;
	}
	
	//상품구매내역	 환불처리 해야함!!!!!!!!!!!!!!!!!!!
	@RequestMapping("/shoppingList.do")
	public ModelAndView shoppingList(ModelAndView mv,int No,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
		int member_No=No;
		
		List<Map<String,Goods>> map=service.selectSpListPage(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);//굿즈쇼핑내역
//		for(Map m:map) {
//			System.out.println("굿즈이름"+m.get("G_NAME"));
//			System.out.println(m.entrySet());
//			
//		}
		int totalData=service.selectSpCount(member_No);//페이징처리 위한 카운트
		
		mv.addObject("myShopping",map);//쇼핑내역저장
		mv.addObject("pageBar",PageFactory.searchPage(cPage,numPerpage,totalData,"myContentList.do",member_No));//쇼핑페이지바
		
		mv.setViewName("mypage/shoppingList");
		return mv;
	}
	
	
	//내가 쓴 글
	@RequestMapping("/myContentList.do")
	public ModelAndView myContentList(ModelAndView mv,int No,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
		//1대1문의
		int member_No=No;
		
		List<Question> list=service.selectQsListPage(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);//전체 문의내역리스트
		int totalData=service.selectQsCount(member_No);
		
		mv.addObject("myQs",list);//전체1대1문의 내역
		mv.addObject("pageBarQs",PageFactory.searchPage(cPage,numPerpage,totalData,"myContentList.do",member_No));//1대1문의 페이지바
		
		
		mv.setViewName("mypage/myContentList");
		return mv;
	}
	
	//1대1문의내역 검색
	@RequestMapping("/searchQs.do")
	public ModelAndView searchQs(ModelAndView mv,String keyword) {
		System.out.println(keyword);
		return mv;
	}
}
