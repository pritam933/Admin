package com.stylopay.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stylopay.bean.Loginbean;
import com.stylopay.bean.IDVCheckBean;
import com.stylopay.bean.MoneyTransferToAnotherAccBean;
import com.stylopay.bean.Detailsbean;
import com.stylopay.bean.Accountholdersbean;

import com.stylopay.util.Loginutil;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

import com.stylopay.util.Accountholderlist;

import com.stylopay.bean.TransactionActivitiesBean;



@Controller
public class AdminController {

	
	
	
	
	@Autowired 
	private HttpSession httpSession;
	
	private String admin_Agent_code = "";
	private String admin_Sub_Agent_code = "";
	Accountholdersbean accountholder = new Accountholdersbean();
	
	String username = null;
	String name = null;
	String email = null;
	String password = null;
	String birthDate = null;
	String firstname = null;
	String lastName = null;
	String aptNo = null;
	String streetNo = null;
	String street = null;
	String city = null;
	String state = null;
	String postcode = null;
	String countryId = "81";
	String kycUploadFlag = null;
	String isoCountryCode=null;
	String accessToken = null;
     String memberId = null;
	List<String> accountInfo = new ArrayList<String>();
	
	ResultSet resultSet = null;

	GetUserAccounts getUserAccountsList = new GetUserAccounts();
	InsertUsercredentialsToDatabase insertUsercredentialsToDatabase = new InsertUsercredentialsToDatabase();

	ServletContext context;

	
	
	///////////////////////////////////// login/////////////////////////////////////

	@RequestMapping(value = "/login")
	public ModelAndView Login() {
		return new ModelAndView("Dashboard");
	}

/////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/Dashboard", method = RequestMethod.POST)
	public ModelAndView userSignin(@ModelAttribute("login") Loginbean loginbean,HttpSession session, HttpServletRequest request,
			Model model) throws SQLException, JSONException {

		Loginutil login = new Loginutil();

		String email = loginbean.getEmail();
		String UserName_UserID =null;
		String Client_Agent_SubAgent_Name=null;
		String Email_ID=null;
        String AccountId1=null;
        String adminagent=null;
        String adminsubagent=null;
		String password = loginbean.getPass();
		String response = login.login(email, password);
		JSONObject jsonreponse = new JSONObject(response);
	if (((JSONObject) jsonreponse.get("Status")).get("Code").toString().equals("0")
				&& ((JSONObject) jsonreponse.get("UserData")).get("WalletHolder_Administrator_Partner_Flag_WAPn")
						.toString().equals("A")) {

			
			String UserData = jsonreponse.get("UserData").toString();
			JSONObject jsonreponse1 = new JSONObject(UserData);
			accountholder.setAdmin_Agent_code(jsonreponse1.get("Admin_Agent_code").toString());
			accountholder.setAdmin_Agent_code(jsonreponse1.get("Admin_Sub_Agent_code").toString());

			admin_Agent_code = jsonreponse1.get("Admin_Agent_code").toString();
			admin_Sub_Agent_code = jsonreponse1.get("Admin_Sub_Agent_code").toString();

		
             UserName_UserID  =	jsonreponse1.get("UserName_UserID").toString();
			httpSession.setAttribute("UserName_UserID", UserName_UserID);
			
			Client_Agent_SubAgent_Name=jsonreponse1.get("Client_Agent_SubAgent_Name").toString();
			
			httpSession.setAttribute("Client_Agent_SubAgent_Name", Client_Agent_SubAgent_Name);
			
			adminsubagent=jsonreponse1.get("Admin_Sub_Agent_code").toString();
			httpSession.setAttribute("Admin_Sub_Agent_code", adminsubagent);
			Email_ID=jsonreponse1.get("Email_ID").toString();
			httpSession.setAttribute("Email_ID", Email_ID);
			AccountId1=jsonreponse1.get("AccountId").toString();
			httpSession.setAttribute("AccountId", AccountId1);
			
			adminagent=jsonreponse1.get("Admin_Agent_code").toString();
			httpSession.setAttribute("Admin_Agent_code", adminagent);
			
			

			loginbean.setEmail(loginbean.getEmail());
			loginbean.setPass(loginbean.getPass());
			////////////////////////////////if new session requested redirect to login page/////////////////////////
			
		

			return new ModelAndView("dashboard2");
		} else {
			return new ModelAndView("ulogin");
		}

	}

	

