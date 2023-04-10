package com.goody.diet.order;

import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import org.springframework.stereotype.Component;


public class getToken {

	public static String getpaymentToken() throws Exception {

		String url = "https://api.iamport.kr/users/getToken";
		//요청url

		String authData = "imp_key=6656783584856360&imp_secret=FlXOZ4fWIaOoyfF87hqKSTqqlp5uTiZgjC7rfjY3G7xquzfKRwNs7te2qiwv0xrkj9IhkHB7HtfHv3fY";
		//key secret

		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();//connecter열기


		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");//
		conn.setRequestProperty("Content-Length", Integer.toString(authData.length()));


		conn.setDoOutput(true);
//		try (OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream())) {
//			writer.write(authData);
//			writer.flush();
//		}


		String response = new Scanner(conn.getInputStream(), "UTF-8").useDelimiter("\\A").next();

		String result = null;
		if (conn.getResponseCode() == 200) {
			String token = response.substring(response.indexOf("access_token") + 15, response.indexOf("\",\"now\""));
			System.out.println("Token: " + token);
			result= token;
		} else {
			System.out.println("Error: " + response);
			result = response;
		}

		conn.disconnect();
		return result;
	}

}
