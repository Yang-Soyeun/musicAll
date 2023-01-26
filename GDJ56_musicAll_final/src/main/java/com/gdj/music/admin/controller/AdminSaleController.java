package com.gdj.music.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String selectSales(Model model) {
		//일일 예매 건수
		
		int countPerDay = service.countDaySales();
		//일일 예매 매출
		int dayPrice;
		System.out.println(service.selectDaySales());
		if(service.selectDaySales()==null) {
			dayPrice=0;
		}else {
		dayPrice = service.selectDaySales(); }
		//누적 예매 건수
		int countPerTotal = service.countTotalSales();
		//누적 예매 매출
		int totalPrice;
		if( service.selectTotalSales()==null) {
			totalPrice=0;
		}else {
			totalPrice= service.selectTotalSales();
		}
		
		model.addAttribute("count",countPerDay);
		model.addAttribute("dayPrice",dayPrice);
		model.addAttribute("totalCount",countPerTotal);
		model.addAttribute("totalPrice",totalPrice);
		
		return "admin/perforSale";
	}
}
