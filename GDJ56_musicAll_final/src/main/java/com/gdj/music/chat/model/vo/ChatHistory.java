package com.gdj.music.chat.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatHistory {

	private int msgNo;
	private String msgContent;
	private Date msgTime;
	private String sendMember;
	private String memberId;
}
