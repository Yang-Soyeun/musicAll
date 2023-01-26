package com.gdj.music.reservation.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.reservation.model.vo.Point;

public interface ReservationDao {

	List<Map<String,Performance>> selectPerform(SqlSessionTemplate session, int mCode);
	int selectHall(SqlSessionTemplate session, int mCode);
	List<String> selectSeats(SqlSessionTemplate session,Map<String,Object> map);
	String selectMusical(SqlSessionTemplate session,int mCode);
	int insertPoint(SqlSessionTemplate session, Point p);
	int addPoint(SqlSessionTemplate session, Point po);
	int minusPoint(SqlSessionTemplate session, Point po);
	int countDaySales(SqlSessionTemplate session);
	
}
