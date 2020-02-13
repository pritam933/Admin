package com.stylopay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.stylopay.bean.MoneyTransferToAnotherAccBean;

public class MoneyTransferToAnotherAcc {
	
	
	MoneyTransferToAnotherAccBean moneyTransferToAnotherAccBean;
	
	String jsonResponse = null;
	String response = null;
	String responseMsg = null;
	
	public String fundTransferAnotherUser(String sender, String receiver, String amount, String currency) throws JSONException
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
{
		
		
		String senderAcc = sender;
		String receiverAcc = receiver;
		String amount1 = amount;
		String currency1 = currency;
		
		try {

			URL url = new URL(" http://developer.staging.stylopay.com/StyloDemoWalletService/API/MoneyTransfer/FundTransferUser ");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":1,\"sender_account\":\"" + senderAcc + "\", \"receiver\": \""  + receiverAcc + "\", \"amount\":\"" + amount1 + "\", \"currency\": \"" + currency1 + "\"}";
						
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

	
	
	
	
	
	
	
	
	
	
	
	
	/*{
	
		
		
		String senderAcc = sender;
		String receiverAcc = receiver;
		String amount1 = amount;
		String currency1 = currency;
		
		
		try {

			URL url = new URL("http://developer.staging.stylopay.com/StyloDemoWalletService/API/MoneyTransfer/FundTransferUser");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "asdfghjklLKJHGFDSA");

			String input = "{\"Application_ID\":1,\"sender_account\":\"" + senderAcc + "\", \"receiver\": \""  + receiverAcc + "\", \"amount\":\"" + amount1 + "\", \"currency\": \"" + currency1 + "\"}";
						
		
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
			

			while ((jsonResponse = br.readLine())!= null) {	
			
				response = jsonResponse;				
				
			}
			
			
			System.out.println(" API Json Response is - ");
			if(response!=null){
				
				
						JSONObject jsonResponse = new JSONObject(response);
					if(jsonResponse.get("status").toString().compareToIgnoreCase("success")==0)
							{
						responseMsg = "success";
							}
					else{
						responseMsg = "Unknown error!";
					}

				
			}else {
				
				responseMsg = "Unknown error!";
				
			}
			
			
		



		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();		
			
		  }			
		
		
		return responseMsg;
	}
*/

}
