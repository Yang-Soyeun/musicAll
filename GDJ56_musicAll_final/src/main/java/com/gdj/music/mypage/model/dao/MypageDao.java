package com.gdj.music.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.reservation.model.vo.Point;

public interface MypageDao {
	List<Point> selectPointList(SqlSessionTemplate session);//포인트리스트 출력
}
