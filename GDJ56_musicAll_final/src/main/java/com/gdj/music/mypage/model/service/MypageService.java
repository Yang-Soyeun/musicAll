package com.gdj.music.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.reservation.model.vo.Point;

public interface MypageService {
	
	List<Point> selectPointListPage(int member_No,Map<String,Integer> param);//페이징처리,포인트리스트 출력
	Point selectPoint(int member_No);//남은포인트 출력
	int selectPointCount(int member_No);//페이징처리
}
