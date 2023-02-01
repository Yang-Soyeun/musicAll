package com.gdj.music.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Comment {

	private int qcNo;
	private String qcAnswer;
	private Date qcDate;
	private int qsNo;
	
}