	//////////////////////////////////// Get card
	//////////////////////////////////// holders////////////////////////////

	@RequestMapping(value = "/AccountList", method = RequestMethod.POST)
	@ResponseBody
	public String getcardholdersAPI(@ModelAttribute("accountholders") Accountholdersbean accountholdersbean,
			HttpServletRequest request, Model model) throws SQLException, JSONException {
		String userData = null;
		String cardholders=null;

		if (admin_Agent_code == null) {
			
		

	
		} else {
			Accountholderlist getcardholdersAPI = new Accountholderlist();
			String response = getcardholdersAPI.getcardholdersAPI(admin_Agent_code, admin_Sub_Agent_code);

			if (response.contains("OK")) {

				JSONObject jsonResponse1 = new JSONObject(response);
				userData = jsonResponse1.get("user_data").toString();
				cardholders=jsonResponse1.get("TotalCardHolder").toString();
				
				
				
			httpSession.setAttribute("cardholders", cardholders);
			
			
		
	


			} 

		}
		return userData;
		
	}



//////////////////////////////////////////////////////kyc upload/////////////////////////////////////////
	@RequestMapping(value = "/kycupload", method = RequestMethod.POST)

	
	
	
	
	
	public ModelAndView uploadKycDocs(@ModelAttribute("uploadFiles") KYCFileUpload kycFileUpload, Model model, Detailsbean Detailsbean ,
			 HttpServletRequest servletRequest, String username,String isoCountryCode,String state,String aptNo,String city,String postcode,String lastName,String firstname,String birthDate, ServletRequest request)
			throws IOException, JSONException {

		String docType = null;
		
		
		username= Detailsbean.getUsername();
		
		 isoCountryCode=Detailsbean.getIsoCountryCode();
			state=Detailsbean.getState();
			aptNo=Detailsbean.getAptNo();
			city=Detailsbean.getCity();
			
				postcode=Detailsbean.getPostcode();
				lastName=Detailsbean.getLname();
			birthDate=Detailsbean.getDob();
			firstname=Detailsbean.getFname();
	
	

         // Get the list of files
		List<MultipartFile>files = kycFileUpload.getFiles();
	    List<String> docUId = new ArrayList<String>();

		// Check whether the list is not null or empty
		if (files != null && !files.get(0).getOriginalFilename().isEmpty()) {
			// Get the individual MultipartFile
			for (MultipartFile multipartFile : files) {

				byte[] bytes = multipartFile.getBytes();
				byte[] encoded = Base64.encodeBase64(bytes);
				String encodedString = new String(encoded);

				if (multipartFile.getOriginalFilename().contains("jpeg")) {

					docType = "JPEG";

				} else if (multipartFile.getOriginalFilename().contains("png")) {

					docType = "PNG";

				} else if (multipartFile.getOriginalFilename().contains("pdf")) {

					docType = "PDF";

				}
				
				
				
				
			
				KYCDocumentUploadAPI kycDocumentUploadAPI = new KYCDocumentUploadAPI();
				String response = kycDocumentUploadAPI.uploadKYCFile(encodedString, username, docType);

				JSONObject jsonResponse = new JSONObject(response);
				String documentUid = jsonResponse.getString("DocumentUID");

				docUId.add(documentUid);

			}

		} 
		
		
	
		
		// Calling IDVCheck APIIIIIIIIIIIIIIIIIIIIII	
		
	
 	 	IDVCheckAPI idvCheckAPI = new IDVCheckAPI();
 	 	
 	 	String lol=  idvCheckAPI.kycIdvChcking(docUId, 
 	 			isoCountryCode, birthDate, firstname, aptNo, city, state, postcode, lastName,username);
 	 	
 	 
 	 	
 	 	return new ModelAndView("dashboard2");

	}

//////////////////////////////////////////////////////////////details button populate//////////////////
	@RequestMapping(value = "/Information", method = RequestMethod.POST)
	@ResponseBody
	public String  userdetails(@RequestParam("username") String username, HttpServletRequest request, Model model)
			throws Exception {

		
		

		 Details user = new Details();
		 
		 return user.details(username);
		 
 
	        
         
		
	}

