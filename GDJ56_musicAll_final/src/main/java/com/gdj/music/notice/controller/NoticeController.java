package com.gdj.music.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminNoticeService;
import com.gdj.music.admin.model.vo.Notice;
import com.gdj.music.common.interceptor.PageFactory;

@Controller
public class NoticeController {
	
	private AdminNoticeService service;
	
	@Autowired
	public NoticeController(AdminNoticeService service) {
		super();
		this.service = service;
	}

	@RequestMapping("noticeList.do")
	public ModelAndView noticeList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage) {
		
		
		List<Notice> notices = service.noticeList(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//페이징처리
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"noticeList.do" ));
		mv.addObject("notices", notices);
		mv.setViewName("/notice/noticeList");
		
		
		return mv;
	
	}
}