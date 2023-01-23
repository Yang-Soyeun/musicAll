package com.gdj.music.reservation.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.reservation.model.dao.ReservationDao;
@Service
public class ReservationServiceImpl implements ReservationService {

	private ReservationDao dao;
	private SqlSessionTemplate session;
	
	
	
	@Autowired
	public ReservationServiceImpl(ReservationDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}


	@Override
	public List<Map<String,Performance>> selectPerform(int mCode) {
		// TODO Auto-generated method stub
		return dao.selectPerform(session,mCode);
	}

}
