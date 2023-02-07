package com.gdj.music.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class NoticeImg {

	private int flNum;
	private String sumImage;
	private String imName;
	private int mCode;
	private int gdCode;
	private int noticeNo;

}
