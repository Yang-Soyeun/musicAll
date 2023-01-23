package com.gdj.music.reservation.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.perfor.model.vo.Performance;

public interface ReservationService {
	
	List<Map<String,Performance>> selectPerform(int mCode);


}
