package com.gdj.music.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;

public interface AdminGoodsDao {
	
	int insertGoods(SqlSessionTemplate session, Goods g);
	
	int insertGoodsImg(SqlSessionTemplate session, GoodsImg gi);

}
