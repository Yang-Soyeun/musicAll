package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;


public interface AdminGoodsDao {
	
	//굿즈 등록
	int insertGoods(SqlSessionTemplate session, Goods g);
	
	int insertGoodsImg(SqlSessionTemplate session, GoodsImg gi);
	
	//굿즈 리스트
	List<Goods> goodsList(SqlSessionTemplate session, Map<String, Integer> param);
	
	List<GoodsImg> goodsImg(SqlSessionTemplate session);
	
	int totalData(SqlSessionTemplate session);

}
