package com.gdj.music.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Terms {

	private int term_code;
	private String term_name;
	private String term_content;
	private String term_YN;
}
