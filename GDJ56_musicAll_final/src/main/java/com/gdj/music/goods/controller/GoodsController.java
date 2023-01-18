package com.gdj.music.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj.music.goods.model.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	GoodsService service;

	@Autowired
	public GoodsController(GoodsService service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/goodsMain.do")
	public String loginView() {
		return "/store/goodsMain";
	}
	

}
