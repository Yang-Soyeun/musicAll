package com.gdj.music.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

//import com.bs.spring.board.model.vo.Attachment;
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
	@RequestMapping("/insertPerformance.do")
	public void insertPerformance(
		@RequestParam(value="mTitle") String perTitle,
		@RequestParam(value="mType") String perType,
		@RequestParam(value="mAge") String age,
		@RequestParam(value="sDay") String[] perDay,
		@RequestParam(value="sTime") int watchTime,
		@RequestParam(value="hName") String perPlace,
		@RequestParam(value="vipPrice") int vipPrice,
		@RequestParam(value="rPrice") int rPrice,
		@RequestParam(value="sPrice") int sPrice,
		String daterange,ModelAndView mv, MultipartFile[] upFile ,HttpSession session){
		
		System.out.println(perDay);
		
		
		
		
		
//		//파일 업로드처리하기
//		//저장위치가져오기
//			String path=session.getServletContext().getRealPath("/resources/performance/");
//				//폴더있는지 확인하고 폴더를 생성해주기
//				File dir=new File(path);
//				if(!dir.exists()) dir.mkdirs();
//				List<Attachment> files=new ArrayList();
//				for(MultipartFile f : upFile) {
//					//리네임드규칙을 생성하기
////					if(!upFile.isEmpty()) {
//					if(!f.isEmpty()) {
//						//전송된 파일이 있다면....
//						//파일 리네임처리 직접하기
////						String originalFileName=upFile.getOriginalFilename();
//						String originalFileName=f.getOriginalFilename();
//						String ext=originalFileName.substring(originalFileName.lastIndexOf("."));
//						//중복되지않는 이름 설정하는 값지정하기
//						SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
//						int rnd=(int)(Math.random()*10000)+1;
//						String renameFile=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
//						
//						//파일 업로드하기
//						try {
//							//MultipartFile클래스가 제공해주는 메소드 이용해서 저장처리
////							upFile.transferTo(new File(path+renameFile));
//							f.transferTo(new File(path+renameFile));
//							files.add(Attachment.builder()
//									.originalFilename(f.getOriginalFilename())
//									.renamedFilename(renameFile).build());
//						}catch(IOException e) {
//							e.printStackTrace();
//						}
//					}
//				}
//	
//			
//		System.out.println(per);
//		model.addAttribute("performance",per);
//		return "/admin/Perfor/adminPerformanceList";
	}
	
}
