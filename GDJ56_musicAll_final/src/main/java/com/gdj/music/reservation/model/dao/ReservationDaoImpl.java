package com.gdj.music.reservation.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.reservation.model.vo.Point;
@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Override
	
	//공연출력
	public List<Map<String,Performance>> selectPerform(SqlSessionTemplate session, int mCode) {
		return session.selectList("booking.selectPerform",mCode);
	}

	@Override
	public int selectHall(SqlSessionTemplate session, int mCode) {
		// TODO Auto-generated method stub
		return session.selectOne("booking.selectHall",mCode);
	}

	@Override
	public List<String> selectSeats(SqlSessionTemplate session, Map<String,Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("booking.selectSeats",map);
	}

	@Override
	public String selectMusical(SqlSessionTemplate session, int mCode) {
		// TODO Auto-generated method stub
		return session.selectOne("booking.selectMusical",mCode);
	}

	@Override
	public int insertPoint(SqlSessionTemplate session, Point p) {
		// TODO Auto-generated method stub
		return session.insert("booking.insertPoint",p);
	}

	@Override
	public int addPoint(SqlSessionTemplate session, Point po) {
		// TODO Auto-generated method stub
		return session.update("booking.addPoint",po);
	}

	@Override
	public int minusPoint(SqlSessionTemplate session, Point po) {
		// TODO Auto-generated method stub
		return session.update("booking.minusPoint",po);
	}

	@Override
	public int countDaySales(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("booking.countDaySales");
	}

	
}
