package com.gdj.music.chat;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {

	@RequestMapping("/chatting/chattingpage.do")
	public String chattingPage(HttpServletRequest request, Model model) {
		
		//방번호를 모델에 담았음!!
		String roomNo = request.getParameter("roomNo");
		System.out.println(" roomNo L " + roomNo);
		
		model.addAttribute("roomNo", roomNo);

		//현재 날짜를 원하는 형식으로 바꾸기 위해 SimpleDateFormat 사용
		SimpleDateFormat smt = new SimpleDateFormat("yyyy년 MM월 dd일");
		String today = smt.format(new Date());		//smt에 지정된 형식으로 날짜를 변경해줌, new Date는 현재 날짜를 가져옴
		model.addAttribute("today", today);
		
		return "chatting/chat";
	}
}
