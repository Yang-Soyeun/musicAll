package com.gdj.music.common.interceptor;

public class PageFactory {
	public static String getPage(int cPage,int numPerpage,int totalData,String url) {
		// pagebar를 만들어서 반환해주는 기능을 하는 메소드
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar="<div class='col-sm-12' style='margin-top:30px;'><div class='pagination font-alt'>";
		
		if(pageNo==1) {
			pageBar+="<a href='#'><i class='fa fa-angle-left'></i></a>";// < 모양 바(이전 페이지) 
		}else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")'><i class='fa fa-angle-left'></i></a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<a href='#'>"+pageNo+"</a>";
			}else {
				pageBar+="<a href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<a href='#'><i class='fa fa-angle-right'></i></a>"; // > 모양 바(다음 페이지) 
		}else {
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
			pageBar+="<a href='javascript:fn_paging("+(pageNo)+")'><i class='fa fa-angle-right'></i></a>";
		}
		
		pageBar+="</div></div>";
		pageBar+="<script>";
		pageBar+="function fn_paging(pageNo){";//자바스크립트 매개변수 pageNo
		pageBar+="location.assign('"+url+"?cPage='+pageNo);";//자바스크립트 매개변수 pageNo
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
	
	public static String searchPage(int cPage,int numPerpage,int totalData,String url,int no) {
		// pagebar를 만들어서 반환해주는 기능을 하는 메소드
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar="<div class='col-sm-12' style='margin-top:30px;'><div class='pagination font-alt'>";
		
		if(pageNo==1) {
			pageBar+="<a href='#'><i class='fa fa-angle-left'></i></a>";// < 모양 바(이전 페이지) 
		}else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+","+no+")'><i class='fa fa-angle-left'></i></a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<a href='#'>"+pageNo+"</a>";
			}else {
				pageBar+="<a href='javascript:fn_paging("+pageNo+","+no+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<a href='#'><i class='fa fa-angle-right'></i></a>"; // > 모양 바(다음 페이지) 
		}else {
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+","+no+")'>다음</a>";
			pageBar+="<a href='javascript:fn_paging("+pageNo+","+no+")'><i class='fa fa-angle-right'></i></a>";
		}
		
		pageBar+="</div></div>";
		pageBar+="<script>";
		pageBar+="function fn_paging(pageNo,no){";//자바스크립트 매개변수 pageNo
		pageBar+="location.assign('"+url+"?No='+no+'&cPage='+pageNo);";//자바스크립트 매개변수 pageNo,no
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
	
	
}
