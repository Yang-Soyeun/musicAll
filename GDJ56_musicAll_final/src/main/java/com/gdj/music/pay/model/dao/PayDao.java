package com.gdj.music.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.reservation.model.vo.Reservation;

public interface PayDao {
	int insertPay(SqlSessionTemplate session, Pay p);
	int insertBooking(SqlSessionTemplate session, Reservation r);
}
