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
	
	private int p_code;
	private String p_way;
	private double p_price;
	private Date p_date;

}
