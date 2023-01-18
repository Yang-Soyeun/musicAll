package com.gdj.music.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj.music.pay.model.service.PayService;

@Controller
public class PayController {
	
	private PayService service;

	@Autowired
	public PayController(PayService service) {
		super();
		this.service = service;
	}
	
	
}
