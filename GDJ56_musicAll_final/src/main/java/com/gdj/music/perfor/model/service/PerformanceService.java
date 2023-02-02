package com.gdj.music.perfor.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;
import com.gdj.music.reservation.model.vo.Reservation;

public interface PerformanceService {

	List<PerformancePhoto> selectPerforList();

	Performance2 selectPerformanceView(int mCode);

	List<PerformancePhoto> selectPhoto(int mCode);

	List<Map<String, Schedule>> selectSchedule(int mCode);

	List<Reservation> selectReservation(int mCode);

	int insertComment(Review r);


	List<Map<String,Review>> selectComment(int mCode);


}
