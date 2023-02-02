package com.gdj.music.mypage.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.common.PaymentCheck;
import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.mypage.model.service.MypageService;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.perfor.model.vo.Mlike;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.service.ReservationService;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Reservation;
import com.google.gson.Gson;

@Controller
@SessionAttributes({"loginMember"})//==model에 저장된 attribute 중 loginMember는 session이야
@RequestMapping("/mypage")
public class MypageController {
	
	private MypageService service;
	private ReservationService service2;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MypageController(MypageService service,ReservationService service2,BCryptPasswordEncoder passwordEncoder) {
		this.service=service;
		this.service2=service2;
		this.passwordEncoder=passwordEncoder;
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
		
		
//		System.out.println("비번맞니?:"+passwordEncoder.matches(m.getPassword(),result.getPassword()));
		
		if(result != null && passwordEncoder.matches(m.getPassword(),result.getPassword())) {//비밀번호 맞을 시
//			 System.out.println("맞음");
			return result;
		}else {
//			System.out.println("틀림");
			return null;			
		}
		
	}
	//회원정보 업데이트 화면전환
	@RequestMapping("/updateMember.do")
	public ModelAndView updateMember(ModelAndView mv,int member_No) {

		Member m=service.updateMember(member_No);
		
		mv.addObject("mem",m);
		mv.setViewName("mypage/updateMember");
		return mv;
	}
	//회원정보 업데이트 
	@RequestMapping("updateMemberEnd.do")
	@ResponseBody
	public int updateMemberEnd (Member m,HttpServletResponse response) throws IOException {
		
		String encodePassword=passwordEncoder.encode(m.getPassword());//비밀번호 암호화
		m.setPassword(encodePassword);//암호화 한 비밀번호 member에 저장
		
		int result=service.updateMemberEnd(m);
		
		return result;
	}
	
	
	
