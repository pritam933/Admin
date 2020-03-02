package com.stylopay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONException;

public class UpdateAddressInfo {
	
	
	String username = null; 
	String newAddress1 = null; 
	String newAddress2 = null; 
	String newCity = null; 
	String newZip = null; 
	String newState = null;  
	String newCountry = null; 
	String newBillingAddress1 = null; 
	String newBillingAddress2 = null; 
	String newBillingCity = null; 
	String newBillingZip = null; 
	String newBillingState = null; 
	String newBillingCountry = null; 

	String jsonResponse = null;
	String response = null;
	
	public String updateAddressDetails(String username, String newAddress1, String newAddress2, String newCity, String newZip, String newState, String newBillingAddress1, String newBillingAddress2, String newBillingCity, String newBillingZip, String newBillingState, String newCountry, String newBillingCountry) throws JSONException {
		
		this.username = username;
		this.newAddress1 = newAddress1;
		this.newAddress2 = newAddress2;
		this.newCity = newCity;
		this.newZip = newZip;
		this.newState = newState;
		this.newCountry = newCountry;
		this.newBillingAddress1 = newBillingAddress1;
		this.newBillingAddress2 = newBillingAddress2;
		this.newBillingCity = newBillingCity;
		this.newBillingZip = newBillingZip;
		this.newBillingState = newBillingState;
		this.newBillingCountry = newBillingCountry;
		
//		GetISOCountryCode getISOCountryCode = new GetISOCountryCode();
//		newISOCountryCode = getISOCountryCode.getISOCountryCodeAPI(newCountryId);
//		newISOBillingCountryCode = getISOCountryCode.getISOCountryCodeAPI(newBillingCountryId);
//		
//		GetCountryId getCountryId = new GetCountryId();
//		newCountryISDCode = getCountryId.getCountryId(newCountryId);
//		newBillingCountryISDCode = getCountryId.getCountryId(newBillingCountryId);
//		
//		CallCountryListAPI callCountryListAPI = new CallCountryListAPI();
//		newCountryName = callCountryListAPI.getCountryID(newCountryISDCode);
//		newBillingCountryName = callCountryListAPI.getCountryID(newBillingCountryISDCode);
//		
		
		try {

			URL url = new URL("http://35.180.75.185/StyloDemoWalletServiceNew/API/CommonServices/UpdateUserAddress");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":\"1\", \"username\":\"" + username + "\", \"address_line1\":\"" + newAddress1 + "\", \"address_line2\":\"" + newAddress2 + "\", \"city\":\"" + newCity + "\", \"state\":\"" + newState + "\", \"postal_code\":\"" + newZip + "\",  \"country\":\"" + newCountry + "\", \r\n"
					+ "\"billing_address_line1\":\"" + newBillingAddress1 + "\", \"billing_address_line2\":\"" + newBillingAddress2 + "\", \"billing_city\":\"" + newBillingCity + "\", \"billing_state\":\"" + newBillingState + "\", \"billing_postal_code\":\"" + newBillingZip + "\", \"billing_country\":\"" + newBillingCountry + "\"}";
						
			
			System.out.println("Update Address Info API Json input is: " + input);

			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
			

			System.out.println("Update Address Info API Json Response is - ");
			while ((jsonResponse = br.readLine())!= null) {	
				System.out.println(jsonResponse);
				
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


