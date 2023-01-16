package com.gdj.music.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/booking")
public class ReservationController {

	//예매하기 화면
	@RequestMapping("/bookingview.do")
	public String bookingView() {
		
		return "/reservation/bookingView";
	}
	
	
	//좌석선택 화면
	@RequestMapping("/selectSeat.do")
	public String selectSeat() {
		
		return "/reservation/selectSeat";
	
	}
	
	//결제 화면
	@RequestMapping("pay.do")
	public String bookingpay() {
		
		return "/reservation/bookingPay";
	}
	
}
