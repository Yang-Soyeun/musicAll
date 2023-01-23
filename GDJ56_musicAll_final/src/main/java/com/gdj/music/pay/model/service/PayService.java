package com.gdj.music.pay.model.service;

import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.reservation.model.vo.Reservation;
import com.gdj.music.reservation.model.vo.Seat;

public interface PayService {
	int insertPay(Pay p,Reservation r);
	int insertSeat(Seat s);
}
