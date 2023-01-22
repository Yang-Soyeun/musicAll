package com.gdj.music.reservation.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.reservation.model.service.ReservationService;


@Controller
@RequestMapping("/booking")
public class ReservationController {

	private ReservationService service;
	
	@Autowired
	public ReservationController(ReservationService service) {
		super();
		this.service = service;
	}

	//예매하기 화면
	@RequestMapping("/bookingview.do")
	public String bookingView(int mCode, Model model ) {
		
		List<Map<String,Performance>> p= service.selectPerform(mCode);
		List day = new ArrayList();
		for(int i=0;i<p.size();i++) {
			day.add(p.get(i).get("S_DAY"));
			
		}
		
		model.addAttribute("day",day.stream().distinct().collect(Collectors.toList()));
		
		model.addAttribute("performance",p);
		
		return "reservation/bookingView";
	}
	
	
	//좌석선택 화면
	@RequestMapping("/selectSeat.do")
	public String selectSeat(String date, String time) {
		
		return "/reservation/selectSeat";
	
	}
	
	//결제 화면
	@RequestMapping("/pay.do")
	public String bookingPay(String[] seat,String money,Model model) {
	
		int money2 = Integer.parseInt(money);
		model.addAttribute("money",money2);
		model.addAttribute("seatArr",seat);
		return "/reservation/bookingPay";
	}
	
	//결제완료 화면
	@RequestMapping("/payend.do")
	public String bookingPayEnd() {
		
		return "/reservation/bookingPayEnd";
	}
}
