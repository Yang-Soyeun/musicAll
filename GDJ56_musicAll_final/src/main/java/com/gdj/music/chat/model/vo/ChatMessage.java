package com.gdj.music.chat.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatMessage {

	private int msgNo;
	private String msgContent;
	private Date msgDate;
	private int chatNo;
	private int sendMember;//memberNo
}