	/////////////////////////////////////// get user
	/////////////////////////////////////// accounts//////////////////////////

	@RequestMapping(value = "/getaccounts", method = RequestMethod.POST)

	@ResponseBody
	public String GetUserAccounts(@ModelAttribute("acounts") Detailsbean Detailsbean, HttpServletRequest request,
			Model model, String username) throws SQLException, JSONException {
	      GetUserAccounts accountDetails = new GetUserAccounts();
	      return accountDetails.accountDetails(username);

		

		
	}

	///////////////////////////////////////////////////// get account
	///////////////////////////////////////////////////// details//////////////////////////////

	@RequestMapping(value = "/accountdetails", method = RequestMethod.POST)
	@ResponseBody
	public String accountdetails1(@RequestParam("account") String account, HttpServletRequest request, Model model)
			throws Exception {

		GetAccountDetails dontGetAccountDetails = new GetAccountDetails();
		return dontGetAccountDetails.accountdetails1(account);

		
	}

////////////////////////////////////////////////////////////money  transfer//////////////////
	@RequestMapping(value = "/senderToReceiverTransfer", method = RequestMethod.POST)
	@ResponseBody
	public String senderToReceiverTransfer(@RequestParam("senderAcc") String senderAcc,

			@RequestParam("beneficiaryAccount") String beneficiaryAccount, @RequestParam("amount") String amount,
			@RequestParam("currencyType") String currencyType, HttpServletRequest request,
			MoneyTransferToAnotherAccBean moneytransfer, Model Model)
			throws JSONException, JSONException {

		String senderAccount = senderAcc;
     	String beneficiaryAcc = beneficiaryAccount;
     

		String transferAmount = amount;
		String currency = currencyType;

		 MoneyTransferToAnotherAcc moneytransferotheracc = new  MoneyTransferToAnotherAcc();
		 return moneytransferotheracc.fundTransferAnotherUser(senderAccount, beneficiaryAcc, transferAmount, currency);

	
		
	}

/////////////////////////////////////////////////////////////////////////////////////////////////	
	
	////////////////////////////////////////get  activity//////////////////////
	@RequestMapping(value = "/getactivity", method = RequestMethod.POST)
	 @ResponseBody 
	 public String getTransactionListDetails(@RequestParam("accountId") String accountId,
			  
			  @RequestParam("fromDate") String fromDate, @RequestParam("toDate") String
			  toDate, Model Model,TransactionActivitiesBean transactionbean, HttpServletRequest request) throws JSONException {

		GetAccountActivityAPI transactions = new GetAccountActivityAPI();
		return	transactions.getTransactionActivityDetails(accountId,fromDate,toDate);

		 
	}	
	
/////////////////////////////////////////////////////////	
////////////////////////////////////////////////////Update Address//////////////////////////////
	
@RequestMapping(value = "/updateAddressInfo", method = RequestMethod.POST)
@ResponseBody
public String updateAddressInfo(@RequestParam("updateAddress1") String updateAddress1,@RequestParam("username") String username,
@RequestParam("updateAddress2") String updateAddress2, @RequestParam("updateCity") String updateCity,
@RequestParam("updateZip") String updateZip, @RequestParam("updateState") String updateState,
@RequestParam("updateCountry") String updateCountry,
@RequestParam("updateBillingAddress1") String updateBillingAddress1,
@RequestParam("updateBillingAddress2") String updateBillingAddress2,
@RequestParam("updateBillingCity") String updateBillingCity,
@RequestParam("updateBillingZip") String updateBillingZip,
@RequestParam("updateBillingState") String updateBillingState,
@RequestParam("updateBillingCountry") String updateBillingCountry) throws SQLException, JSONException {

String newAddress1 = updateAddress1;
String newAddress2 = updateAddress2;
String newCity = updateCity;
String newZip = updateZip;
String newState = updateState;
String newCountryId = updateCountry;

String newBillingAddress1 = updateBillingAddress1;
String newBillingAddress2 = updateBillingAddress2;
String newBillingCity = updateBillingCity;
String newBillingZip = updateBillingZip;
String newBillingState = updateBillingState;
String newBillingCountryId = updateBillingCountry;

System.out.println("username: " + username);
System.out.println("newAddress1: " + newAddress1);



UpdateAddressInfo updateAddressInfo = new UpdateAddressInfo();
String response = updateAddressInfo.updateAddressDetails(username, newAddress1, newAddress2, newCity,
newZip, newState, newCountryId, newBillingAddress1, newBillingAddress2, newBillingCity, newBillingZip,
newBillingState, newBillingCountryId);

return response;
}


///////////////////////////////////////////// Update EmailId ///////////////////////////////////////////////////	  

@RequestMapping(value = "/updatePersonalInfo", method = RequestMethod.POST)
@ResponseBody
public String updatePersonalInfo(@RequestParam("updatedEmail") String updatedEmail,@RequestParam("username") String username)
throws SQLException, JSONException {

String newEmail = updatedEmail;



UpdatePersonalInfo updatePersonalInfo = new UpdatePersonalInfo();
String response = updatePersonalInfo.updatePersonalDetails(username, newEmail);

return response;

}



/////////////////////////////////add account


@RequestMapping(value = "/accountadd", method = RequestMethod.POST)
@ResponseBody
public String  addaccu(@RequestParam("username") String username,@RequestParam("currency") String currency, HttpServletRequest request, Model model)
		throws SQLException, JSONException  {

	
	

	AddAccount addAccount = new AddAccount();
		
	return addAccount.addCurrencyAccount(currency, username);
	 

        
     
	
}


////////////////////////////////////////

	
	
