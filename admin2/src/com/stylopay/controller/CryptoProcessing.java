package com.stylopay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.ResultSet;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;

import com.stylopay.bean.Detailsbean;

@Controller
public class CryptoProcessing {
	
	
	Detailsbean detailsbean;
	
	String jsonResponse = null;
	String response = null;
	String responseMsg = null;
	
	public String cryptoLoadInitate( String UserName,String  Agent_Code,String Sub_Agent_Code,String  DepositCurrencyCode,String DepositAmount,String SellingCurrencyCode, String Email) throws JSONException {
		
	
		
		try {

			URL url = new URL("http://35.178.115.238:8080/CryptoLoad/Staging/InitateLoad");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":1"+",\"Agent_Code\":\"" + Agent_Code+"\"" + ",\"UserName\":\"" + UserName +"\""+ ",\"Email\":\"" + Email +"\", \"Sub_Agent_Code\": \"" + Sub_Agent_Code+"\"" +",\"DepositAmount\":"+ DepositAmount +",\"DepositCurrencyCode\":\"" + DepositCurrencyCode + "\", \"SellingCurrencyCode\": \"" + SellingCurrencyCode + "\"}";
							
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
