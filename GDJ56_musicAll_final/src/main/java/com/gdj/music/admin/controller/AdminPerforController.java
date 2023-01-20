package com.gdj.music.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.perfor.model.vo.Performance;

@Controller
@RequestMapping("/adminPerfor")
public class AdminPerforController {
	
	//공연리스트 출력 
	@RequestMapping("/performanceList.do")
	public String adminPerformanceList() {
		return "/admin/Perfor/adminPerformanceList";
	}
	
	//공연등록화면 전환 
	@RequestMapping("/performanceAssign.do")
	public String adminPerformanceAssign() {
		return "/admin/Perfor/adminPerformanceAssign";
	}
	
//	//등록할 공연 데이터 보내기 
//	@RequestMapping("/insertPerformance.do")
//	public ModelAndView insertPerformance(ModelAndView mv, MultipartFile[] upFile,
//			) {
//		System.out.println(per);
//		model.addAttribute("performance",per);
//		return "/admin/Perfor/adminPerformanceList";
//	}
//	
}
