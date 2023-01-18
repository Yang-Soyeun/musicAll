package com.gdj.music.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.reservation.model.vo.Point;

@Repository
public class MypageDaoImpl implements MypageDao {

	//포인트리스트 출력
	@Override
	public List<Point> selectPointList(SqlSessionTemplate session) {
		return session.selectList("mypage.selectPointList");
	}
	
	
}
