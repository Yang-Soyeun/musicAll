package com.gdj.music.reservation.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.pay.model.service.PayService;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.reservation.model.service.ReservationService;
import com.gdj.music.reservation.model.vo.Reservation;


@Controller
@RequestMapping("/booking")
public class ReservationController {

	private ReservationService service;
	private PayService service2;
	@Autowired
	public ReservationController(ReservationService service, PayService service2) {
		super();
		this.service = service;
		this.service2 = service2;	
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
		model.addAttribute("mCode",mCode);
		model.addAttribute("performance",p);
		
		return "reservation/bookingView";
	}
	
	
	//좌석선택 화면
	@RequestMapping("/selectSeat.do")
	public String selectSeat(int mCode,String date, String time,Model model) {
		model.addAttribute("mCode",mCode);
		model.addAttribute("date",date);
		model.addAttribute("time",time);
		return "/reservation/selectSeat";
	
	}
	
	//결제 화면
	@RequestMapping("/pay.do")
	public String bookingPay(String[] seat,String[] info,Model model) {

		int money2 = Integer.parseInt(info[3]);
		model.addAttribute("money",money2);
		model.addAttribute("seatArr",seat);
		model.addAttribute("info",info);
		return "/reservation/bookingPay";
	}
	
	//결제완료 화면
	@RequestMapping("/payend.do")
	public ModelAndView bookingPayEnd(String[] info,ModelAndView mv) {
		Pay p = Pay.builder().pWay("card").pPrice(Integer.parseInt(info[4]))
				.pUid(info[5]).build();
		String seats = "";
		for(int i=6;i<info.length;i++) {
			seats+=info[i]+",";
		}
		System.out.println(seats);
		Reservation r = Reservation.builder().rSeat(seats.split(",")).mCode(Integer.parseInt(info[1]))
						.memberNo(Integer.parseInt(info[0])).rDate(info[2]).rTime(info[3]).build();
		int result = service2.insertPay(p, r);
		if(result>0) mv.setViewName("/reservation/bookingPayEnd");
		else mv.setViewName("/reservation/bookingPay");
		return mv;
		//return "/reservation/bookingPayEnd";
	}
}
