package com.gdj.music.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj.music.goods.model.service.GoodsServiceImpl;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	GoodsServiceImpl service;

	@Autowired
	public GoodsController(GoodsServiceImpl service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/goodsMain.do")
	public String goodsMain() {
		return "/store/goodsMain";
	}
	
	@RequestMapping("/goodsView.do")
	public String goodsView() {
		return "/store/goodsView";
	}
	

}
