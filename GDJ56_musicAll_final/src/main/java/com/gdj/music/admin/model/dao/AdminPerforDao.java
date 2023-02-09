package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;

public interface AdminPerforDao {

	int insertHall(SqlSessionTemplate session,String perPlace );
	
	int insertPerformance(SqlSessionTemplate session, Performance2 p);

	int insertSchedule(SqlSessionTemplate session, Schedule s);

	int insertPhoto(SqlSessionTemplate session, PerformancePhoto pp);

	List<Map<String, PerformancePhoto>> selectPerforList(SqlSessionTemplate session);

	Performance2 selectPerformanceView(SqlSessionTemplate session, int mCode);

	List<Map<String,Schedule>> selectSchedule(SqlSessionTemplate session, int mCode);

	List<PerformancePhoto> selectPhoto(SqlSessionTemplate session, int mCode);

	int deletePerformance(SqlSessionTemplate session, int mCode);

	List<Schedule> selectSchedule2(SqlSessionTemplate session, int mCode);

	int updatePerformance(SqlSessionTemplate session, Performance2 p);

	int updateSchedule(SqlSessionTemplate session, Schedule sch2);

	int updatePhoto(SqlSessionTemplate session, PerformancePhoto photo2);

	int deletePhoto(SqlSessionTemplate session, int mCode);

	int deleteSchedule(SqlSessionTemplate session, int mCode);

	List<Map<String, Review>> selectComment(SqlSessionTemplate session, int mCode);

	int selectAverage(SqlSessionTemplate session, int mCode);

	int deleteComment(SqlSessionTemplate session, int reviewNo);

	List<Map<String, PerformancePhoto>> orderbyRecent(SqlSessionTemplate session);

	List<Map<String, PerformancePhoto>> orderbyEnd(SqlSessionTemplate session);

	List<Map<String, PerformancePhoto>> searchForType(SqlSessionTemplate session, String mType1);

	List<Map<String, PerformancePhoto>> searchForTitle(SqlSessionTemplate session, Map<String, Object> map);
	
	
	
}
