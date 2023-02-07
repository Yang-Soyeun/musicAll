package com.gdj.music.goods.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.music.goods.model.dao.GoodsDao;
import com.gdj.music.goods.model.vo.GReview;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsCart;
import com.gdj.music.goods.model.vo.GoodsImg;
import com.gdj.music.goods.model.vo.MyGoods;

@Service
public class GoodsServiceImpl implements GoodsService {
	

	private SqlSessionTemplate session;
	private GoodsDao dao;
	
	@Autowired
	public GoodsServiceImpl(SqlSessionTemplate session, GoodsDao dao) {
		super();
		this.session = session;
		this.dao = dao;
	}
	
	
	//굿즈 리스트
	@Override
	public List<Goods> goodsList(Map<String, Integer> param) {
		return dao.goodsList(session, param);
	}
	
	@Override
	public List<GoodsImg> goodsImg() {
		return dao.goodsImg(session);
	}
	
	@Override
	public int totalData() {
		return dao.totalData(session);
	}
	
	//굿즈 상세 화면
	@Override
	public Goods goodsView(int gdCode) {
		return dao.goodsView(session, gdCode);
	}
	
	@Override
	public List<GoodsImg> goodsViewImg(int gdCode) {
		return dao.goodsViewImg(session, gdCode);
	}


	//장바구니 담기
	@Override
	@Transactional
	public int addCart(GoodsCart ct) {
		return dao.addCart(session, ct);
	}

	//장바구니 체크
	@Override
	public GoodsCart checkCart(GoodsCart gct) {

		return dao.checkCart(session, gct);
	}

	//장바구니 리스트
	@Override
	public List<GoodsCart> goodsCart(int memberNo) {
		return dao.goodsCart(session, memberNo);
	}

	//장바구니 개수
	@Override
	public int countCart(int memberNo) {
		return dao.countCart(session, memberNo);
	}

	//장바구니 삭제
	@Override
	public int deleteCart(int gdCode) {
		return dao.deleteCart(session, gdCode);
	}


	//구매 내역
	@Override
	public List<MyGoods> selectMygoods(int memberNo) {
		return dao.selectMygoods(session, memberNo);
	}

	//굿즈 보유 수량
	@Override
	public int selectgCount(int gdCode) {
		return dao.selectgCount(session, gdCode);
	}


	//상품평 등록
	@Override
	public int addReview(GReview r) {
		return dao.addReview(session, r);
	}

	//상품평 리스트
	@Override
	public List<Map<String,GReview>> selectReview(int gdCode) {
		return dao.selectReview(session, gdCode);
	}

	//상품평 개수
	@Override
	public int rCount(int gdCode) {
		return dao.rCount(session, gdCode);
	}


	

}
