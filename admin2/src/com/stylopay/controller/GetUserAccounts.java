package com.stylopay.controller;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import com.stylopay.bean.Detailsbean;

import org.json.JSONException;

public class GetUserAccounts {
	
	Detailsbean  Detailsbean;
	
	String username = null;
	
	
	String jsonResponse = null;
	String response = null;
	
	public String accountDetails(String username) throws JSONException{
		
		this.username = username;
	
		
		try {

			URL url = new URL("http://developer.staging.stylopay.com/StyloDemoWalletService/API/CommonServices/GetUserAccounts");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":1,\"username\":\""+ username + "\" }";
						
			
		
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



