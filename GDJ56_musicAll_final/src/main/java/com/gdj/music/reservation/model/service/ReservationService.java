package com.gdj.music.reservation.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.reservation.model.vo.Seat;

public interface ReservationService {
	
	List<Map<String,Performance>> selectPerform(int mCode);
	int selectHall(int mCode);
	List<String> selectSeats(Map<String,Object> map);
	String selectMusical(int mCode);

}
