package com.gdj.music.admin.model.service;

import java.util.List;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;

public interface AdminGoodsService {
	
	int insertGoods(Goods g, List<GoodsImg> files);

}
