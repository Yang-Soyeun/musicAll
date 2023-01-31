package com.gdj.music.goods.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;

public interface GoodsService {
	
	//굿즈 리스트
	List<Goods> goodsList(Map<String, Integer> param);
	
	List<GoodsImg> goodsImg();
	
	int totalData();
	
	//굿즈 상세 화면
	Goods goodsView(int gdCode);
	
	List<GoodsImg> goodsViewImg(int gdCode);

}
