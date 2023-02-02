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
	public String performanceView(Model model, int mCode) {
		 model.addAttribute("musical",service.selectPerformanceView(mCode));
		 model.addAttribute("perPhoto",service.selectPhoto(mCode));
		 model.addAttribute("reservation",service.selectReservation(mCode));
		 
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
	public String insertComment(Model model,HttpSession session,String ct,int rating,int mCode) {
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
		
		
		return "perfor/performanceView";
		
	}
	

	
	
	
	
	
	@RequestMapping("/performance.do")
	public String performance() {
		return "";
	}
	
}
