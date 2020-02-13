
							function transfer( ){
								
								var tempReceiverAcc =  document.getElementById("accnumber").value;
								var tempAmount = document.getElementById("amount").value;
								var tempSenderAccount=document.getElementById("masteracc").value ;
								var tempCurrencyType= document.getElementById("currency").value;
								
								document.getElementById("msg").value ="";
								//document.getElementById("amount").value ="";
								
								 $.ajax({
								     type : "POST",
								     url : "/admin2/senderToReceiverTransfer",
								     data : {senderAcc: tempSenderAccount,beneficiaryAccount:tempReceiverAcc, amount: tempAmount, currencyType:tempCurrencyType},
								     timeout : 100000,
								     success : function(data) {							    	 
								   		 
								    		 var response = data;
								    		 
								    		 
								    		   var obj = JSON.parse(data);
										    	var status = obj['Status'];
										    	document.getElementById("msg").value =status['Message'];
										    	//var status = JSON.parse(status);
										    	
								    		 
								    		
								    		 },
								
								    
								 });
								 
								
								  
								   
								
							}
							
						
							
							
							
							
							function getmasteracc ()  {
								
								
								var userAccountInfo = document.getElementById("senderAccountInfo").value;
								var userAccInfo = String(userAccountInfo);
								var currencyType = userAccInfo.substring(10,13);
								console.log(userAccountInfo);						
								
								document.getElementById("senderAcccurrencyType").value = currencyType;
								
								document.getElementById("recipientEmail").value = "";
								document.getElementById("beneficiaryWalletAcc").value = "";
								
								
								
								
							}
							
							
function getFromAccountInfo( ){
								
								var x = document.getElementById("toAccountDropdown").options.length;
								var listOptions = document.getElementById("toAccountDropdown");
								
								
								if(x>1){									
									
									listOptions.options.length = 1;									
									
								}								
								
								
								/* var y = document.getElementById("toAccDropdown").options.length;
								
								for(var i = 0; i<y; i++){
									
									var opt = document.getElementById("toAccDropdown").options[i].text;
									alert("opt: " + opt);
									
								}
								alert("now option length is: " + y); */
							 
								
								var fromAccInfo = document.getElementById("fundExchangeFromAccount").value;							
								var username = username;
								var array = new Array();
								
							//	var tempFromAccNo = fromAccInfo;
								//var tempUserEmail = userEmail;
								
								$.ajax({
								     type : "POST",
								     url : "/admin2/getToAccInfo",
								     data : {username:username},
								     timeout : 100000,
								     async: false,
								     success : function(data) {			    	 
							  	    	 
								    		 //alert(data);
								    		 var toAcc = String(data);
								    		 var trimToAssString = toAcc.replace(/[&\/\\#+$~%.'":*?<>{}]/g, '');
								    		 //alert(trimToAssString);
								    		 
								    		 array = trimToAssString.split(",");
								    		 
								    		 //alert(array.length);
								    		 //alert("array within ajax: " + array);
								    		 
								    		 //var select = document.getElementById("toAccDropdown");
								    		 //var dropdown = document.getElementById("toAccDropdown");							    		â€‹â€‹â€‹
								    		 
								    	},
								     
								      
								     
								 });
								
								var toAccArray = array;								
								
								var select = document.getElementById("toAccountDropdown");	
								document.getElementById("toAccountDropdown").value= "";
								
								for(var i = 0; i <toAccArray.length; i++){					
									
									var option = document.createElement("OPTION"),
									txt = document.createTextNode(toAccArray[i].replace("[", "").replace("]", ""));
									
									option.appendChild(txt);
									select.insertBefore(option,select.lastChild);
									
								}
								
							}