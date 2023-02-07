package com.gdj.music.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatListVo {

	private int mCode;//공연시퀀스번호
	private String mTitle;//공연이름
	private String iName;//이미지이름
}
