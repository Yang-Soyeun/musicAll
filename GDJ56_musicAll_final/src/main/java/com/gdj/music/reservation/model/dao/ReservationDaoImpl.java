package com.gdj.music.reservation.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.perfor.model.vo.Performance;
@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Override
	
	//공연출력
	public List<Map<String,Performance>> selectPerform(SqlSessionTemplate session, int mCode) {
		return session.selectList("booking.selectPerform",mCode);
	}

}
