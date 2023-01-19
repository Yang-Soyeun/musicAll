package com.gdj.music.question.model.vo;

import java.sql.Date;

import com.gdj.music.pay.model.vo.Pay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Question {
	private int qsNo;
	private String qsTitle;
	private String qsContent;
	private Date qsDate;
	private String qsHeadTitle;
	private String qsResult;
	private int memberNo;
}
