package com.gdj.music.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

public class PaymentCheck {
	
	//액세스 토큰 가져오기
	public String getImportToken() throws IOException, ParseException {
		
		HttpURLConnection conn=null;
		String access_token=null;//발급받을 액세스 토큰
		URL url=new URL("https://api.iamport.kr/users/getToken");//액세스 토큰을 받아올 주소 입력
		conn=(HttpURLConnection)url.openConnection();
		
		//요청방식:POST
		conn.setRequestMethod("POST");
		//Header설정 (application/json형식으로 데이터를 전송)
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");//서버로부터 받을 Data를 JSon 형식 타입으로 요청함
		//Data 설정
		conn.setDoOutput(true);//OuputStream으로 POST 데이터를 넘겨주겠다는 옵션
		
		
		//서버로 보낼 데이터 JSON 형태로 변환(imp_apikey,imp_secret)
		JSONObject obj= new JSONObject();
		obj.put("imp_key", "1860341256016565");
		obj.put("imp_secret", "0M0HzxPPBVDGUKWGLnu1pymiHExi6ajX88Jcgh2MbwnYN08bAabdeK1TWTTmc8eVkVVEGvVE9OKBZqXj");
		//아임포트서버로 Request(요청)
		BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		
		//서버로부터 응답 데이터 받기
		int result=0;
		int responseCode=conn.getResponseCode();//응답코드 받기
//		System.out.println("응답코드는??"+responseCode);//응답코드 확인
		if(responseCode==200){//성공
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb=new StringBuilder();
			String line=null;
			while((line=br.readLine())!=null) {
				sb.append(line+"\n");
			}
			br.close();
//			System.out.println(""+sb.toString());
			
//			1.JSONParser 라이브러리를 사용(JSON 형태로 되어있는 데이터들중 원하는 것들을 추출하기 위해 사용)
			JSONParser jsonParser = new JSONParser();
//			2.Json 데이터를 JSON 객체 형태로 변환
			JSONObject jsonObj = (JSONObject)jsonParser.parse(sb.toString());
//			3.응답(Response)데이터를 가져옴
			JSONObject responseData = (JSONObject)jsonObj.get("response");
//			4.응답 데이터중에서 Key가 access_token Value값을 가져옴
			access_token = (String)responseData.get("access_token");
			System.out.println("가져온 access_token 값 : "+access_token);
			
			
			result=1;//환불 성공시 정수값 1 반환
			return access_token;
		}else {//실패
			System.out.println(conn.getResponseMessage());//환불 실패시 정수값 0반환(응답코드400,404..등등)
			return null;
		}
	}
	
	//환불요청하기
	public int cancelPayment(String access_token, String imp_uid,int amount)throws IOException, ParseException {
		int result=0;
		System.out.println("결제 취소");
		
		HttpURLConnection conn=null;
		URL url=new URL("https://api.iamport.kr/payments/cancel");
		conn=(HttpURLConnection)url.openConnection();
		
		//요청방식:POST
		conn.setRequestMethod("POST");
		//Header설정 (application/json형식으로 데이터를 전송)
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");//서버로부터 받을 Data를 JSon 형식 타입으로 요청함
		conn.setRequestProperty("Authorization", access_token);//액세스토큰
		//Data 설정
		conn.setDoOutput(true);//OuputStream으로 POST 데이터를 넘겨주겠다는 옵션
		
		
		//서버로 보낼 데이터 JSON 형태로 변환(imp_apikey,imp_secret)
		JSONObject obj= new JSONObject();
		obj.put("imp_uid", imp_uid);
		obj.put("amount", amount);
		obj.put("checksum", amount);
		//아임포트서버로 Request(요청)
		BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		
		
		
		int responseCode=conn.getResponseCode();//응답코드 받기
		System.out.println("환불 응답코드는??"+responseCode);//응답코드 확인
		if(responseCode==200) {
			//환불 성공!
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			
			br.close();
			conn.disconnect();
			result=1;
			return result;
		}else {
			return result;
		}
		
		
	}
}
