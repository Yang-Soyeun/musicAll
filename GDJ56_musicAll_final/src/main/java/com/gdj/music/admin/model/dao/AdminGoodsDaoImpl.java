package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;

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
	
	@Override
	public List<GoodsImg> goodsImg(SqlSessionTemplate session) {
		return session.selectList("goodsImg.goodsImgList");
	}

	@Override
	public int totalData(SqlSessionTemplate session) {
		return session.selectOne("goods.totalData");
	}
		

}
