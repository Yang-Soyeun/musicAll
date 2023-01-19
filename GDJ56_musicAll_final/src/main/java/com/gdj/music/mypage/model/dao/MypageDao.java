package com.gdj.music.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.reservation.model.vo.Point;

public interface MypageDao {
	List<Point> selectPointList(SqlSessionTemplate session, int member_No);//포인트리스트 출력
	Point selectPoint(SqlSessionTemplate session,int member_No);//남은포인트 출력
}
