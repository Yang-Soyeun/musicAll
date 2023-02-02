package com.gdj.music.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

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

}
