package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;


public interface AdminGoodsDao {
	
	//굿즈 등록
	int insertGoods(SqlSessionTemplate session, Goods g);
	
	//이미지 등록
	int insertGoodsImg(SqlSessionTemplate session, GoodsImg gi);
	
	//굿즈 리스트
	List<Goods> goodsList(SqlSessionTemplate session, Map<String, Integer> param);
	
	//이미지 리스트
	List<GoodsImg> goodsImg(SqlSessionTemplate session);
	
	//개수
	int totalData(SqlSessionTemplate session);
	
	//굿즈 수정
	int updateGoods(SqlSessionTemplate session, Goods g);
	
	//이미지 삭제
	int deleteGoodsImg(SqlSessionTemplate session, int gdCode);
	
	//이미지 수정
	int updateGoodsImg(SqlSessionTemplate session, GoodsImg gi);
	

}
