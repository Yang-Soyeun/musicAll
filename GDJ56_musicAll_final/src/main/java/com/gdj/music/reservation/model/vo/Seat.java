package com.gdj.music.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Seat {
	
	private int seatCode;
	private String seatName;
	private int hCode;
	private String rDate;
	private String rTime;

}
