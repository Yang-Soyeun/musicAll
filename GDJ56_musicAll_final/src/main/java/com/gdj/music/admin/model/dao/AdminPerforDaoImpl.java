package com.gdj.music.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Schedule;

@Repository
public class AdminPerforDaoImpl implements AdminPerforDao {
	
	@Override
	public int insertPerformance(SqlSessionTemplate session,Performance2 p) {
		return session.insert("musical.insertPerformance",p);
	}
	@Override
	public int insertSchedule(SqlSessionTemplate session, Schedule s) {
		return session.insert("p_schedule.insertSchedule",s);
	}
	@Override
	public int insertHall(SqlSessionTemplate session,String perPlace ) {
		return session.insert("hall.insertHall",perPlace);
	}

	@Override
	public int insertPhoto(SqlSessionTemplate session, PerformancePhoto pp) {
		return session.insert("img.insertPhoto",pp);
	}
//	@Override
//	public List<PerformancePhoto> selectPerforList(SqlSessionTemplate session) {
//		return session.selectList("img.selectPerforList");
//	}
}
