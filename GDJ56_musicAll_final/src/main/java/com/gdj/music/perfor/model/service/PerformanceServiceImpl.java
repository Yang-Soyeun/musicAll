package com.gdj.music.perfor.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.admin.model.dao.AdminPerforDao;
import com.gdj.music.perfor.model.dao.PerformanceDao;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Schedule;

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
		return session.selectList("p_schedule.selectSchedule",mCode);
	}
}
