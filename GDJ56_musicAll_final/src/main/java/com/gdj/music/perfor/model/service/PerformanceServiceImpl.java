package com.gdj.music.perfor.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.music.admin.model.dao.AdminPerforDao;
import com.gdj.music.perfor.model.dao.PerformanceDao;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;
import com.gdj.music.reservation.model.vo.Reservation;

@Service
public class PerformanceServiceImpl implements PerformanceService{
	
	private SqlSessionTemplate session;
	private PerformanceDao dao;
		
	@Autowired
	public PerformanceServiceImpl(SqlSessionTemplate session, PerformanceDao dao) {
		super();
		this.session = session;
		this.dao = dao;
	}
	@Override
	public List<PerformancePhoto> selectPerforList(){
		return dao.selectPerforList(session);
		
	}
	@Override
	public Performance2 selectPerformanceView(int mCode) {
		return dao.selectPerformanceView(session,mCode);
	}
	@Override
	public List<PerformancePhoto> selectPhoto(int mCode) {
		return dao.selectPhoto(session, mCode);
	}
	@Override
	public List<Map<String, Schedule>> selectSchedule(int mCode) {
		return dao.selectSchedule(session,mCode);
	}
	@Override
	public List<Reservation> selectReservation(int mCode) {
		return dao.selectReservation(session,mCode);
	}
	@Override
	@Transactional
	public int insertComment(Review r) {
		int rCode=dao.selectRcode(session,r);
		System.out.println("알코드"+rCode);
		if(rCode>0) {
			rCode= r.getRCode();
		}
		int result=dao.insertComment(session, r);
		return result;
	}
	
	@Override
	public List<Map<String,Review>> selectComment(int mCode) {
		return dao.selectComment(session,mCode);
	}
	@Override
	public int selectAverage(int mCode) {
		return dao.selectAverage(session,mCode);
	}
}
