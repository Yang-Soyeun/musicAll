package com.gdj.music.goods.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.goods.model.service.GoodsServiceImpl;
import com.gdj.music.goods.model.vo.Goods;

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
	public ModelAndView goodsMain(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage) {

		List<Goods> goods = service.goodsList(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//페이징처리
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"memberList.do" ));
		
		//굿즈 리스트
		mv.addObject("goods", goods);
		mv.addObject("img", service.goodsImg()); //이미지 가져오기
		mv.setViewName("/store/goodsMain");
		
		
		return mv;
	}
	
	@RequestMapping("/goodsView.do")
	public String goodsView(Model m, int gdCode) {
		
		m.addAttribute("goods", service.goodsView(gdCode));
		m.addAttribute("img", service.goodsViewImg(gdCode));
		
		return "/store/goodsView";
	}
	
	@RequestMapping("/goodsPay.do")
	public String goodsPay() {
		return "/store/goodsPay";
	}
	
	@RequestMapping("/goodsCart.do")
	public String goodsCart() {
		return "/store/cart";
	}
	
	@RequestMapping("/payEnd.do") 
	public String payEnd() {
		return "/store/payEnd";
	}

	@RequestMapping("/goodsRefund.do")
	public String goodsRefund() {
		return "/store/refund";
	}
}
