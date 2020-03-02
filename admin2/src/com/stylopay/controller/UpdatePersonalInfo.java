package com.stylopay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class UpdatePersonalInfo {
	
	
	String username = null; 
	String newEmail = null;
	
	String jsonResponse = null;
	String response = null;
	
	public String updatePersonalDetails(String username, String newEmail) {
		
		this.username = username;
		this.newEmail = newEmail;
		
		try {

			URL url = new URL("http://35.180.75.185/StyloDemoWalletServiceNew/API/CommonServices/UpdateUserEmail");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":\"1\", \"username\":\"" + username + "\", \"email\":\"" + newEmail + "\"}";
						
			
	
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
			

	while ((jsonResponse = br.readLine())!= null) {	
				
				response = jsonResponse;				
				
				
			}
			

			//conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		 }			
		
		
		
		return response;
	}

}
