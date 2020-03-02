

var username;


window.onload=function AccountsList()   {
	
	
	
	if(!window.location.hash) {
        //setting window location
        window.location = window.location + '#loaded';
        //using reload() method to reload web page
        window.location.reload();
    }
	
	
						
	$.ajaxSetup({
		  // Disable caching of AJAX responses
		  cache: false
		});

								$.ajax({
									
								     type : "POST",
								     url : "/AccountList",
//								     data : {Admin_Agent_code:Admin_Agent_code,Admin_Sub_Agent_code:Admin_Sub_Agent_code},
								     timeout : 100000,
								 
								     success : function(data) {	
									  
									    	var obj = JSON.parse(data);
									    
					    		         var table =  $('#myTable');
//					    		         
					    							
					    							for(var i=1; i < obj.length; i++)
										    		{
										    		var val =obj[i];
										    		
									
										    		
										    		var tab='<tr><td>'+i+"\n"+'</td><td id="username'+i+'" value="'+val['UserName_UserID']+'" >'+val['UserName_UserID']+"\n"+'</td><td>'
						    						+val['MemberID']+"\n"+'</td><td>'+val['Email_ID']+"\n"+'</td><td>'
						    						 +val['CellPhone_Mobile']+"\n"+'</td><td>'
						    						 +val['KYC_W2_IDVCheck_Flag_Y']+"\n"+'</td><td>'
						    						 +val['KYC_Status_Approved_Flag_Yes_Y']+"\n"+'</td><td>'+
             "<button type='button' tabindex='0' style='color:white; background-color: #3A6F8D;' class='dropdown-item' id='details' data-toggle='modal' data-target='.bd-example-modal-lg' onclick=populateDetails('"+val['UserName_UserID']+"')  >Details</button> </td></tr>";
										    		 
										    		$('#myTable').append(tab)
										    		
										    		
										    		
										    		}

					    						

					    						
					    					
								}	
								       
								     }
								     
								 );
								
								
							}




function populateDetails(username)
{
	/*clear  fields  before loading them*/
	
	
	
	
	
	
	 document.getElementById("username").value ="";
     document.getElementById("fname").value ="";
		document.getElementById("mname").value ="";
		document.getElementById("lname").value ="";
      document.getElementById("userpermissiongroup").value ="";	  	
      document.getElementById("date").value ="";	
      document.getElementById("phone").value ="";
      document.getElementById("email").value ="";
      document.getElementById("country").value ="";
      document.getElementById("postal_code").value ="";
      document.getElementById("address").value ="";
      document.getElementById("address_2").value ="";
      document.getElementById("city").value ="";
      document.getElementById("state").value ="";
      document.getElementById("billing_address").value ="";
      document.getElementById("billing_address_2").value ="";
      document.getElementById("billing_city").value ="";
      document.getElementById("billing_state").value ="";
      document.getElementById("billing_postal_code").value ="";
      document.getElementById("billing_country").value ="";
     
	
	
	
	
	
      $.ajaxSetup({
		  // Disable caching of AJAX responses
		  cache: false
		   
		});
	
	
/*	call ajax*/
	
					$.ajax({
						
					     type : "POST",
					     url : "/Information",
					     data : {username:username},
					     timeout : 100000,
					     
					     success : function(data) {	
   
					    	 
						    	
						   var obj = JSON.parse(data);
						    	var obj = obj['user_details'];
						    	
						    	
						    	
						    	
						    	 document.getElementById("username").value =obj['username'];
						       // document.getElementById("accountid").value =obj['id'];
					    		document.getElementById("fname").value =obj['first_name'];
					    		document.getElementById("mname").value =obj['middle_name'];
					    		document.getElementById("lname").value =obj['last_name'];
						        document.getElementById("userpermissiongroup").value =obj['user_permission_group'];	  	
						        document.getElementById("date").value =obj['date_register'];	
						        document.getElementById("phone").value =obj['cell_phone'];
						        document.getElementById("email").value =obj['email'];
						       //document.getElementById("gender").value =obj['gender'];
						        document.getElementById("country").value =obj['country'];
						        document.getElementById("postal_code").value =obj['postal_code'];
						        document.getElementById("address").value =obj['address'];
						        document.getElementById("address_2").value =obj['address_2'];
						        document.getElementById("city").value =obj['city'];
						        document.getElementById("state").value =obj['state'];
						        document.getElementById("billing_address").value =obj['billing_address'];
						        document.getElementById("billing_address_2").value =obj['billing_address_2'];
						        document.getElementById("billing_city").value =obj['billing_city'];
						        document.getElementById("billing_state").value =obj['billing_state'];
						        document.getElementById("billing_postal_code").value =obj['billing_postal_code'];
						        document.getElementById("billing_country").value =obj['billing_country'];
						       // document.getElementById("dobpk").value =obj['date_Of_birth'];
						        
						        
						        
						        
						        ////////////////////////hidden inputs/////////////////////////
						    	 document.getElementById("usernamepk").value =obj['username'];
							    	document.getElementById("fnamepk").value =obj['first_name'];
						    		document.getElementById("lastnamepk").value =obj['last_name'];
							        document.getElementById("countrypk").value =obj['country'];
							        document.getElementById("postalcodepk").value =obj['postal_code'];
							        document.getElementById("aptnopk").value =obj['address'];
							        document.getElementById("citypk").value =obj['city'];
							        document.getElementById("statepk").value =obj['state'];
							        document.getElementById("dobpk").value =obj['date_Of_birth'];
							        
						        
						        
						        
						        
						        
						    		}		
			
					}
					    
				);
				
			}



                                       /*  get user accounts*/


