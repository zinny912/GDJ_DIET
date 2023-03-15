package com.goody.diet.member;

import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/main/*")
public class KakaoController {
	
    @RequestMapping(value="kakao_login.ajax")
    public String kakaoLogin() {
    	System.out.println("왔어...");
    	String kakaoUrl="https://kauth.kakao.com/oauth/authorize?client_id=4dbfcfd2f5a649a659ccd93aa0364e69&redirect_uri=https://localhost/oauth&response_type=code";
    	return kakaoUrl;
    	
//        StringBuffer loginUrl = new StringBuffer();
//        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
//        loginUrl.append("4dbfcfd2f5a649a659ccd93aa0364e69"); //REST API
//        loginUrl.append("&redirect_uri=");
//        loginUrl.append("https://localhost/oauth"); //redirect URL
//        loginUrl.append("&response_type=code");
//        
//        return "redirect:"+loginUrl.toString();
    }
}
