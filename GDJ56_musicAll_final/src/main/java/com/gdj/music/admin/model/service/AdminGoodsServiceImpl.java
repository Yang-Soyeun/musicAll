package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.music.admin.model.dao.AdminGoodsDao;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;
import com.gdj.music.perfor.model.vo.PerformancePhoto;

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
	
	
	//굿즈 등록
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
	
	//굿즈 리스트
	@Override
	public List<Goods> goodsList(Map<String, Integer> param) {
		return dao.goodsList(session, param);
	}
	
	@Override
	public List<GoodsImg> goodsImg() {
		return dao.goodsImg(session);
	}
	
	@Override
	public int totalData() {
		return dao.totalData(session);
	}


	//굿즈 수정
	@Override
	@Transactional
	public int updateGoods(Goods g, List<GoodsImg> files) {
		
		int result = dao.updateGoods(session, g);
		
		int gdCode = g.getGdCode();
		
		if(result > 0) {
			if(files.size()>0) {
				int result2 = dao.deleteGoodsImg(session, gdCode);;
				
				for(GoodsImg gi : files) {
					
					result2 += dao.updateGoodsImg(session, gi);
					System.out.println("update 사진:"+ gi);
					
				}
			}
			
//			if(result2 != files.size()) throw new RuntimeException("이미지 수정 실패");
			
		} else {
			
			throw new RuntimeException("굿즈 수정 실패");
		
		}
		
		return result;
	}
	
	
	
}
