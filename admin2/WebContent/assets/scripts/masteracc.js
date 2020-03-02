			
							window.onload= function accgetmasteracc( ){
								
							var x = document.getElementById("masteracc").options.length;
								var listOptions = document.getElementById("masteracc");
								
								
								if(x>1){									
									
									listOptions.options.length = 1;									
									
								}								
								
								
								
							 
								
							//	var fromAccInfo = document.getElementById("fundExchangeFromAccount").value;							
								var username = document.getElementById("userpk").value;
								var array = new Array();
								
							//	var tempFromAccNo = fromAccInfo;
								//var tempUserEmail = userEmail;
								
								$.ajax({
								     type : "POST",
								     url : "/getaccounts",
								     data : {username:username},
								     timeout : 100000,
								     async: false,
								     success : function(data) {			    	 
							  	    	 
								    	 
								  	  var obj = JSON.parse(data);
									var obj = obj['accounts'];
										
									
									
									  for(var a=0; a<obj.length; a++)
							    		{
							    		var val =obj[a];
							    		
							    		 var toAcc = String(data);
							    		
							    		
									  delete val.currency;
									  delete val.balance;
									  delete val.status_code;
									  delete val.status;
									  delete val.is_valid_for_payment_link;
									
									  
									  
									  //console.log(val.id);
									  var newOption = document.createElement("option");
									  newOption.text = val["id"];
									  newOption.value = val["id"];
									  listOptions.appendChild(newOption);
									  
									  
							    		}
									  
									  
									  
									
										
								    		 //alert(data);
								    	//	 var toAcc = String(data);
								    	//	 var trimToAssString = toAcc.replace(/[&\/\\#+$~%.'":*?<>{}]/g, '');
								    		 //alert(trimToAssString);
								    		 
								    	//	 array = trimToAssString.split(",");
								    		 
								    		 //alert(array.length);
								    		 //alert("array within ajax: " + array);
								    		 
								    		 //var select = document.getElementById("toAccDropdown");
								    		 //var dropdown = document.getElementById("toAccDropdown");							    		â€‹â€‹â€‹
								    		 
								    	},
								     
								      
								     
								 });
								
								var toAccArray = array;		
								
							//	var string=array.toString();
								
								var select = document.getElementById("masteracc");	
								document.getElementById("masteracc").value= " ";
								
							/*	for(var i = 0; i <toAccArray.length; i++){					
									
									var option = document.createElement("OPTION"),
									txt = document.createTextNode(toAccArray[i].replace("[", "").replace("]", ""));
									
									option.appendChild(txt);
									select.insertBefore(option,select.lastChild);
									
								}*/
								
							}
							
							
							
							
							
							function notallowed (){
								
								swal ( "Oops" ,  "Operation Not Allowed!!" ,  "error" )
								
								
							}
							
							
                function notal (){
								
								swal ( "Oops" ,  "You have not added any bank yet!!" ,  "error" )
								
								
							}