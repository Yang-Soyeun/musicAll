package com.gdj.music.mypage.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.mypage.model.service.MypageService;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;
import com.google.gson.Gson;

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
	
	//회원정보 수정 전 비밀번호 확인
	@RequestMapping("/checkPwd.do")
	@ResponseBody
	public Member checkPwd(Member m) {
		Member result=service.checkPwd(m);
		
		return result;
	}
	//회원정보 업데이트 화면전환
	@RequestMapping("/updateMember.do")
	public ModelAndView updateMember(ModelAndView mv,int member_No) {

		Member m=service.updateMember(member_No);
		
		mv.addObject("mem",m);
		mv.setViewName("mypage/updateMember");
		return mv;
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
	public ModelAndView likeMusical(ModelAndView mv,
			@RequestParam(value="No", defaultValue="1") int member_No,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
		
		
		
		mv.setViewName("mypage/likeMusical");
		return mv;
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
	
	
	//내가 쓴 글(내 한줄평 + 1대1문의내역 리스트)
	@RequestMapping("/myContentList.do")
	public ModelAndView myContentList(ModelAndView mv,int No,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
		
		int member_No=No;
		
		//1대1문의
		List<Question> qsList=service.selectQsListPage(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);//전체 문의내역리스트
		int totalData=service.selectQsCount(member_No);

		mv.addObject("myQs",qsList);//전체1대1문의 내역
		mv.addObject("pageBarQs",PageFactory.searchPage(cPage,numPerpage,totalData,"myContentList.do",member_No));//1대1문의 페이지바

		
		//한줄평
		List<Map<String,Review>> rvList=service.selectRvListPage(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);//내 한줄평 리스트
		totalData=service.selectRvCount(member_No);
		
		mv.addObject("myRv",rvList);//한줄평 리스트저장
		mv.addObject("pageBarRv",PageFactory.searchPage(cPage,numPerpage,totalData,"myContentList.do",member_No));//한줄평 페이지바
		
		
		
		
		
		
		mv.setViewName("mypage/myContentList");
		return mv;
	}
	//한줄평 정렬
	@RequestMapping("orderReview.do")
	public void orderReview(@RequestParam Map order,HttpServletResponse response,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) throws IOException{
		System.out.println(order);
		List<Map<String,Review>> orderList=service.orderReview(order,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);
		
		int totalData=service.orderReviewCount(order);
		
//		System.out.println(orderList);
		
		
		response.setContentType("application/json;charset=utf-8");//Gson
		
//		Gson g = new Gson();
//		g.toJson(orderList);
//		g.toJson(totalData);
//		response.getWriter().print(g);
		
		new Gson().toJson(orderList,response.getWriter());//Gson
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//1대1문의내역 검색 
	@RequestMapping("/searchQs.do")
	public ModelAndView searchQs(ModelAndView mv,@RequestParam Map search,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
//		System.out.println(param.get("member_No"));
//		System.out.println(search);
		int member_No=Integer.parseInt(String.valueOf(search.get("member_No")));
//		System.out.println("멤버 번호 :" +member_No);
		
		List<Question> list=service.searchQs(search,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);
		int totalData=service.searchQsCount(search);
//		System.out.println(list);
		mv.addObject("myQs",list);
		mv.addObject("pageBarQs",PageFactory.searchPage(cPage,numPerpage,totalData,"myContentList.do",member_No));//1대1문의 페이지바
		
		mv.setViewName("mypage/myContentList");
		return mv;

	}
	
	
//	//1대1문의내역 검색 :ajax
//	@RequestMapping("/searchQs.do")
//	public void searchQs(ModelAndView mv,@RequestParam Map param,HttpServletResponse response) throws IOException {
//		System.out.println(param);
//		List<Question> list=service.searchQs(param);
//		System.out.println("출력 값: "+list);
//		
//		response.setContentType("application/json;charset=utf-8");//Gson
//		new Gson().toJson(list,response.getWriter());//Gson
//		
//	}
}
