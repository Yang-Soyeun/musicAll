package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;

public interface AdminGoodsService {
	
	//굿즈 등록
	int insertGoods(Goods g, List<GoodsImg> files);
	
	//굿즈 리스트
	List<Goods> goodsList(Map<String, Integer> param);
	
	//이미지 리스트
	List<GoodsImg> goodsImg();
	
	int totalData();
	
	//굿즈 상세화면

	
	//굿즈 수정
	int updateGoods(Goods g, List<GoodsImg> files);

	
}
