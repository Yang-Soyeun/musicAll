package com.gdj.music.reservation.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.perfor.model.vo.Performance;

public interface ReservationDao {

	List<Map<String,Performance>> selectPerform(SqlSessionTemplate session, int mCode);
	
}
