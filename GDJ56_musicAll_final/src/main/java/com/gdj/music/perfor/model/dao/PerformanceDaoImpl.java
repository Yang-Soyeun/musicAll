package com.gdj.music.perfor.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.perfor.model.vo.Mlike;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.perfor.model.vo.Schedule;
import com.gdj.music.reservation.model.vo.Reservation;

@Repository
public class PerformanceDaoImpl implements PerformanceDao{
	
	@Override
	public List<Map<String, PerformancePhoto>> selectPerforList(SqlSessionTemplate session) {
		return session.selectList("img.selectPerforList");
	}
	@Override
	public Performance2 selectPerformanceView(SqlSessionTemplate session,int mCode) {
		return session.selectOne("musical.selectPerformanceView",mCode);
	}
	@Override
	public List<PerformancePhoto> selectPhoto(SqlSessionTemplate session, int mCode) {
		return session.selectList("img.selectPhoto",mCode);
	}
	@Override
	public List<Map<String, Schedule>> selectSchedule(SqlSessionTemplate session, int mCode) {
		return session.selectList("p_schedule.selectSchedule",mCode);
	}

	@Override
	public List<Reservation> selectReservation(SqlSessionTemplate session, int mCode) {
		return session.selectList("booking.selectReservation",mCode);
	}
	@Override
	public int insertComment(SqlSessionTemplate session, Review r) {
		return session.insert("review.insertComment",r);
	}
	@Override
	public int selectRcode(SqlSessionTemplate session, Review r) {
		return session.selectOne("booking.selectRcode",r);
	}
	@Override
	public List<Map<String,Review>> selectComment(SqlSessionTemplate session,int mCode) {
		return session.selectList("review.selectComment",mCode);
	}
	@Override
	public int selectAverage(SqlSessionTemplate session, int mCode) {
		return session.selectOne("review.selectAverage",mCode);
	}
	@Override
	public int insertMyMusical(SqlSessionTemplate session, Mlike like) {
		return session.insert("mLike.insertMyMusical",like);
	}
	@Override
	public List<Mlike> selectMlike(SqlSessionTemplate session, Mlike like) {
		return session.selectList("mLike.selectMlike",like);
	}
	@Override
	public int deleteMyMusical(SqlSessionTemplate session, Mlike like) {
		return session.delete("mLike.deleteMyMusical",like);
	}
	@Override
	public List<Map<String, PerformancePhoto>> orderbyBest(SqlSessionTemplate session) {
		return session.selectList("img.orderbyBest");
	}
	@Override
	public List<Map<String,PerformancePhoto>>  orderbyRecent(SqlSessionTemplate session) {
		return session.selectList("img.orderbyRecent");
	}
	@Override
	public List<Map<String, PerformancePhoto>> orderbyEnd(SqlSessionTemplate session) {
		return session.selectList("img.orderbyEnd");
	}
	@Override
	public List<Map<String, PerformancePhoto>> searchForTitle(SqlSessionTemplate session, Map<String,Object> map) {
		return session.selectList("img.searchForTitle",map);
	}
	@Override
	public List<Map<String, PerformancePhoto>> searchForType(SqlSessionTemplate session, String mType1) {
		return session.selectList("img.searchForType",mType1);
	}
}
