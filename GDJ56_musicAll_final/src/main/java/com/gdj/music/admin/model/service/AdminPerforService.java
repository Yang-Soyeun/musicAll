package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;

public interface AdminPerforService {
	
	int insertPerformance(Performance2 p, List<Schedule> sc, List<PerformancePhoto> files);

	List<Map<String, PerformancePhoto>> selectPerforList();

	Performance2 selectPerformanceView(int mCode);

	List<Map<String, Schedule>> selectSchedule(int mCode);

	List<PerformancePhoto> selectPhoto(int mCode);

	int deleteAll(int mCode);

	List<Schedule> selectSchedule2(int mCode);

	int updatePerformance( Performance2 p, List<Schedule> sc,List<PerformancePhoto> files);

	List<Map<String, Review>> selectComment(int mCode);

	int selectAverage(int mCode);

	int deleteComment(int reviewNo);

	List<Map<String, PerformancePhoto>> orderbyRecent();

	List<Map<String, PerformancePhoto>> orderbyEnd();

	List<Map<String, PerformancePhoto>> searchForType(String mType1);

	List<Map<String, PerformancePhoto>> searchForTitle(Map<String, Object> map);

	List<Map<String, PerformancePhoto>> orderbyBest();
}
