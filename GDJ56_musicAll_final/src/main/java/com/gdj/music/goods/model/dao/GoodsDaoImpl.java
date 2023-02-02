package com.gdj.music.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsCart;
import com.gdj.music.goods.model.vo.GoodsImg;
import com.gdj.music.goods.model.vo.MyGoods;

@Repository
public class GoodsDaoImpl implements GoodsDao {
	
	//굿즈 리스트
	@Override
	public List<Goods> goodsList(SqlSessionTemplate session, Map<String,Integer> param) {
		return session.selectList("goods.goodsList",null,new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}
	
	//굿즈 이미지 리스트
	@Override
	public List<GoodsImg> goodsImg(SqlSessionTemplate session) {
		return session.selectList("goodsImg.goodsImgList");
	}

	//페이징
	@Override
	public int totalData(SqlSessionTemplate session) {
		return session.selectOne("goods.totalData");
	}

	//굿즈 상세 화면
	@Override
	public Goods goodsView(SqlSessionTemplate session, int gdCode) {
		return session.selectOne("goods.goodsView", gdCode);
	}

	//굿즈 상세 이미지
	@Override
	public List<GoodsImg> goodsViewImg(SqlSessionTemplate session, int gdCode) {
		return session.selectList("goodsImg.goodsViewImg", gdCode);
	}

	//장바구니 추가
	@Override
	public int addCart(SqlSessionTemplate session, GoodsCart ct) {
		return session.insert("goods.addCart", ct);
	}

	//장바구니 체크
	public GoodsCart checkCart(SqlSessionTemplate session, GoodsCart gct) {

		return session.selectOne("goods.checkCart", gct);
	}
	
	//장바구니 리스트
	public List<GoodsCart> goodsCart(SqlSessionTemplate session, int memberNo) {
		return session.selectList("goods.selectCart", memberNo);
	}
	

}
