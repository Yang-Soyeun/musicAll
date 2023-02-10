package com.gdj.music.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.GReview;
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
	
	//굿즈 낮은 가격순
	@Override
	public List<Goods> goodsLowSort(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("goods.goodsLowSort",null,new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}

	//굿즈 높은 가격순
	@Override
	public List<Goods> goodsHighSort(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("goods.goodsHighSort",null,new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}
	
	//굿즈 태그 검색
	@Override
	public List<Goods> tagSearch(SqlSessionTemplate session, String gdTag, Map<String, Integer> param) {
		return session.selectList("goods.tagSearch", gdTag, new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
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

	//장바구니 개수
	@Override
	public int countCart(SqlSessionTemplate session, int memberNo) {
		return session.selectOne("goods.countCart", memberNo);
	}

	//장바구니 삭제
	@Override
	public int deleteCart(SqlSessionTemplate session, int gdCode) {
		return session.delete("goods.deleteCart", gdCode);
	}

	
	//구매 내역
	@Override
	public List<MyGoods> selectMygoods(SqlSessionTemplate session, int memberNo) {
		return session.selectList("goods.selectMygoods", memberNo);
	}

	
	//굿즈 보유 수량
	@Override
	public int selectgCount(SqlSessionTemplate session, int gdCode) {
		return session.selectOne("goods.selectgCount", gdCode);
	}

	//상품평 등록
	@Override
	public int addReview(SqlSessionTemplate session, GReview r) {
		return session.insert("goods.addReview", r);
	}

	//상품평 리스트
	@Override
	public List<Map<String,GReview>> selectReview(SqlSessionTemplate session, int gdCode) {
		return session.selectList("goods.selectReview", gdCode);
	}
	
	//상품평 개수
	@Override
	public int rCount(SqlSessionTemplate session, int gdCode) {
		return session.selectOne("goods.rCount", gdCode);
	}

	//별점 평균
	@Override
	public int rAvg(SqlSessionTemplate session, int gdCode) {
		return session.selectOne("goods.rAvg", gdCode);
	}

	
	//리뷰 체크
//	public MyGoods checkReview(SqlSessionTemplate session, MyGoods g) {
//
//		return session.selectOne("goods.checkReview", g);
//	}
//	
//	//n->y 변경
//	@Override
//	public int updateCheck(SqlSessionTemplate session, int sbCode) {
//		return session.update("goods.updateCheck", sbCode);
//	}

	

}
