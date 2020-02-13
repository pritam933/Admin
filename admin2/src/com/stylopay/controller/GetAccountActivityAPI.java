

package com.stylopay.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class GetAccountActivityAPI {

	String accountId = null;
	String fromDate = null;
	String toDate = null;
	String jsonResponse = null;
	String response = null;
	
	public String getTransactionActivityDetails(String accountId, String fromDate, String toDate) {
		
		this.accountId = accountId;
		this.fromDate = fromDate;
		this.toDate = toDate;
		
		String jsonResponse = null;
		String response = null;
		
		
try {
			
	URL url = new URL("http://35.180.75.185/StyloDemoWalletServiceNew/API/UPayAPI/getAccountActivity");
	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	conn.setDoOutput(true);
	conn.setRequestMethod("POST");
	conn.setRequestProperty("Content-Type", "application/json");
	conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

	String input = "{\"Application_ID\":\"1\", \"account\":\""+ accountId + "\", \"date_from\":\"" + fromDate + "\", \"date_to\":\"" + toDate + "\"}";
				
			

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














