package com.gdj.music.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;

@Repository
public class GoodsDaoImpl implements GoodsDao {
	
	//굿즈 리스트
	@Override
	public List<Goods> goodsList(SqlSessionTemplate session, Map<String,Integer> param) {
		return session.selectList("goods.goodsList",null,new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}
	
	@Override
	public List<GoodsImg> goodsImg(SqlSessionTemplate session) {
		return session.selectList("goodsImg.goodsImgList");
	}

	@Override
	public int totalData(SqlSessionTemplate session) {
		return session.selectOne("goods.totalData");
	}

	@Override
	public Goods goodsView(SqlSessionTemplate session, int gdCode) {
		return session.selectOne("goods.goodsView", gdCode);
	}

	@Override
	public List<GoodsImg> goodsViewImg(SqlSessionTemplate session, int gdCode) {
		return session.selectList("goodsImg.goodsViewImg", gdCode);
	}
	
	

}
