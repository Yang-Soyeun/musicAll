package com.gdj.music.admin.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminPerforService;
import com.gdj.music.perfor.model.vo.Hall;
//import com.bs.spring.board.model.vo.Attachment;
import com.gdj.music.perfor.model.vo.Performance;
import com.gdj.music.perfor.model.vo.Performance2;
import com.gdj.music.perfor.model.vo.Schedule;

@Controller
@RequestMapping("/adminPerfor")
public class AdminPerforController {

	
	  private AdminPerforService service;
	  
	  @Autowired 
	  public AdminPerforController(AdminPerforService service) {
		  this.service=service; 
	  }
	  
	 
	// 공연리스트 출력
	@RequestMapping("/performanceList.do")
	public String adminPerformanceList() {
		return "/admin/Perfor/adminPerformanceList";
	}

	// 공연등록화면 전환
	@RequestMapping("/performanceAssign.do")
	public String adminPerformanceAssign() {
		return "/admin/Perfor/adminPerformanceAssign";
	}

//	//등록할 공연 데이터 보내기 
	@RequestMapping("/insertPerformance.do")
	@ResponseBody
	public void fileUpload(HttpSession session, /*
												 * @RequestParam(name="upFile") MultipartFile
												 * upFile,@RequestParam(name="upFile2") MultipartFile upFile2
												 */
			/* MultipartHttpServletRequest mtfRequest */ Performance2 Performance) throws Exception {

		System.out.println("제목 : " + Performance.getMTitle());
		System.out.println("기간:" + Performance.getDaterange());
		System.out.println("요일:" + Performance.getPerDay());
		
		//공연 요일+시간 배열 split
		String str = Performance.getPerDay();
		String[] PerDay = str.split(",");
		for (int i = 0; i < PerDay.length; i++) {
			System.out.println(PerDay[i]);
		}
		String perDay = PerDay[0];
		String startTime = PerDay[1];
		String startTime2 = PerDay[2];
		
		//공연 기간 split
		String str2=Performance.getDaterange();
		String[] daterange=str2.split("-");
		String startDay=daterange[0];
		String endDay=daterange[1];
		
		
		/*
		 * String
		 * path=session.getServletContext().getRealPath("/resources/upload/performance/"
		 * ); File dir=new File(path); if(!upFile.isEmpty()) { String
		 * fullPath=dir+upFile.getOriginalFilename(); upFile.transferTo(new
		 * File(fullPath)); }
		 * 
		 * if(!upFile2.isEmpty()) { String fullPath2=dir+upFile2.getOriginalFilename();
		 * upFile2.transferTo(new File(fullPath2)); }
		 */
		Performance2 p = Performance.builder()
				.mTitle(Performance.getMTitle())
				.mType(Performance.getMType())
				.mAge(Performance.getMAge())
				.mPeriod(startDay)
				.mPeriodEnd(endDay)
				.perPlace(Performance.getPerPlace())
				.vipPrice(Performance.getVipPrice())
				.rPrice(Performance.getRPrice())
				.sPrice(Performance.getSPrice())
				.build();
		
		List<Schedule>sc=new ArrayList();
		sc.add(Schedule.builder()
				.sStartTime(startTime)
				.sStartTime2(startTime2)
				
				.sDay(perDay)
				.sTime(Performance.getSTime())
				.build());
		
		int result = service.insertPerformance(p,sc);
		System.out.println(result);
//		//파일 업로드처리하기
//		//저장위치가져오기
		// String
		// path=session.getServletContext().getRealPath("/resources/upload/performance/");
		// 폴더있는지 확인하고 폴더를 생성해주기
//		File dir=new File(path);
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

//		System.out.println(per);
//		model.addAttribute("performance",per);
//		return "/admin/Perfor/adminPerformanceList";

	}

}
