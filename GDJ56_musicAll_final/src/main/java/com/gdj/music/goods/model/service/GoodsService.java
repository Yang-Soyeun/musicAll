package com.gdj.music.goods.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.goods.model.vo.GReview;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsCart;
import com.gdj.music.goods.model.vo.GoodsImg;
import com.gdj.music.goods.model.vo.MyGoods;

public interface GoodsService {
	
	//굿즈 리스트
	List<Goods> goodsList(Map<String, Integer> param);
	
	List<GoodsImg> goodsImg();
	
	//굿즈 리스트 낮은 가격순
	List<Goods> goodsLowSort(Map<String, Integer> param);
	
	//굿즈 리스트 높은 가격순
	List<Goods> goodsHighSort(Map<String, Integer> param);
	
	int totalData();
	
	//굿즈 상세 화면
	Goods goodsView(int gdCode);
	
	List<GoodsImg> goodsViewImg(int gdCode);
	
	//장바구니 담기
	int addCart(GoodsCart ct);
	
	//장바구니 체크
	GoodsCart checkCart(GoodsCart gct);
	
	//장바구니 리스트
	List<GoodsCart> goodsCart(int memberNo);
	
	//장바구니 개수
	int countCart(int member_no);
	
	//장바구니 삭제
	int deleteCart(int gdCode);

	
	//구매 내역
	List<MyGoods> selectMygoods(int memberNo);
	
	//굿즈 보유 수량
	int selectgCount(int gdCode);
	
	//상품평 등록
	int addReview(GReview r);
	
	//상품평 리스트
	List<Map<String,GReview>> selectReview(int gdCode);
	
	//상품평 개수
	int rCount(int gdCode);
	
	//리뷰 체크
//	MyGoods checkReview(MyGoods g);
//	
//	//n->y 변경
//	int updateCheck(int sbCode);
	
	//별점 평균
	int rAvg(int gdCode);
}
