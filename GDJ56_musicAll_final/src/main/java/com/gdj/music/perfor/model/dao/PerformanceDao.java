package com.gdj.music.perfor.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;
import com.gdj.music.reservation.model.vo.Reservation;

public interface PerformanceDao {

	List<PerformancePhoto> selectPerforList(SqlSessionTemplate session);

	Performance2 selectPerformanceView(SqlSessionTemplate session,int mCode);

	List<PerformancePhoto> selectPhoto(SqlSessionTemplate session, int mCode);

	List<Map<String, Schedule>> selectSchedule(SqlSessionTemplate session, int mCode);

	List<Reservation> selectReservation(SqlSessionTemplate session, int mCode);

	int insertComment(SqlSessionTemplate session, Review r);

	int selectRcode(SqlSessionTemplate session, Review r);

	List<Map<String,Review>> selectComment(SqlSessionTemplate session,int mCode);

}
