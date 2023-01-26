package com.gdj.music.perfor.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;
	private int score;
	private int memberNo;
	private int rCode;//예매코드

}
