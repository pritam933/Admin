package com.stylopay.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class GetAccountDetails {

	String account = null;
	
	String jsonResponse = null;
	String response = null;
	
	public String accountdetails1(String account) {
		
		this.account = account;
		
		
try {
			
			URL url = new URL("http://35.180.75.185/StyloDemoWalletServiceNew/API/UPayAPI/GetAccountDetails");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":\"1\", \"account\":\""+ account + "\"}";
						
			
			

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