	//예매내역리스트
	@RequestMapping("/musicalList.do")
	public ModelAndView musicalList(ModelAndView mv,
			HttpSession session,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="7")int numPerpage) throws java.text.ParseException{

		Member loginMember = (Member) session.getAttribute("loginMember");
		int member_No = loginMember.getMember_No();
		
		List<Map<String,Object>> list=service.selectReservationList(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);
		int totalData=service.selectReservationCount(member_No);//페이징처리
		
		for(Map<String,Object> m : list) {
//			System.out.println("예매내역 : "+m);
//			System.out.print("공연날짜 : "+(String)m.get("RR")+" & ");
//			if (m.containsKey("REVIEW_NO")) {
//				System.out.println( m.get("REVIEW_NO"));
//				
//			}else {
//				System.out.println("없음");
//			}
			
			// 오늘날짜 yyyy/MM/dd로 생성
			String todayfm = new SimpleDateFormat("yyyy/MM/dd").format(new Date(System.currentTimeMillis()));
			// yyyy/MM/dd 포맷 설정
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			//비교할 musical공연일과 today를 데이터 포맷으로 변경
			Date musical = new Date(dateFormat.parse((String)m.get("RR")).getTime()); //공연날짜
			Date today = new Date(dateFormat.parse(todayfm).getTime());//오늘날짜
			//compareTo메서드를 통한 날짜비교
			int compare = musical.compareTo(today);
			 
			//조건문
			if(compare < 0) {//공연일이 지났으면
				m.put("refund", "imposible");//환불 불가
			}
			
		}
		
		mv.addObject("reservationList",list);
		mv.addObject("pageBar",PageFactory.searchPage(cPage,numPerpage,totalData,"musicalList.do",member_No));
		mv.setViewName("mypage/musicalList");
		return mv;
	}
	
	//예매세부내역
	@RequestMapping("/musicalListView.do")
	public ModelAndView musicalListView(ModelAndView mv,@RequestParam Map r){
//		System.out.println(r);
		
		Map<String, Reservation> result=service.selectRvView(r);//예매내역 상단
//		System.out.println(result);
		Map<String, Reservation> rsResult=service.selectRsview(r);//예매내역 하단
//		System.out.println(rsResult);
		
		mv.addObject("rvDetail",result);
		mv.addObject("rsDetail",rsResult);
		mv.setViewName("mypage/musicalListView");
		return mv;
	}
	
	//환불값 가져오기
	@RequestMapping("/refundMusical.do")
	@ResponseBody
	public Map<String,Object> refundMusical(@RequestParam Map r){
		
		Map<String, Object> result=service.selectRvView(r);//예매내역 상단
		Map<String, Object> refund=service.selectRsview(r);//예매내역 하단
		
//		System.out.println(result);
//		System.out.println(refund);
		return Map.of("result",result,"refund",refund);
	}
	
	//환불과정
	@RequestMapping(value ="/cancelPay", method = { RequestMethod.POST })
	@ResponseBody
	public int cancelPay(
				@RequestParam(value= "memberNo") int memberNo,
				@RequestParam(value= "merchant_uid") String merchant_uid,
				@RequestParam(value= "imp_uid") String imp_uid,
				@RequestParam(value= "cancel_request_amount") int pPrice,//환불금액
				@RequestParam(value= "cancel_request_point") String requestPoint,//돌려줄 포인트
				@RequestParam(value= "cancel_response_point") String responsePoint//돌려받을 포인트
				) throws IOException, ParseException {
		
		
		
//		환불 처리!!
		PaymentCheck obj = new PaymentCheck();
		String token = obj.getImportToken();//토큰가져오기
		
		int result=obj.cancelPayment(token, imp_uid, pPrice);//환불 성공!
		if(result>0) {//환불 성공
			//1. 환불 시 포인트 처리
			Point p=service.selectPoint(memberNo);//멤버번호의 남은포인트
			
			if(requestPoint!="0") {//클라이언트에게 돌려줄 포인트가 있으면
				int rqP=Integer.parseInt(requestPoint.substring(1));
				
				Point point=Point.builder().mpPrice(rqP).mpType("+").memberNo(memberNo)
						.mpHistory("결제 시 사용 포인트 반환").mpPoint(p.getMpPoint()+rqP).build();
				service2.insertPoint(point);//포인트 적립
			}
			p=service.selectPoint(memberNo);//멤버번호의 남은포인트
			
			if(responsePoint!="0") {//클라이언트에게 돌려받을 포인트가 있으면
				int rsP=Integer.parseInt(responsePoint.substring(1));
				
				Point point=Point.builder().mpPrice(rsP).mpType("-").memberNo(memberNo)
						.mpHistory("예매 적립 포인트 반환").mpPoint(p.getMpPoint()-rsP).build();
				service2.insertPoint(point);//포인트 반환
			}
			p=service.selectPoint(memberNo);//멤버번호의 최종 남은포인트
			System.out.println("최종 포인트 현황 : "+p);
			
			Pay pay=service.getPcode(merchant_uid);//주문번호로 pay에서 pCode가져오기
//		System.out.println(pay);
			
			//2. 좌석 취소
			Map<String,Object> seat=service.selectSeat(pay);
//			System.out.println(seat);
			
			if(seat.containsKey("S1")) {//지울 좌석의 값이 제대로 들어와있으면
				int seatResult=service.deleteSeat(seat);
				System.out.println("좌석 삭제 개수 : "+seatResult);
			}
			
			//3. 환불 기록 넣기
			int rfResult=service.insertRefund(pay);//환불기록
			System.out.println("환불기록 넣기 성공여부 : "+rfResult);
			
			return result;
		}
		else {//환불 실패
			return result;
		}

		
	}
	
	
	
	//관심공연
	@RequestMapping("/likeMusical.do")
	public ModelAndView likeMusical(ModelAndView mv,
			HttpSession session,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="12")int numPerpage) {
		
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		int member_No = loginMember.getMember_No();
		
		List<Map<String,Mlike>> list=service.selectMlikeList(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);
		
		int totalData=service.selectMlikeCount(member_No);
		
//		System.out.println(list.get(0).get("I_NAME"));
//		for(Map<String, Mlike> m:list) {
//			System.out.println(m);
//		}
		
		mv.addObject("mLike",list);
		mv.addObject("pageBar",PageFactory.searchPage(cPage,numPerpage,totalData,"likeMusical.do",member_No));
		mv.setViewName("mypage/likeMusical");
		return mv;
	}
	
	//관심공연 삭제
	@RequestMapping("/deleteMlike.do")
	@ResponseBody
	public List<Map<String,Mlike>> deleteMlike(ModelAndView mv,@RequestParam Map ml,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="12")int numPerpage) {
		
		System.out.println(ml);
//		System.out.println(ml.get("member_No"));
		
		int result=service.deleteMlike(ml);//삭제문 잠시 주석처리 
		
//		int result=1;
		int member_No=Integer.parseInt(String.valueOf(ml.get("member_No")));
		
		if(result>0) {
			List<Map<String,Mlike>> list=service.selectMlikeList(member_No,
					Map.of("cPage",cPage,"numPerpage",numPerpage)
					);
			System.out.println(list);
			
			
			
			return list;
		}else {
			return null;
		}
	}