	@RequestMapping(value = "/loadcrypto", method = RequestMethod.POST)
	@ResponseBody
	public String  cryptoLoadInitate(@RequestParam("Sub_Agent_Code") String Sub_Agent_Code,@RequestParam("UserName") String UserName,@RequestParam("Agent_Code") String Agent_Code,@RequestParam("Email") String Email,@RequestParam("DepositCurrencyCode") String DepositCurrencyCode,@RequestParam("DepositAmount") String DepositAmount,@RequestParam("SellingCurrencyCode") String SellingCurrencyCode, HttpServletRequest request, Model model)
			throws Exception {

		
	//	Map<String,String> param=new HashMap<String,String>();

		 CryptoProcessing cryp = new CryptoProcessing();
		 
		 return cryp.cryptoLoadInitate( Sub_Agent_Code,UserName,  Agent_Code,  DepositCurrencyCode,DepositAmount,SellingCurrencyCode, Email);
		 
    
		
	}

	/////////////////////////////////cryptostatus/////////////////////
	
	@RequestMapping(value = "/cryptostatus", method = RequestMethod.POST)
	@ResponseBody
	public String  cryptostatus(@RequestParam("TransactionRequestID") String TransactionRequestID,@RequestParam("Sub_Agent_Code") String Sub_Agent_Code,@RequestParam("UserName") String UserName,@RequestParam("Agent_Code") String Agent_Code,@RequestParam("Email") String Email,@RequestParam("DepositCurrencyCode") String DepositCurrencyCode,@RequestParam("DepositAmount") String DepositAmount,@RequestParam("SellingCurrencyCode") String SellingCurrencyCode, HttpServletRequest request, Model model)
			throws Exception {

		
	//	Map<String,String> param=new HashMap<String,String>();

		 cryptostatus crypsta = new cryptostatus();
		 
		 return crypsta.cryptostatus( TransactionRequestID,Sub_Agent_Code,UserName,  Agent_Code,  DepositCurrencyCode,DepositAmount,SellingCurrencyCode, Email);
		 
    
		
	}
	
	
	////////////////////////////////////////get  activity//////////////////////
	@RequestMapping(value = "/cryptohistory", method = RequestMethod.POST)
	 @ResponseBody 
	 public String cryptohistory(
			@RequestParam("Sub_Agent_Code") String Sub_Agent_Code,@RequestParam("UserName") String UserName,@RequestParam("Agent_Code") String Agent_Code,@RequestParam("Email") String Email , Model Model,TransactionActivitiesBean transactionbean, HttpServletRequest request) throws JSONException {

		cryptoactivity btchistory = new cryptoactivity();
		return	btchistory.cryptohistor(Sub_Agent_Code,UserName,Agent_Code, Email);

		 
	}
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////
	





/////////////////////////////////logout///////////////////////

@RequestMapping(value = "/logout", method = RequestMethod.POST)
public ModelAndView logout() {

	ModelAndView mv = new ModelAndView("login");
	mv.addObject("username", email);
	
	return mv;
}









@RequestMapping(value = "/loginn", method = RequestMethod.GET)
public ModelAndView loginn() {

	ModelAndView mv = new ModelAndView("login");
	//mv.addObject("username", email);
	
	return mv;
}



/////////////////////////activityacc page redirect/////

@RequestMapping(value = "/ACCactivity", method = RequestMethod.GET)
public ModelAndView acti() {

	ModelAndView mv = new ModelAndView("accactivity");
	//mv.addObject("username", email);
	
	return mv;
}
///////////////////////////////////load from bank account

@RequestMapping(value = "/frombank", method = RequestMethod.GET)
public ModelAndView frombank() {

	ModelAndView mv = new ModelAndView("bankwa");
	//mv.addObject("username", email);
	
	return mv;
}


//////////////////////////////////rev report/////////////////
@RequestMapping(value = "/report", method = RequestMethod.GET)
public ModelAndView report() {

	ModelAndView mv = new ModelAndView("revreport");
	//mv.addObject("username", email);
	
	return mv;
}





///////////////////////////loading///////////////////
@RequestMapping(value = "/loading", method = RequestMethod.GET)
public ModelAndView lo() {

	ModelAndView mv = new ModelAndView("load");
	//mv.addObject("username", email);
	
	return mv;
}




///////////////////////////////////////////////////////////////////Edit Account////////////////////////////////////

@RequestMapping(value = "/editacc", method = RequestMethod.GET)
public ModelAndView edi() {

	ModelAndView mv = new ModelAndView("edit");
	//mv.addObject("username", email);
	
	return mv;
}

/////////////////////////////////////////////////
///////////////////


//////////////////////////////////dashboard


@RequestMapping(value = "/dasbo", method = RequestMethod.GET)
public ModelAndView dasbo() {

	ModelAndView mv = new ModelAndView("dashboard2");
	//mv.addObject("username", email);
	
	return mv;
}



/////////////////crpto/////////////////
@RequestMapping(value = "/crypto", method = RequestMethod.GET)
public ModelAndView crypto() {

	ModelAndView mv = new ModelAndView("frombtc");
	//mv.addObject("username", email);
	
	return mv;
}





/////////////////////////////////////////////////////////////sponsered accounts

@RequestMapping(value = "/mysponsoredaccounts", method = RequestMethod.GET)
public ModelAndView sponsored() {

	ModelAndView mv = new ModelAndView("accounts");
	//mv.addObject("username", email);
	
	return mv;
}

//////////////////////////////withdraw
@RequestMapping(value = "/withdrawmoney", method = RequestMethod.GET)
public ModelAndView with() {

	ModelAndView mv = new ModelAndView("withdraw");
	//mv.addObject("username", email);
	
	return mv;
}

////////////////////////////////////card activity

@RequestMapping(value = "/CARDactivity", method = RequestMethod.GET)
public ModelAndView cardacti() {

	ModelAndView mv = new ModelAndView("cardactivity");
	//mv.addObject("username", email);
	
	return mv;
}

///////////////////////////////////////////////////////////////////////////////////multiple transfers/////////////

//////////////////////////multiple payments////////////////
@RequestMapping(value = "/paymulti", method = RequestMethod.GET)
public ModelAndView multipay() {

	ModelAndView mv = new ModelAndView("multipayment");
	//mv.addObject("username", email);
	
	return mv;
}

////////////////////////////////////////////////batch upload/////////////////////
@RequestMapping(value = "/batchupload", method = RequestMethod.GET)
public ModelAndView batchup() {

	ModelAndView mv = new ModelAndView("batchupload");
	//mv.addObject("username", email);
	
	return mv;
}

//////////////////////////////////////////////////////////requests////////////////////
@RequestMapping(value = "/requests", method = RequestMethod.GET)
public ModelAndView req() {

	ModelAndView mv = new ModelAndView("requests");
	//mv.addObject("username", email);
	
	return mv;
}
//////////////////////////////////////////////////
///////////////////      //////////



///////////////////////////////////////////////

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView userlogout() {
		return new ModelAndView("login");

	}

///////////////////////////////////////////////////////////////	

//////////////////////////////////////////////////////////////////////

}
