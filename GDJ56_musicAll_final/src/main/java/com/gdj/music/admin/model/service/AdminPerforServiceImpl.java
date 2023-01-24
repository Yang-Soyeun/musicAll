package com.gdj.music.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gdj.music.admin.model.dao.AdminPerforDao;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.Schedule;

@Service
public class AdminPerforServiceImpl implements AdminPerforService{
	
	private SqlSessionTemplate session;
	private AdminPerforDao dao;
	
	@Autowired
	public AdminPerforServiceImpl(SqlSessionTemplate session, AdminPerforDao dao) {
		super();
		this.session = session;
		this.dao = dao;
	}
	
	@Override
	public int insertPerformance(Performance2 p,List<Schedule> sc) {
		int result=dao.insertHall(session,p.getPerPlace());
		if(result>0) {
			int result2=dao.insertPerformance(session,p);
			if(result2>0) {
				int result3=dao.insertSchedule(session,sc);
			}
		}
		return result;
	}
}
