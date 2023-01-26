package com.gdj.music.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj.music.reservation.model.service.ReservationService;

@Controller
@RequestMapping("/adminSale")
public class AdminSaleController {
	
	private ReservationService service;
	
	
	

	public AdminSaleController(ReservationService service) {
		super();
		this.service = service;
	}




	@RequestMapping("performanceSale.do")
	public String selectSales() {
		
		int countPerDay = service.countDaySales();
		System.out.println(countPerDay);
		
		return "admin/perforSale";
	}
}
