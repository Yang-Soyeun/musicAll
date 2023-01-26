package com.gdj.music.admin.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import com.gdj.music.perfor.model.vo.PerformancePhoto;
import com.gdj.music.perfor.model.vo.Schedule;
import com.google.gson.Gson;

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
	public ModelAndView adminPerformanceList(ModelAndView mv) {
		//mv.addObject("musicals",service.selectPerforList());
		mv.setViewName("/admin/Perfor/adminPerformanceList");
		return mv;
	}

	// 공연등록화면 전환
	@RequestMapping("/performanceAssign.do")
	public String adminPerformanceAssign() {
		return "/admin/Perfor/adminPerformanceAssign";
	}

//	//등록할 공연 데이터 보내기 
	@RequestMapping("/insertPerformance.do")
	@ResponseBody
	public boolean fileUpload(HttpSession session, @RequestParam(name="upFile0") MultipartFile upFile,@RequestParam(name="upFile20") MultipartFile upFile2,
							Performance2 Performance,HttpServletResponse response) throws Exception {

		//파일 업로드처리하기
		String path=session.getServletContext().getRealPath("/resources/upload/performance/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		List<PerformancePhoto> files=new ArrayList();
		
		//썸네일 
		//리네임드규칙을 생성하기
		if(!upFile.isEmpty()) {
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
					PerformancePhoto.builder()
					.sumImage("ok")
					.iName(renameFile)
					.build());
			}catch(IOException e) {
				e.printStackTrace();
			}
		}			
		//일반사진
		//리네임드규칙을 생성하기
		if(!upFile2.isEmpty()) {
			String originalFileName2=upFile2.getOriginalFilename();
			String ext2=originalFileName2.substring(originalFileName2.lastIndexOf("."));
			//중복되지않는 이름 설정하는 값지정하기
			SimpleDateFormat sdf2=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd2=(int)(Math.random()*10000)+1;
			String renameFile2=sdf2.format(System.currentTimeMillis())+"_"+rnd2+ext2;
			//파일 업로드하기
			try {
				upFile2.transferTo(new File(path+renameFile2));
				files.add(
						PerformancePhoto.builder()
						.iName(renameFile2)
						.build());
				}catch(IOException e) {
						e.printStackTrace();
				}					
		}
		System.out.println("제목 : " + Performance.getMTitle());
		System.out.println("기간:" + Performance.getDaterange());
		System.out.println("요일,시간:" + Performance.getPerDay());
		
		//공연 요일+시간을 배열로 split
		
		//String[] perDay = str.split(",");
		//for (int i = 0; i < PerDay.length; i++) {
		//	System.out.println("요일,시간 split"+PerDay[i]);
		//}
		
		//요일
//		String perDay="";
//		for(int i=0;i<PerDay.length;i+=3) {
//			perDay+=PerDay[i];
//		}
		//String perDay = PerDay[0];
		
		//1회차 시간들
		//String startTime1="";
//		for(int i=1;i<PerDay.length;i+=3) {
//			startTime1=PerDay[i];
//		}
		//String startTime = PerDay[1];
		//2회차시간들
//		String startTime2="";
//		for(int i=2;i<PerDay.length;i+=3) {
//			startTime2 = PerDay[i];
//		}
		
		
		int hCode=0;//공연장코드 부여 
		if(Performance.getPerPlace().equals("예술의 전당")) { 
			hCode=1;
		}else if(Performance.getPerPlace().equals("블루스퀘어")){
			hCode=2;
		}
		
		//공연 기간 split
		String str2=Performance.getDaterange();
		String[] daterange=str2.split("-");
		String startDay=daterange[0];
		String endDay=daterange[1];
		
		
		Performance2 p = Performance.builder()
				.mTitle(Performance.getMTitle())
				.mType(Performance.getMType())
				.mAge(Performance.getMAge())
				.mPeriod(startDay)
				.mPeriodEnd(endDay)
				.hCode(hCode)
				.vipPrice(Performance.getVipPrice())
				.rPrice(Performance.getRPrice())
				.sPrice(Performance.getSPrice())
				.build();
		//스케쥴등록하기
		List<Schedule>sc=new ArrayList();
		String[] perDay = Performance.getPerDay();
		//요일별 구분한 반복문
		for(String pd:perDay) {
			//요일에 지정된 회자 데이터를 파싱처리
			//0 : 요일, 1 : 1회차 시작시간, 2: 2회차 시작시간
			String[] days=pd.split(",");
			//요일별 1회차에 대한 저장
			sc.add(Schedule.builder()
					.sStartTime(days[1])
					.sDay(days[0])
					.sTime(Performance.getSTime())
					.sNum(1)
					.build());
//			2회차에 대한 저장
			if(days.length>2) {
				sc.add(Schedule.builder()
						.sStartTime(days[2])
						.sDay(days[0])
						.sTime(Performance.getSTime())
						.sNum(2)
						.build());
			}
		}
		
		int result = service.insertPerformance(p,sc,files);
		System.out.println("결과!!:"+result);		
	
		
		
		return result>0;
	}

		
		
			
		
	
}