function getuseraccounts(username){
	var username=  document.getElementById("username").value;
	
//alert(username);
	
//	$('div#demopk').empty();
//	$.ajaxSetup({
//		  // Disable caching of AJAX responses
//		  cache: false
//		});

	$.ajax({
		
	     type : "POST",
	     url : "/getaccounts",
         data : {username:username},
	     timeout : 100000,
	 
	     success : function(data) {	
		  
		    	var obj = JSON.parse(data);
		  //  alert(data);
		    
		    
		    var obj = obj['accounts'];
		    
		    
	         var table =  $('#myTable2');
            
	         
				
	         
	         $('#myTable2').empty()   //clear the table
	         
	         for(var a=0; a<obj.length; a++)
	    		{
	    		var val =obj[a];
	    		
		
			    		

	    		
	    		
	    		var tab='<tr><td>'+i+"\n"+'</td><td id="accountid'+i+'" value="'+val['id']+'" >'+val['id']+"\n"+'</td><td>'
				+val['balance']+"\n"+'</td><td>'+val['currency']+"\n"+'</td><td>'
				 +val['status']+"\n"+'</td><td>'+
"<button type='button' style='color:white; background-color: #3A6F8D;' class='dropdown-item' data-toggle='modal' data-target='#exampleModal' id='acc'  onclick=accdetails('"+val['id']+"') >Transfer</button> </td></tr>";
	    		
			    		$('#myTable2').append(tab)
			    		}

					

	      
				
	}	
	       
	     }
	
	
	     
	 );
	
	
}







function accdetails(accountid)
{
	  document.getElementById("currency").value = "";
	  document.getElementById("accnumber").value = "";
	
					$.ajax({
						
					     type : "POST",
					     url : "/accountdetails",
					     data : {account:accountid},
					     timeout : 100000,
					 
					     success : function(data) {	

						    	
						    	
						   var obj = JSON.parse(data);
						    	var obj = obj['account_details'];
						    	
						    	
						    	
						    	
						    	
						        document.getElementById("currency").value =obj['currency'];
					   
						        document.getElementById("accnumber").value =obj['account_number'];
								   
						        
						        
						    		}		
			
					}
					    
				);
				
			}






				