package com.gdj.music.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.mypage.model.dao.MypageDao;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;

@Service
public class MypageServiceImpl implements MypageService {
	
	private MypageDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MypageServiceImpl(MypageDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	
	//포인트리스트출력
	@Override
	public List<Point> selectPointListPage(int member_No, Map<String,Integer> param) {
		return dao.selectPointListPage(session, member_No,param);
	}
	
	//남은 포인트 출력
	@Override
	public Point selectPoint(int member_No) {
		return dao.selectPoint(session,member_No);
	}
	//포인트 페이징카운트
	@Override
	public int selectPointCount(int member_No) {
		return dao.selectPointCount(session,member_No);
	}

	
	
	
	
	//1대1문의 리스트 출력
	@Override
	public List<Question> selectQsListPage(int member_No, Map<String, Integer> param) {
		return dao.selectQsListPage(session,member_No,param);
	}
	//1대1문의 페이징카운트
	@Override
	public int selectQsCount(int member_No) {
		return dao.selectQsCount(session,member_No);
	}
	
	//1대1문의 검색
	@Override
	public List<Question> searchQs(Map<String,Integer> search,Map<String, Integer> param) {
		return dao.searchQs(session,search,param);
	}
	//1대1문의 검색 페이징처리
	@Override
	public int searchQsCount(Map<String,Integer> param) {
		return dao.searchQsCount(session,param);
	}

	
	
	
	
	
	//굿즈쇼핑내역
	@Override
	public List<Map<String,Goods>> selectSpListPage(int member_No, Map<String, Integer> param) {
		return dao.selectSpListPage(session,member_No,param);
	}
	//굿즈쇼핑 페이징처리
	@Override
	public int selectSpCount(int member_No) {
		return dao.selectSpCount(session,member_No);
	}
	
	
	
	
	
	
}
