package com.gdj.music.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.SecuredAnnotationSecurityMetadataSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.common.EmailSendModule;
import com.gdj.music.member.kakao.KakaoLoginBO;
import com.gdj.music.member.model.service.MemberService;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.member.model.vo.Terms;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;

@Controller
@SessionAttributes({"loginMember"})//==model에 저장된 attribute 중 loginMember는 session이야
@RequestMapping("/member")
public class MemberController {
	
	
	  private MemberService service;
	  private EmailSendModule module;
	  private KakaoLoginBO kakaoLoginBO;
	  private BCryptPasswordEncoder passwordEncoder;
	  
	  @Autowired 
	  public MemberController(MemberService service, EmailSendModule module, KakaoLoginBO kakaoLoginBO,BCryptPasswordEncoder passwordEncoder) { 
		  super();
		  this.service = service; 
		  this.module = module;
		  this.kakaoLoginBO = kakaoLoginBO;
		  this.passwordEncoder=passwordEncoder;
	  }

	//로그인 화면 전환
	@RequestMapping("/login.do")
	public String loginView(Model m, HttpSession session) {
		
		String loginCallbackUrl = kakaoLoginBO.getLoginCallbackUrl();
		String kakaoJoinUrl = kakaoLoginBO.getAuthorizationUrl(session, loginCallbackUrl);
		System.out.println("kakaoJoinUrl : " + kakaoJoinUrl);
		
		m.addAttribute("kakaoJoinUrl", kakaoJoinUrl);
		
		
		return "/member/login";
	}
	
