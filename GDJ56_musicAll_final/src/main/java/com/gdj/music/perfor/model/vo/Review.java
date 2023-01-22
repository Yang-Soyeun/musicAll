package com.gdj.music.perfor.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Review {
	private int review_No;
	private String reviewContent;
	private Date reviewDate;
	private int score;
	private int memberNo;
	private int mCode;

}
