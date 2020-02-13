package com.stylopay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;

import com.stylopay.bean.Detailsbean;

@Controller
public class Details {
	
	
	Detailsbean Detailsbean;
	
	String jsonResponse = null;
	String response = null;
	String responseMsg = null;
	
	public String details(String username) throws JSONException {
		
		
		
		String UserName = username;

		
		try {

			URL url = new URL(" http://developer.staging.stylopay.com/StyloDemoWalletService/API/CommonServices/GetUser_Details ");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":1,\"username\":	\"" + username + "\"}";
						
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

	public static String getdetails(Object user_permission_group, Object first_name, Object last_name, Object id) {
		return null;
	}

}
