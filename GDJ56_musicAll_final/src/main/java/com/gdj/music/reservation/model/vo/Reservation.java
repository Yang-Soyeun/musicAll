package com.gdj.music.reservation.model.vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Reservation {
	private int rCode;
	private String[] rSeat;
	private int mCode;
	private int memberNo;
	private int pCode;
	private String rDate;
	private String rTime;
	
}
