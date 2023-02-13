package com.gdj.music.member.kakao;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class KakaoLoginBO {
	// 카카오 로그인 정보
	private final static String KAKAO_CLIENT_ID = "621ad6ff887788df6bfeac383fed22cb";
	private final static String KAKAO_SCOPE = "profile_nickname,account_email";
	private final static String KAKAO_CLIENT_SECRET = "클라이언트 시크릿";
	private final static String KAKAO_REDIRECT_SERVER = "http://localhost:9090/GDJ56_musicAll_final";
	//private final static String KAKAO_REDIRECT_SERVER = "http://gd1class.iptime.org:9999/GDJ56_musicAll_final";
	//private final static String KAKAO_REDIRECT_SERVER = "https://gd1class.iptime.org:8844/GDJ56_musicAll_final";
	private final static String KAKAO_JOIN_REDIRECT_URL = KAKAO_REDIRECT_SERVER+"/member/kakaoJoinEnd.do"; //Redirect URL
	private final static String KAKAO_LOGIN_REDIRECT_URL = KAKAO_REDIRECT_SERVER+"/member/kakaoLoginEnd.do"; //Redirect URL
	private final static String SESSION_STATE = "kakao_oauth_state";
	private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";
	private final static String LOGOUT_API_URL = "https://kapi.kakao.com/v1/user/logout";
	//https://gd1class.iptime.org:8844/GDJ56_musicAll_final";
	
	public String getAuthorizationUrl(HttpSession session, String callbackUrl) {
		String state = generateRandomString();
		setSession(session, state);
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(KAKAO_CLIENT_ID)
				.apiSecret(KAKAO_CLIENT_SECRET)
				.callback(callbackUrl)
				.state(state)
				.scope(KAKAO_SCOPE)
				.build(KakaoOAuthApi.instance());
		return oauthService.getAuthorizationUrl();
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state, String callbackUrl) throws Exception {
		String sessionState = getSession(session);
		if (StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(KAKAO_CLIENT_ID)
					.apiSecret(KAKAO_CLIENT_SECRET)
					.callback(callbackUrl)
					.state(state).build(KakaoOAuthApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}

	public String getUserProfile(OAuth2AccessToken oauthToken,  String callbackUrl) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(KAKAO_CLIENT_ID)
				.apiSecret(KAKAO_CLIENT_SECRET)
				.callback(callbackUrl)
				.build(KakaoOAuthApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	public String logout(OAuth2AccessToken oauthToken,  String callbackUrl) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(KAKAO_CLIENT_ID)
				.apiSecret(KAKAO_CLIENT_SECRET)
				.callback(callbackUrl)
				.build(KakaoOAuthApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, LOGOUT_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	public String getJoinCallbackUrl() {
		return KAKAO_JOIN_REDIRECT_URL;
	}
	
	public String getLoginCallbackUrl() {
		return KAKAO_LOGIN_REDIRECT_URL;
	}
	
}
