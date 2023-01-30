package com.gdj.music.perfor.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Schedule;

public interface PerformanceService {

	List<PerformancePhoto> selectPerforList();

	Performance2 selectPerformanceView(int mCode);

	List<PerformancePhoto> selectPhoto(int mCode);

	List<Map<String, Schedule>> selectSchedule(int mCode);

}
