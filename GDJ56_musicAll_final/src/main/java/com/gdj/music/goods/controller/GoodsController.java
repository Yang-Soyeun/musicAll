package com.gdj.music.goods.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.goods.model.service.GoodsService;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsCart;
import com.gdj.music.goods.model.vo.MyGoods;
import com.gdj.music.mypage.model.service.MypageService;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	private GoodsService service;
	private MypageService serviceMp;

	@Autowired
	public GoodsController(GoodsService service, MypageService serviceMp) {
		super();
		this.service = service;
		this.serviceMp = serviceMp;
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
	
	//굿즈 상세
	@RequestMapping("/goodsView.do")
	public String goodsView(Model m, int gdCode) {
		
		m.addAttribute("goods", service.goodsView(gdCode));
		m.addAttribute("img", service.goodsViewImg(gdCode));
		
		return "/store/goodsView";
	}
	
	//결제 페이지
	@RequestMapping("/goodsPay.do")
	public String goodsPay(Model m, int gdCode, @RequestParam("member_no") String member_no, int gdCount) {
		
//		System.out.println(member_no);
//		System.out.println(gdCount);
		
		m.addAttribute("gc", gdCount);
		m.addAttribute("p", serviceMp.selectPoint(Integer.parseInt(member_no)));
		m.addAttribute("goods", service.goodsView(gdCode));
		m.addAttribute("img", service.goodsViewImg(gdCode));
		
		return "/store/goodsPay";
	}
	
	//장바구니 담기
	@RequestMapping("/addCart.do")
	public void addCart(int ctCount, int gdCode, int member_no, HttpServletResponse response) throws IOException {

		int result = 0;
		
		//Map<String,Object> gct = Map.of("memberNo", member_no, "gdCode", gdCode);
		
		GoodsCart cart=GoodsCart.builder().gdCode(gdCode).memberNo(member_no).build();
		
		
		//중복 확인
		if(service.checkCart(cart) == null) {
			
			GoodsCart ct = GoodsCart.builder()
				.ctCount(ctCount)
				.gdCode(gdCode)
				.memberNo(member_no)
				.build();
			
			result = service.addCart(ct);
			
		} else {
			
			result = 2;
			
		}
		
		response.getWriter().print(result);
		
	}
	
//	@RequestMapping("/goodsCart.do")
//	public ModelAndView goodsCart(ModelAndView mv) {
//		
//		//List<MyGoods> goods = service.myGoodsList();
//		
//		return mv;
//	}
	
	@RequestMapping("/payEnd.do") 
	public String payEnd() {
		return "/store/payEnd";
	}

	@RequestMapping("/goodsRefund.do")
	public String goodsRefund() {
		return "/store/refund";
	}
}