//	//관심공연 삭제 ajax
//	@RequestMapping("/deleteMlike.do")
//	@ResponseBody
//	public Map<String,Object> deleteMlike(ModelAndView mv,@RequestParam Map ml,
//			@RequestParam(value="cPage", defaultValue="1")int cPage,
//			@RequestParam(value="numPerpage", defaultValue="12")int numPerpage) {
//		
//		System.out.println(ml);
////		System.out.println(ml.get("member_No"));
//		
//		int result=service.deleteMlike(ml);//삭제문 잠시 주석처리 
//		
////		int result=1;
//		int member_No=Integer.parseInt(String.valueOf(ml.get("member_No")));
//		int totalData=service.selectMlikeCount(member_No);
//		
//		if(result>0) {
//			List<Map<String,Mlike>> list=service.selectMlikeList(member_No,
//					Map.of("cPage",cPage,"numPerpage",numPerpage)
//					);
//			System.out.println(list);
//			
//			
//			return Map.of("list",list,"pageBar", PageFactory.searchPage(cPage,numPerpage,totalData,"deleteMlike.do",member_No));
//		}else {
//			return null;
//		}
//	}
	
	
	
	//포인트내역출력
	@RequestMapping("/pointList.do")
	public ModelAndView pointList(ModelAndView mv,HttpSession session,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		int member_No = loginMember.getMember_No();
		
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
	public ModelAndView shoppingList(ModelAndView mv,HttpSession session,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		int member_No = loginMember.getMember_No();
		
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
	public ModelAndView myContentList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="8")int numPerpage,
			HttpSession session) {
		
//		int member_No=No;
		
		//차차수정부분 
		//int member_No=No; 이렇게 보내면 현재 url에 멤버 시퀀스 번호 다 보이며 그뒤 넘버만 바꿔도 그회원값이 다 가져오게 되어있음!
		//그래서 세션값에서 가져오게 이것만 고쳐놓았음!! 
		//추후 내가 고친부분에...혹싀..기분이 상하거나 맘에 안들면 꼭 말해줭~!!연락이 안되서..한부분만 고쳤어...ㅜㅜㅜ
		Member loginMember = (Member) session.getAttribute("loginMember");
		int member_No = loginMember.getMember_No();
		
		//1대1문의
		List<Question> qsList=service.selectQsListPage(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);//전체 문의내역리스트
		int totalData=service.selectQsCount(member_No);

//		System.out.println(qsList);
		mv.addObject("myQs",qsList);//전체1대1문의 내역
		mv.addObject("pageBarQs",PageFactory.searchPage(cPage,numPerpage,totalData,"myContentList.do",member_No));//1대1문의 페이지바

		
		//한줄평
		List<Map<String,Review>> rvList=service.selectRvListPage(member_No,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);//내 한줄평 리스트
		totalData=service.selectRvCount(member_No);
//		System.out.println(rvList);
//		for(Map<String, Review> m : rvList) {
//			System.out.println(m);
//		}
		mv.addObject("myRv",rvList);//한줄평 리스트저장
		mv.addObject("pageBarRv",PageFactory.searchPage(cPage,numPerpage,totalData,"myContentList.do",member_No));//한줄평 페이지바
		
		
		mv.setViewName("mypage/myContentList");
		return mv;
	}
	//한줄평 정렬
	@RequestMapping("/orderReview.do")
	public void orderReview(@RequestParam Map order,HttpServletResponse response,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="8")int numPerpage) throws IOException{
//		System.out.println(order);
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
//	@RequestMapping("/searchQs.do")
//	public ModelAndView searchQs(ModelAndView mv,@RequestParam Map search,
//			@RequestParam(value="cPage", defaultValue="1")int cPage,
//			@RequestParam(value="numPerpage", defaultValue="8")int numPerpage) {
////		System.out.println(param.get("member_No"));
////		System.out.println(search);
//		int member_No=Integer.parseInt(String.valueOf(search.get("member_No")));
////		System.out.println("멤버 번호 :" +member_No);
//		
//		List<Question> list=service.searchQs(search,
//				Map.of("cPage",cPage,"numPerpage",numPerpage)
//				);
//		int totalData=service.searchQsCount(search);
////		System.out.println(list);
//		mv.addObject("myQs",list);
//		mv.addObject("pageBarQs",PageFactory.searchPage(cPage,numPerpage,totalData,"myContentList.do",member_No));//1대1문의 페이지바
//		
//		mv.setViewName("mypage/myContentList");
//		return mv;
//
//	}
	
	
	//1대1문의내역 검색 :ajax
	@RequestMapping("/searchQs.do")
	@ResponseBody
	public List<Question> searchQs(ModelAndView mv,@RequestParam Map search,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="8")int numPerpage) throws IOException {
//		System.out.println(search);
		List<Question> list=service.searchQs(search,
				Map.of("cPage",cPage,"numPerpage",numPerpage)
				);
//		System.out.println("출력 값: "+list);
		
		return list;
		
	}
}