	//로그인 구현
	@RequestMapping("/loginEnd.do")
	public void loginEnd(String memberId, String memberPw, HttpServletResponse response,Model model ) throws IOException{
		Member m = Member.builder().member_Id(memberId).password(memberPw).build();
		
		Member loginMember = service.loginEnd(m);

		//matches("원본값",암호화값)매소드를 이용
		if(loginMember != null && passwordEncoder.matches(m.getPassword(),loginMember.getPassword())) {
			model.addAttribute("loginMember",loginMember);
			response.getWriter().print(true);//매치가 되면 트루
		}else {
			response.getWriter().print(false);//매치가 안되면 false.이게 맞지..
		}
	}
	
	
	//회원가입 선택
	@RequestMapping("/joinchoice.do")
	public ModelAndView joinView(ModelAndView mav, HttpSession session) {
		String joinCallbackUrl = kakaoLoginBO.getJoinCallbackUrl();
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session, joinCallbackUrl);
		System.out.println("kakaoAuthUrl : " + kakaoAuthUrl);
		mav.addObject("kakaoUrl", kakaoAuthUrl);
		mav.setViewName("/member/joinChoice");
		return mav;
	}
	
	//ajax 개인회원가입 페이지 이동
	@RequestMapping("/join.do")
	public ModelAndView join(Member m, HttpSession session, ModelAndView mav) {
		
//		//카카오에서 가져온 세션 정보
//		String name = (String) session.getAttribute("name");
//		String email = (String) session.getAttribute("email");		
//		
//		System.out.println("============================");
//		System.out.println("name : " + name);
//		System.out.println("email : " + email);
//		System.out.println("============================");
//		
//		mav.addObject("name", name);
//		mav.addObject("email", email);
//		
//		if(!ObjectUtils.isEmpty(session.getAttribute("name"))) {
//			session.removeAttribute("name");	
//		}
//		if(!ObjectUtils.isEmpty(session.getAttribute("email"))) {
//			session.removeAttribute("email");	
//		}
		
		mav.setViewName("/member/join");
		return mav;
	}
	
	//ajax 개인회원가입 페이지 이동
	@RequestMapping("/kakaojoin.do")
	public ModelAndView kakaojoin(Member m, HttpSession session, ModelAndView mav) {
		
		//카카오에서 가져온 세션 정보
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		String email = (String) session.getAttribute("email");		
		
		mav.addObject("id", id);
		mav.addObject("name", name);
		mav.addObject("email", email);
		
		//새로고침시 다시 인증하라고 하기 위한 세션 삭제
		if(!ObjectUtils.isEmpty(session.getAttribute("id"))) {
			session.removeAttribute("id");	
		}
		if(!ObjectUtils.isEmpty(session.getAttribute("name"))) {
			session.removeAttribute("name");	
		}
		if(!ObjectUtils.isEmpty(session.getAttribute("email"))) {
			session.removeAttribute("email");	
		}
		
		mav.setViewName("/member/kakaoJoin");
		return mav;
	}
	
	//ajax 개인회원가입
	@RequestMapping("/joinend.do")
	public void joinend(Member m,HttpServletResponse response) throws IOException{
		
		String encodePassword=passwordEncoder.encode(m.getPassword());
		
		m.setPassword(encodePassword);
		
		int result = service.join(m);
		
		response.getWriter().print(result);
	}
	
	//로그아웃 구현
	@RequestMapping("/logout.do")
	public String logOut(SessionStatus session) {
		
		if(!session.isComplete()) {//session이 소멸되지 않았으면
			session.setComplete();	//session 삭제
		}
		
		return "redirect:/";
	}
	
	//아이디찾기 팝업화면 이동
	@RequestMapping("/findId.do")
	public ModelAndView findid(String gbn, ModelAndView mav) {

		mav.addObject("gbn", gbn);
		mav.setViewName("/member/findid");
		
		return mav;
	}
	
	//아이디 찾기 ajax 구현
	@RequestMapping("/findidEnd.do")
	public void findidEnd(Member member,HttpServletResponse response) throws IOException {
		
		Member m = service.findidEnd(member);
		
		if(m==null) {
			response.getWriter().print("");
			
		}else {
			response.getWriter().print(m.getMember_Id());
		}
	}
	
	//비밀번호찾기 팝업화면 이동
	@RequestMapping("/findPw.do")
	public String findpw() {
		return "/member/findpw";
	}
	
	
	//비밀번호 찾기 ajax 구현
	@RequestMapping("/findpwEnd.do")
	public void findpwEnd(Member member,HttpServletResponse response) throws IOException {
		
		Member m = service.findpwEnd(member);
		
		
		if(m!=null) {
			//비밀번호 찾기시 아이디값 보여주기 위한 로직
			JsonObject jo = new JsonObject();
			
			jo.addProperty("member_id", m.getMember_Id());
			jo.addProperty("number", module.joinEmail(m.getEmail()));
			Gson g = new Gson();
			g.toJson(jo, response.getWriter());
		}else {
			response.getWriter().print(false);
		}
	}
	
	//비밀번호 변경구현
	@RequestMapping("/repassword.do")
	public void newPw(String newPw, String repwid,HttpServletResponse response) throws IOException {
		
		String encodePassword=passwordEncoder.encode(newPw);
		
		int result = service.newPw(encodePassword,repwid);
		
		
		response.getWriter().print(result);
		
	}
	
	//아이디중복확인
	@RequestMapping("/idduplicate.do")
	public void idduplicate(String member_id, HttpServletResponse response) throws IOException {
		Member m = service.idDuplicate(member_id);
		
		System.out.println(m);
		
		response.getWriter().print(m);
	}
	
	//회원가입 이메일 인증
	@RequestMapping("/cofirmEmail.do")
	public void confirmEmail(String email,HttpServletResponse response) throws JsonIOException, IOException {
		JsonObject jo = new JsonObject();
		
		jo.addProperty("number", module.joinEmail(email));
		Gson g = new Gson();
		g.toJson(jo, response.getWriter());
	}
	
	//회원가입 약관동의
	@RequestMapping("/terms.do")
	public ModelAndView joinTerms(ModelAndView mv) {
		
		List<Terms>listY = service.joinTermsY();
		
		List<Terms>listN = service.joinTermsN();
		
		
		mv.addObject("listY",listY);
		mv.addObject("listN",listN);
		
		mv.setViewName("/member/terms");
		return mv;
	}
	
	
	//카카오뢰원가입시 이용약관
	@RequestMapping("/kakaoterms.do")
	public ModelAndView kakaoTerms(ModelAndView mv) {
		
		List<Terms>listY = service.joinTermsY();
		
		List<Terms>listN = service.joinTermsN();
		
		
		mv.addObject("listY",listY);
		mv.addObject("listN",listN);
		
		mv.setViewName("/member/kakaoTerms");
		return mv;
	}
	
	
	//약관동의 팝업
	@RequestMapping("/term1.do")
	public ModelAndView joinTerm1(int term_code,ModelAndView mv) {
		
		Terms t = service.joinTerm1(term_code);
		
		mv.addObject("terms",t);
		
		mv.setViewName("/member/termsNum");
		return mv;
	}
	
	//카카오 회원가입 종료
	@RequestMapping("/kakaoJoinEnd.do")
	public String kakaoJoin(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session, Model model) throws Exception {

		String joinCallbackUrl = kakaoLoginBO.getJoinCallbackUrl();
		
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state, joinCallbackUrl);

		String apiResult = kakaoLoginBO.getUserProfile(oauthToken, joinCallbackUrl);
		
		System.out.println(apiResult);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");	
		JSONObject response_obj2 = (JSONObject) response_obj.get("profile");

		// 프로필 조회
		String id = String.valueOf(jsonObj.get("id"));		//카카오 아이디값 
		String email = (String) response_obj.get("email");
		String name = (String) response_obj2.get("nickname");
		
		//카카오 아이디로 가입한 이력이 있으면 카카오 가입 불가능하도록 하고 아이디 알려줌
		Member kakaoM = service.selectKakaoInfo(id);
		if(kakaoM != null) {
			model.addAttribute("msg","이미 카카오로 회원가입한 이력이 있습니다. ID : " + kakaoM.getMember_Id());
			return "common/popupMsg";
		}
		
		// 세션에 사용자 정보 등록
		// session.setAttribute("islogin_r", "Y");
//		session.setAttribute("signIn", apiResult);
		session.setAttribute("id", id);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		
		System.out.println("id : " + id);
		System.out.println("email : " + email);
		System.out.println("name : " + name);

		return "redirect:/member/kakaoterms.do";
	}

	@RequestMapping("/kakaoLoginEnd.do")
	public String kakaoLogin(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session, Model model) throws Exception {

		String loginCallbackUrl = kakaoLoginBO.getLoginCallbackUrl();
		
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state, loginCallbackUrl);

		String apiResult = kakaoLoginBO.getUserProfile(oauthToken, loginCallbackUrl);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);

		// 프로필 조회
		String id = String.valueOf(jsonObj.get("id"));		//카카오 아이디값 
		
		//카카오 아이디로 가입한 이력이 있으면 카카오 가입 불가능하도록 하고 아이디 알려줌
		Member loginMember = service.selectKakaoInfo(id);
		if(loginMember != null) {
			model.addAttribute("loginMember",loginMember);
			model.addAttribute("loc", "/");
			model.addAttribute("msg","카카오로 로그인이 완료되었습니다.");
		}else {
			model.addAttribute("msg","카카오로 로그인에 실패하였습니다. 개인정보를 다시 확인해주세요.");
		}
		return "common/popupMsg";

	}
	
	
	
	
}
