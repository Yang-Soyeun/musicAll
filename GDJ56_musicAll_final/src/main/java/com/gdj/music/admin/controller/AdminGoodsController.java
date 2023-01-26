package com.gdj.music.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj.music.admin.model.service.AdminGoodsService;

@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController {
	
	private AdminGoodsService service;

	@Autowired
	public AdminGoodsController(AdminGoodsService service) {
		super();
		this.service = service;
	}
	
	//관리자 굿즈 메인
	@RequestMapping("/adgMain.do")
	public String adgMain() {
		return "/admin/store/adminGoodsList";
	}
	
	//굿즈 등록 페이지
	@RequestMapping("/goodsInsert.do")
	public String goodsInsert() {
		return "/admin/store/goodsInsert";
	}
	

}
