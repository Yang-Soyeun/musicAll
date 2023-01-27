package com.gdj.music.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gdj.music.admin.model.service.AdminGoodsService;
import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.goods.model.vo.GoodsImg;
import com.gdj.music.perfor.model.vo.Schedule;

@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController {
	
	private AdminGoodsService service;

	@Autowired
	public AdminGoodsController(AdminGoodsService service) {
		super();
		this.service = service;
	}
	
	//관리자 굿즈 메인
	@RequestMapping("/adgMain.do")
	public String adgMain() {
		return "/admin/store/adminGoodsList";
	}
	
	//굿즈 등록 페이지
	@RequestMapping("/goodsInsert.do")
	public String goodsInsert() {
		return "/admin/store/goodsInsert";
	}
	
	//굿즈 등록 기능
	@RequestMapping("/insertEnd.do")
	@ResponseBody
	public boolean insertGoodsEnd(HttpSession session, MultipartFile upFile, 
							MultipartFile upFile2,
							Goods goods, HttpServletResponse response) throws Exception {

		//파일 업로드처리하기
		String path=session.getServletContext().getRealPath("/resources/upload/goods/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();
		List<GoodsImg> files=new ArrayList();
		
		System.out.println(upFile);
		System.out.println(upFile2);
		System.out.println(goods);
		
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
					GoodsImg.builder()
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
						GoodsImg.builder()
						.iName(renameFile2)
						.build());
				}catch(IOException e) {
						e.printStackTrace();
				}					
		}
		
		Goods g = Goods.builder()
				.gName(goods.getGName())
				.gPrice(goods.getGPrice())
				.gContent(goods.getGContent())
				.gCom(goods.getGCom())
				.gCount(goods.getGCount())
				.gTag(goods.getGTag())
				.mCode(goods.getMCode())
				.build();
		
	
	
		int result = service.insertGoods(g, files);
		System.out.println("결과:"+result);		
	
		
		
		return result>0;
	}
	

}
