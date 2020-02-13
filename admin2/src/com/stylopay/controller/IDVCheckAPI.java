package com.stylopay.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.stylopay.bean.Detailsbean;



public class IDVCheckAPI {	
	
Detailsbean detailsbean= new Detailsbean();
	
	String username = null;;
	String country = null;;
	String dob = null;
	String fname = null;
	String aptNo = null;

	String city = null;
	String state = null;
	String postcode = null;
	String lname = null;
	
	
	String jsonResponse = null;
	String response = null;
	
	String doc1 = null;
	String doc2 = null;
	String doc3 = null;
	
	
	public String kycIdvChcking(List<String> docUid,String country, String dob, String fname, String aptNo, String city, String state, String postcode,String username, String lname) {
		
		List<String> documentUid = new ArrayList<String>();
		
		documentUid = docUid;
		this.username = username;
		this.country = country;
		this.dob = dob;
		this.fname = fname;
		this.aptNo = aptNo;
		 this.city = city;
		this.state = state;
		this.postcode = postcode;
		this.lname = lname;		
		
			
		doc1 = documentUid.get(0);
		doc2 = documentUid.get(1);
		doc3 = documentUid.get(2);
	
		
		
		try {

			URL url = new URL("http://developer.staging.stylopay.com/KYCServerDemo/API/KYC/DocSubmission");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":\"1\", \"user_Document\":[{\"DocumentReference\":\"IDFront\", \"DocumentUID\":\"" + doc1 + "\"}, \r\n"
					+ "{\"DocumentReference\":\"IDBack\", \"DocumentUID\":\"" + doc2 + "\"}, \r\n"
					+ "{\"DocumentReference\":\"POA\", \"DocumentUID\":\"" + doc3 + "\"}], \"username\": \"" + username + "\", \"iso_country_code\":\"" + country + "\", \r\n"
					+ "\"birth_date\":\"" + dob + "\", \"forename\": \"" + fname + "\", \"address_line_1\": \"" + aptNo + "\","
					+ "\"city\":\"" + city + "\", \"state\":\"" + state + "\", \"postcode\":\"" + postcode + "\", \"surname\": \"" + lname + "\"}";
						
			
		
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


