package com.gdj.music.admin.model.service;

import java.util.List;

import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Schedule;

public interface AdminPerforService {
	
	int insertPerformance(Performance2 p, List<Schedule> sc, List<PerformancePhoto> files);

	List<PerformancePhoto> selectPerforList();
}
