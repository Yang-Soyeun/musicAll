package com.gdj.music.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gdj.music.admin.model.dao.AdminPerforDao;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
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
	public int insertPerformance(Performance2 p,List<Schedule> sc,List<PerformancePhoto> files) {
		int result=dao.insertPerformance(session,p);
		if(result>0) {
			for(Schedule s:sc) {
				int result2=dao.insertSchedule(session,s);
				System.out.println("insert 스케줄:"+result2);
				if(result2>0) {
					for(PerformancePhoto pp:files) {
						int result3=dao.insertPhoto(session,pp);
						System.out.println("insert 사진:"+result3);
						}
				}
			}
		}
		return result;
	}
}
