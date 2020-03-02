

package com.stylopay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

public class AddAccount {
	
	String currency = null;
	String username = null;
	
	String jsonResponse = null;
	String response = null;
	
	public String addCurrencyAccount(String currency, String username) {
		
		this.currency = currency;
		this.username = username;
		
		try {

			URL url = new URL("http://35.180.75.185/StyloDemoWalletServiceNew/API/UPayAPI/CreateAccount");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":\"1\", \"username\":\"" + username + "\", \"currency\":\"" + currency + "\"}";
						
			

			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
			

			while ((jsonResponse = br.readLine())!= null) {	
				System.out.println(jsonResponse);
				
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
