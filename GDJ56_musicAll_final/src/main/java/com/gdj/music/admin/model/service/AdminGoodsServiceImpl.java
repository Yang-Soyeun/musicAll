package com.gdj.music.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.music.admin.model.dao.AdminGoodsDao;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;

@Service
public class AdminGoodsServiceImpl implements AdminGoodsService {

	private SqlSessionTemplate session;
	private AdminGoodsDao dao;
	
	@Autowired
	public AdminGoodsServiceImpl(SqlSessionTemplate session, AdminGoodsDao dao) {
		super();
		this.session = session;
		this.dao = dao;
	}
	
	@Override
	@Transactional
	public int insertGoods(Goods g, List<GoodsImg> files) {
		
		int result = dao.insertGoods(session, g);
		
		if(result > 0) {
			
			int result2 = 0;
			
			for(GoodsImg gi : files) {
				
				result2 += dao.insertGoodsImg(session, gi);
				System.out.println("insert 사진:"+ gi);
			}
			
			if(result2 != files.size()) throw new RuntimeException("이미지 등록 실패");
			
			}else {
				
				throw new RuntimeException("굿즈 등록 실패");
			
			}
		
		return result;
		
	}
	
	
	
}
