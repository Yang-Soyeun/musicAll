package com.gdj.music.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.reservation.model.vo.Point;

@Repository
public class MypageDaoImpl implements MypageDao {

	//포인트리스트 출력
	@Override
	public List<Point> selectPointList(SqlSessionTemplate session,int member_No) {
		return session.selectList("mypage.selectPointList",member_No);
	}

	//남은 포인트 출력
	@Override
	public Point selectPoint(SqlSessionTemplate session, int member_No) {
		return session.selectOne("mypage.selectPoint",member_No);
	}
	
	
}
