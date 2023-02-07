package com.gdj.music.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.goods.model.vo.GReview;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsCart;
import com.gdj.music.goods.model.vo.GoodsImg;
import com.gdj.music.goods.model.vo.MyGoods;

public interface GoodsDao {
	
	//굿즈 리스트
	List<Goods> goodsList(SqlSessionTemplate session, Map<String, Integer> param);
	
	List<GoodsImg> goodsImg(SqlSessionTemplate session);
	
	int totalData(SqlSessionTemplate session);
	
	//굿즈 상세 화면
	Goods goodsView(SqlSessionTemplate session, int gdCode);
	
	List<GoodsImg> goodsViewImg(SqlSessionTemplate session, int gdCode);
	
	//장바구니 담기
	int addCart(SqlSessionTemplate session, GoodsCart ct);
	
	//장바구니 체크
	GoodsCart checkCart(SqlSessionTemplate session, GoodsCart gct);
	
	//장바구니 리스트
	List<GoodsCart> goodsCart(SqlSessionTemplate session, int memberNo);
	
	//장바구니 개수
	int countCart(SqlSessionTemplate session, int memberNo);
	
	//장바구니 삭제
	int deleteCart(SqlSessionTemplate session, int gdCode);
	
	//구매 내역
	List<MyGoods> selectMygoods(SqlSessionTemplate session, int memberNo);
	
	//보유 굿즈 수량
	int selectgCount(SqlSessionTemplate session, int gdCode);

	//상품평 등록
	int addReview(SqlSessionTemplate session, GReview r);
	
	//상품평 리스트
	List<Map<String,GReview>> selectReview(SqlSessionTemplate session, int gdCode);

	//상품평 개수
	int rCount(SqlSessionTemplate session, int gdCode);
}
