package com.gdj.music.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Schedule;

public interface AdminPerforDao {

	int insertHall(SqlSessionTemplate session,String perPlace );
	
	int insertPerformance(SqlSessionTemplate session, Performance2 p);

	int insertSchedule(SqlSessionTemplate session, Schedule s);

	int insertPhoto(SqlSessionTemplate session, PerformancePhoto pp);

	//List<PerformancePhoto> selectPerforList(SqlSessionTemplate session);

	
	
}
