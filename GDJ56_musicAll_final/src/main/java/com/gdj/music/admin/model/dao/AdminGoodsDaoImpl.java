package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;
import com.gdj.music.perfor.model.vo.Performance2;

@Repository
public class AdminGoodsDaoImpl implements AdminGoodsDao {
	
	//굿즈 등록
	@Override
	public int insertGoods(SqlSessionTemplate session, Goods g) {
		return session.insert("goods.insertGoods", g);
	}
	
	@Override
	public int insertGoodsImg(SqlSessionTemplate session, GoodsImg gi) {
		return session.insert("goodsImg.insertImg", gi);
	}
	
	//굿즈 리스트
	@Override
	public List<Goods> goodsList(SqlSessionTemplate session, Map<String,Integer> param) {
		return session.selectList("goods.goodsList",null,new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}
	
	//이미지 리스트
	@Override
	public List<GoodsImg> goodsImg(SqlSessionTemplate session) {
		return session.selectList("goodsImg.goodsImgList");
	}

	//개수
	@Override
	public int totalData(SqlSessionTemplate session) {
		return session.selectOne("goods.totalData");
	}

	//굿즈 수정
	@Override
	public int updateGoods(SqlSessionTemplate session, Goods g) {
		return session.update("goods.updateGoods", g);
	}

	
	//이미지 삭제
	@Override
	public int deleteGoodsImg(SqlSessionTemplate session, int gdCode) {
		return session.delete("goodsImg.deleteGoodsImg", gdCode);
	}

	//이미지 수정
	@Override
	public int updateGoodsImg(SqlSessionTemplate session, GoodsImg gi) {
		return session.insert("goodsImg.updateGoodsImg", gi);
	}
	
	//굿즈 삭제
	@Override
	public int deleteGoods(SqlSessionTemplate session, int gdCode) {
		return session.delete("goods.deleteGoods", gdCode);
	}

	//뮤지컬 리스트
	@Override
	public List<Performance2> perforList(SqlSessionTemplate session) {
		return session.selectList("goods.selectPerfor");
	}
		

}
