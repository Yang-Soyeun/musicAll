package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Schedule;

public interface AdminPerforDao {

	int insertHall(SqlSessionTemplate session,String perPlace );
	
	int insertPerformance(SqlSessionTemplate session, Performance2 p);

	int insertSchedule(SqlSessionTemplate session, Schedule s);

	int insertPhoto(SqlSessionTemplate session, PerformancePhoto pp);

	List<PerformancePhoto> selectPerforList(SqlSessionTemplate session);

	Performance2 selectPerformanceView(SqlSessionTemplate session, int mCode);

	List<Map<String,Schedule>> selectSchedule(SqlSessionTemplate session, int mCode);

	List<PerformancePhoto> selectPhoto(SqlSessionTemplate session, int mCode);

	int deletePerformance(SqlSessionTemplate session, int mCode);

	List<Schedule> selectSchedule2(SqlSessionTemplate session, int mCode);
	
	
}
