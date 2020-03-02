package com.stylopay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import com.stylopay.bean.Detailsbean;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;

@Controller
public class KYCDocumentUploadAPI {
	
	
	Detailsbean detailsbean =new Detailsbean();
	
	String documentData = null;
	String username = null;
	String documentType = null;
    String jsonResponse = null;
	String response = null;
	
	public String uploadKYCFile(String documentData, String username, String documentType) {
		
		this.documentData = documentData;
		this.username = username;
		this.documentType = documentType;
		
		
		
		try {

			URL url = new URL("http://developer.staging.stylopay.com/KYCServerDemo/API/KYC/UploadDocument");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":\"1\", \"DocumentData\":\"" + documentData + "\", \"DocumentReference\":\"ID\", \"DocumentType\":\"" + documentType + "\", \"username\":\"" + username + "\"}";
						
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
