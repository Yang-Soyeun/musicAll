package com.gdj.music.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminNoticeService;
import com.gdj.music.admin.model.vo.Notice;
import com.gdj.music.admin.model.vo.NoticeImg;
import com.gdj.music.common.interceptor.PageFactory;

@Controller
@RequestMapping("/notice")

public class AdminNoticeController {
	
	private AdminNoticeService service;
	
	@Autowired
	public AdminNoticeController(AdminNoticeService service) {
		super();
		this.service = service;
	}
	
	//공지사항 목록
	@RequestMapping("noticeList.do")
	public ModelAndView noticeList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage) {
		
		
		List<Notice> notices = service.noticeList(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//페이징처리
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"noticeList.do" ));
		mv.addObject("notices", notices);
		mv.setViewName("/admin/noticeList");
		
		
		return mv;
	}
	
	//상세보기
	@RequestMapping("noticeView.do")
	public String noticeView(Model m, int noticeNo) {
		m.addAttribute("notices", service.noticeView(noticeNo));
		m.addAttribute("img", service.selectImg(noticeNo));
		return "admin/noticeView";
	}
	

	//공지사항 등록 페이지
	@RequestMapping("noticeInsert.do")
	public String insertNotice() {
		return "admin/insertNotice";
	}
	
	//공지사항 등록 기능
	@RequestMapping("noticeEnd.do")
	@ResponseBody
	public boolean insertNoticeEnd(HttpSession session, MultipartFile upFile, Notice notice, HttpServletResponse response) throws Exception{
		
		//파일 업로드처리
		String path=session.getServletContext().getRealPath("/resources/upload/notice/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		List<NoticeImg> files=new ArrayList();

		
		//리네임드규칙을 생성하기
				if(upFile!=null) {
					String originalFileName=upFile.getOriginalFilename();
					String ext=originalFileName.substring(originalFileName.lastIndexOf("."));
					//중복되지않는 이름 설정하는 값지정하기
					SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rnd=(int)(Math.random()*10000)+1;
					String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
					//파일 업로드하기
					try {
						upFile.transferTo(new File(path+renameFile));
						files.add(
								NoticeImg.builder()
								.imName(renameFile)
								.build());
						}catch(IOException e) {
								e.printStackTrace();
						}					
				}
				
				Notice n = Notice.builder()
						.noticeTitle(notice.getNoticeTitle())
						.noticeContent(notice.getNoticeContent())
						.noticeCategory(notice.getNoticeCategory())
						.build();
				
			
			
				int result = service.insertNotice(n, files);		
				
				
				return result > 0;
			}
	
}
