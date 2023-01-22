package com.gdj.music.pay.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.gdj.music.pay.model.dao.PayDao;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.reservation.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class PayServiceImpl implements PayService {

	private PayDao dao;
	private SqlSessionTemplate session;
	
	public PayServiceImpl(PayDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	
	}

	@Override
	public int insertPay(Pay p,Reservation r) {
		log.debug("insert전 "+p.getPCode());
		int result= dao.insertPay(session, p);
		log.debug("insert후 "+p.getPCode());
		if(result>0) {
			result=dao.insertBooking(session, r);
		}
		return result;
	
	}

}	