package com.gdj.music.reservation.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.reservation.model.dao.ReservationDao;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Seat;
@Service
public class ReservationServiceImpl implements ReservationService {

	private ReservationDao dao;
	private SqlSessionTemplate session;
	
	
	
	@Autowired
	public ReservationServiceImpl(ReservationDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}


	@Override
	public List<Map<String,Performance>> selectPerform(int mCode) {
		// TODO Auto-generated method stub
		return dao.selectPerform(session,mCode);
	}


	@Override
	public int selectHall(int mCode) {
		// TODO Auto-generated method stub
		return dao.selectHall(session, mCode);
	}


	@Override
	public List<String> selectSeats(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectSeats(session, map);
	}


	@Override
	public String selectMusical(int mCode) {
		// TODO Auto-generated method stub
		return dao.selectMusical(session, mCode);
	}


	@Override
	public int insertPoint(Point p) {
		// TODO Auto-generated method stub
		return dao.insertPoint(session, p);
	}


	@Override
	public int addPoint(Point po) {
		// TODO Auto-generated method stub
		return dao.addPoint(session, po);
	}


	@Override
	public int minusPoint(Point po) {
		// TODO Auto-generated method stub
		return dao.minusPoint(session, po);
	}

	
	

}
