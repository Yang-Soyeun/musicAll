package com.gdj.music.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;

@Repository
public class AdminGoodsDaoImpl implements AdminGoodsDao {
	
	@Override
	public int insertGoods(SqlSessionTemplate session, Goods g) {
		return session.insert("goods.insertGoods", g);
	}
	
	@Override
	public int insertGoodsImg(SqlSessionTemplate session, GoodsImg gi) {
		return session.insert("img.insertImg", gi);
	}

}
