package com.gdj.music.pay.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Pay {
	
	private int pCode;
	private String pWay;
	private double pPrice;
	private Date pDate;

}
