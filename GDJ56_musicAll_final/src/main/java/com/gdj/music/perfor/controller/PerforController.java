package com.gdj.music.perfor.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminPerforService;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.perfor.model.service.PerformanceService;
import com.gdj.music.perfor.model.vo.Mlike;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;
import com.gdj.music.reservation.model.service.ReservationService;

@Controller
@RequestMapping("/perfor")
public class PerforController {
	
	private PerformanceService service;
	  
	  @Autowired 
	  public PerforController(PerformanceService service) {
		  this.service=service; 
	  }
	  
	//공연 리스트
	@RequestMapping("/performanceList.do")
	public ModelAndView performanceList(ModelAndView mv) {
		mv.addObject("musicalPhoto",service.selectPerforList());
		mv.setViewName("perfor/performanceList");
		return mv;
	}
	
	//공연 상세페이지
	@RequestMapping("/performanceView.do")
	public String performanceView(Model model, int mCode,HttpSession session) {
		 model.addAttribute("musical",service.selectPerformanceView(mCode));
		 model.addAttribute("perPhoto",service.selectPhoto(mCode));
		 model.addAttribute("reservation",service.selectReservation(mCode));
		 model.addAttribute("scoreAverage",service.selectAverage(mCode));
		 
		 Member m=(Member)session.getAttribute("loginMember");
		 int memberNo=m.getMember_No();
		 
		 Mlike like=Mlike.builder()
					.mCode(mCode)
					.member_No(memberNo)
					.build();
		 
		 model.addAttribute("mLike",service.selectMlike(like));//관심 공연 등록 여부 가져오기 
		 
		 List<Map<String,Review>> r= service.selectComment(mCode);
		 model.addAttribute("comment",r);
		 
		  //model.addAttribute("schedule",service.selectSchedule(mCode));//스케줄 전체를 가지고 오는 리스트
		  List<Map<String,Schedule>> s=service.selectSchedule(mCode);
		  //System.out.println(s);
		  List sc=new ArrayList();
		  for(int i=0;i<s.size();i++) {
			  sc.add(s.get(i).get("S_DAY"));
		  }
		  //System.out.println(sc);
		  //요일 중복제거한 리스트 
		  model.addAttribute("scDay",sc.stream().distinct().collect(Collectors.toList()));
		  model.addAttribute("schedule",service.selectSchedule(mCode));
		return "perfor/performanceView";
	}
	
	//한줄평 등록
	@RequestMapping("/insertComment.do")
	public ModelAndView insertComment(ModelAndView mv,HttpSession session,String ct,int rating,int mCode) {
		Member m=(Member)session.getAttribute("loginMember");
		
		int memberNo=m.getMember_No();
		//System.out.println("내용: "+ct);
		//System.out.println("별점밸류값: "+rating);

		
		Review r=Review.builder()
				.reviewContent(ct)
				.score(rating)
				.memberNo(memberNo)
				.mCode(mCode)
				.build();
		
		int result=service.insertComment(r);
		
		mv.addObject("loc","/perfor/performanceView.do?mCode="+mCode);
		mv.setViewName("common/msg");		
		
		return mv;
		
	}
	
	//관심공연 등록하기
	@RequestMapping("/addMyMusical.do")
	public ModelAndView addMyMusical(ModelAndView mv,int mCode,int memberNo) {
		Mlike like=Mlike.builder()
				.mCode(mCode)
				.member_No(memberNo)
				.build();
		
		int result=service.insertMyMusical(like);
		
		mv.addObject("loc","/perfor/performanceView.do?mCode="+mCode);
		mv.addObject("msg","관심공연으로 등록되었습니다");
		mv.setViewName("common/msg");
		return mv;
	}
	
	//관심공연 해제하기 
	@RequestMapping("/deleteMyMusical.do")
	public ModelAndView deleteMyMusical(ModelAndView mv,int mCode,int memberNo) {
		Mlike like=Mlike.builder()
				.mCode(mCode)
				.member_No(memberNo)
				.build();

		int result=service.deleteMyMusical(like);
		
		mv.addObject("loc","/perfor/performanceView.do?mCode="+mCode);
		mv.addObject("msg","관심공연이 해제되었습니다");
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	
	
	
	
	@RequestMapping("/performance.do")
	public String performance() {
		return "/performanceView.do";
	}
	
}
