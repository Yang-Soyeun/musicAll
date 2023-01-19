package com.gdj.music.mypage.model.service;

import java.util.List;

import com.gdj.music.reservation.model.vo.Point;

public interface MypageService {
	
	List<Point> selectPointList(int member_No);//포인트리스트 출력
	Point selectPoint(int member_No);//남은포인트 출력
}
