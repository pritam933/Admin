package com.stylopay.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.servlet.ModelAndView;

public class Loginutil {

	String email = null;
	String password = null;
	
	String jsonResponse = null;
	String response = null;
	
	public String login (String email,String password) throws JSONException {
		
		this.email = email;
		this.password = password;
		
		try {

			URL url = new URL("http://developer.staging.stylopay.com/StyloDemoWalletService/API/CommonServices/Login");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":1,\"Email_ID\":\"" + email + "\",\r\n"
					+ "\"Password\":\"" + password + "\" }";
						
			
		

			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
			

			
				while ((jsonResponse = br.readLine())!= null) {	
					
					
					response = jsonResponse;	
					
				
					JSONObject jsonreponse = new JSONObject(response);
			
				
			}			
		

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		 }			
		
		
				return response;

	}

	
	
	
}
