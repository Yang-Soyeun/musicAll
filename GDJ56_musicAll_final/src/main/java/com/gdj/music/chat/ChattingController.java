package com.gdj.music.chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdj.music.chat.model.service.ChatService;
import com.gdj.music.chat.model.vo.ChatHistory;
import com.gdj.music.chat.model.vo.ChatMessage;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.perfor.model.vo.Performance2;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

@Controller
public class ChattingController {
	
	private ChatService service;
	
	@Autowired
	public ChattingController(ChatService service) {
		super();
		this.service = service;
	}
	

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

	//채팅이모티콘 클릭시 목록 화면 나오게 화면 이동
	@RequestMapping("/chatting/chatList.do")
	public String chatList(Model md,HttpSession session) {
		
		Member memberInfo = (Member) session.getAttribute("loginMember");//로그인한 사람이 어떤채팅방에 들어가 있는지 알기위함
		
		List<Performance2> list = service.chatRoom(memberInfo);//채팅목록이 여러개이니까 list로!
		
		md.addAttribute("list",list);
		
		return "chatting/chatList";
	}
	
	//채팅방 목록 클릭시 디비 채팅내용 불러오기
	@ResponseBody
	@RequestMapping("/chatting/chatContent.do")
	public void chatContent(int chatNo, HttpServletResponse response) throws IOException {
		List<ChatHistory> list = service.chatHistory(chatNo);
		response.setContentType("application/json;charset=utf-8");//Gson
		new Gson().toJson(list,response.getWriter());//Gson
	}
	

}
