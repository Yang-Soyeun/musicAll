package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Schedule;

public interface AdminPerforService {
	
	int insertPerformance(Performance2 p, List<Schedule> sc, List<PerformancePhoto> files);

	List<PerformancePhoto> selectPerforList();

	Performance selectPerformanceView(int mCode);

	List<Map<String, Schedule>> selectSchedule(int mCode);

	List<PerformancePhoto> selectPhoto(int mCode);

	
}
