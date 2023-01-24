package com.gdj.music.perfor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder

public class PerformancePhoto {
	private int photoNo;
	private String mainPhoto;//썸네일
	private String PerPhotoOriName;
	private String PerPhotoReName;
	

}
