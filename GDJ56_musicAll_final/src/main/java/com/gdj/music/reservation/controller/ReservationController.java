package com.gdj.music.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/booking")
public class ReservationController {

	
	@RequestMapping("bookingview.do")
	public String bookingView() {
		
		return "/reservation/bookingView";
	}
}
