package com.gdj.music.perfor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Mlike {
	private int lmCode;
	private int mCode;
	private int member_No;
}
