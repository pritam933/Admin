package com.stylopay.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

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
	private String msg;
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

			ModelAndView andView = new ModelAndView("dashboard2");
			
			
             UserName_UserID  =	jsonreponse1.get("UserName_UserID").toString();
			httpSession.setAttribute("UserName_UserID", UserName_UserID);
			
			Client_Agent_SubAgent_Name=jsonreponse1.get("Client_Agent_SubAgent_Name").toString();
			
			httpSession.setAttribute("Client_Agent_SubAgent_Name", Client_Agent_SubAgent_Name);
			
			
			
			Email_ID=jsonreponse1.get("Email_ID").toString();
			httpSession.setAttribute("Email_ID", Email_ID);
			AccountId1=jsonreponse1.get("AccountId").toString();
			httpSession.setAttribute("AccountId", AccountId1);
			
			adminagent=jsonreponse1.get("Admin_Agent_code").toString();
			httpSession.setAttribute("Admin_Agent_code", adminagent);
			
			

			loginbean.setEmail(loginbean.getEmail());
			loginbean.setPass(loginbean.getPass());
			
	 	
		

			return new ModelAndView("dashboard2");
		} else {
			return new ModelAndView("ulogin");
		}

	}

	private ModelAndView dashboard(Loginutil login, Model model) {
		return new ModelAndView("Dashboard");
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

			msg = "Agent Code Required!";

		} else {
			Accountholderlist getcardholdersAPI = new Accountholderlist();
			JSONObject jsonResponse = new JSONObject();
			String response = getcardholdersAPI.getcardholdersAPI(admin_Agent_code, admin_Sub_Agent_code);

			if (response.contains("OK")) {

				JSONObject jsonResponse1 = new JSONObject(response);
				userData = jsonResponse1.get("user_data").toString();
				cardholders=jsonResponse1.get("TotalCardHolder").toString();
				
				
				
				ModelAndView mv = new ModelAndView("dashboard2");
			
			httpSession.setAttribute("cardholders", cardholders);
			
			
				
	


			} 

		}
		return userData.toString();
		
	}

	/////////////////////////////////////////////////////// details////////////////////////////////////////

	@RequestMapping(value = "/Detail", method = RequestMethod.POST)
	@ResponseBody
	public String userdetails(@RequestParam("username") String username, Detailsbean Detailsbean,
			HttpServletRequest request, Model model) throws Exception {

		System.out.println("username is: " + username);

		Details Details = new Details();
		String response = Details.details(username);

		ModelAndView andView = new ModelAndView("kycupload");
		andView.addObject("id", "");

		return response;
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
		List<String> fileNames = new ArrayList<String>();
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

		} else {
                     
		}
		
		
	
		
		// Calling IDVCheck APIIIIIIIIIIIIIIIIIIIIII	
		

			
			
 	 	IDVCheckAPI idvCheckAPI = new IDVCheckAPI();
 	 	
 	 	String idvCheckResponse = idvCheckAPI.kycIdvChcking(docUId, 
 	 			isoCountryCode, birthDate, firstname, aptNo, city, state, postcode, lastName,username);
 	 	
 	 	System.out.println("D response is: " + idvCheckResponse);
		return null;
 	 	


	}

//////////////////////////////////////////////////////////////details button username populate//////////////////
	@RequestMapping(value = "/Information", method = RequestMethod.POST)
	@ResponseBody
	public String  userdetails(@RequestParam("username") String username, HttpServletRequest request, Model model)
			throws Exception {

		
		

		 Details Details = new Details();
		 
			//JSONObject jsonResponse123 = new JSONObject();
		 String response = Details.details(username);
		 
		 
		/*
		 * detailsbean.setUsername(request.getParameter("username"));
		 * /////////////////////////////////////////////////////////////
		 * detailsbean.setCountry(request.getParameter("country"));
		 * detailsbean.setAptNo(request.getParameter("address"));
		 * detailsbean.setCity(request.getParameter("city"));
		 * detailsbean.setLname(request.getParameter("last_name"));
		 * detailsbean.setFname(request.getParameter("first_name"));
		 * detailsbean.setState(request.getParameter("state"));
		 * detailsbean.setPostcode(request.getParameter("postal_code"));
		 * 
		 */    
	        
        
		return response;
	}

	/////////////////////////////////////// get user
	/////////////////////////////////////// accounts//////////////////////////

	@RequestMapping(value = "/getaccounts", method = RequestMethod.POST)

	@ResponseBody
	public String GetUserAccounts(@ModelAttribute("acounts") Detailsbean Detailsbean, HttpServletRequest request,
			Model model, String username) throws SQLException, JSONException {
		//String accounts1 = null;

		GetUserAccounts accountDetails = new GetUserAccounts();
		JSONObject userAccountTypes = new JSONObject();
		String response = accountDetails.accountDetails(username);

		if (response.contains("success")) {

			JSONObject jsonResponse2 = new JSONObject(response);
		//	accounts1 = jsonResponse2.get("accounts").toString();

		} else {
			msg = "Some internal error occurs there!";

		}

		return response;
	}

	///////////////////////////////////////////////////// get account
	///////////////////////////////////////////////////// details//////////////////////////////

	@RequestMapping(value = "/accountdetails", method = RequestMethod.POST)
	@ResponseBody
	public String accountdetails1(@RequestParam("account") String account, HttpServletRequest request, Model model)
			throws Exception {

		GetAccountDetails GetAccountDetails = new GetAccountDetails();
		String response = GetAccountDetails.accountdetails1(account);

		return response;
	}

////////////////////////////////////////////////////////////money  transfer//////////////////
	@RequestMapping(value = "/senderToReceiverTransfer", method = RequestMethod.POST)
	@ResponseBody
	public String senderToReceiverTransfer(@RequestParam("senderAcc") String senderAcc,

			@RequestParam("beneficiaryAccount") String beneficiaryAccount, @RequestParam("amount") String amount,
			@RequestParam("currencyType") String currencyType, HttpServletRequest request,
			MoneyTransferToAnotherAccBean MoneyTransferToAnotherAccBean, Model Model)
			throws JSONException, JSONException {

		String senderAccount = senderAcc;
     	String beneficiaryAcc = beneficiaryAccount;
     

		String transferAmount = amount;
		String currency = currencyType;

		 MoneyTransferToAnotherAcc MoneyTransferToAnotherAcc = new  MoneyTransferToAnotherAcc();
		 String response = MoneyTransferToAnotherAcc.fundTransferAnotherUser(senderAccount, beneficiaryAcc, transferAmount, currency);

	
		return response;
	}

/////////////////////////////////////////////////////////////////////////////////////////////////	
	
	////////////////////////////////////////get  activity//////////////////////
	@RequestMapping(value = "/getactivity", method = RequestMethod.POST)
	 @ResponseBody 
	 public String getTransactionListDetails(@RequestParam("accountId") String accountId,
			  
			  @RequestParam("fromDate") String fromDate, @RequestParam("toDate") String
			  toDate, Model Model,TransactionActivitiesBean TransactionActivitiesBean, HttpServletRequest request) throws JSONException {

		GetAccountActivityAPI GetAccountActivityAPI = new GetAccountActivityAPI();
		String response = GetAccountActivityAPI.getTransactionActivityDetails(accountId,fromDate,toDate);

		return response;
	}	
	
/////////////////////////////////////////////////////////	
	
	

/////////////////////////////////logout///////////////////////

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView userlogout() {
		return new ModelAndView("login");

	}

///////////////////////////////////////////////////////////////	

//////////////////////////////////////////////////////////////////////

}
