package com.stylopay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONObject;

public class GetUserContactDetailsNewAPI {
	
	String email = null;
	
	String jsonResponse = null;
	String response = null;
	
	public String getUserContactDetails(String email) {
		
		this.email = email;
		
		try {
			
			URL url = new URL("http://35.180.75.185/StyloDemoWalletService/API/CommonServices/GetUserContactDetailsNew");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":\"1\", \"Email_ID\":\""+ email + "\"}";
						
			
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
			

			while ((jsonResponse = br.readLine())!= null) {	
				response = jsonResponse;				
				
				
			}
			



		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		 }			
		
		
		return response;
		
	}
}


