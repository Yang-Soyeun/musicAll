package com.gdj.music.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;

public interface MypageService {
	
	List<Point> selectPointListPage(int member_No,Map<String,Integer> param);//페이징처리,포인트리스트 출력
	Point selectPoint(int member_No);//남은포인트 출력
	int selectPointCount(int member_No);//포인트 페이징처리
	
	List<Question> selectQsListPage(int member_No,Map<String,Integer> param);//1대1문의내역
	int selectQsCount(int member_No);//1대1문의 페이징처리
	
	List<Map<String,Goods>> selectSpListPage(int member_No,Map<String,Integer> param);//굿즈쇼핑내역
	int selectSpCount(int member_No);//굿즈쇼핑 페이징처리
}
