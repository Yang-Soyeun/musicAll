package com.gdj.music.reservation.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Point {

	private int mpCode;
	private int mpPrice;
	private String mpType;
	private int memberNo;
	private Date mpDate;
}
