


	window.onload=function getadmindetails(  )
{
	
	
	
	
	username= document.getElementById("usernamehidden").value ;
	/*clear  fields  before loading them*/
	
	
	
	
	
	
	/* document.getElementById("username").value ="";
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
     */
	
	
	
	
	
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
						    	
						    	
						    	document.getElementById("firstnamewa").value =obj['first_name'];
						    	document.getElementById("middlenamewa").value =obj['middle_name'];
					    		document.getElementById("lastnamewa").value =obj['last_name'];
					    		  document.getElementById("birthdatedate").value =obj['date_Of_birth'];
					    		  document.getElementById("emailemail").value =obj['email'];
					    		  
					    		  document.getElementById("phonephone").value =obj['cell_phone'];
					    		  document.getElementById("businessnamewa").value =obj['merchant_sponsor'];
					    		  
					    		  
					    		  
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
							     
						  /*  	
						       document.getElementById("accountid").value =obj['id'];
					    		  document.getElementById("userpermissiongroup").value =obj['user_permission_group'];	  	
						        document.getElementById("date").value =obj['date_register'];	
						        
						      
						       document.getElementById("gender").value =obj['gender'];
						   
						        
						        */
						        
						        
						        ////////////////////////hidden inputs/////////////////////////
						    	/* document.getElementById("usernamepk").value =obj['username'];
							    	document.getElementById("fnamepk").value =obj['first_name'];
						    		document.getElementById("lastnamepk").value =obj['last_name'];
							        document.getElementById("countrypk").value =obj['country'];
							        document.getElementById("postalcodepk").value =obj['postal_code'];
							        document.getElementById("aptnopk").value =obj['address'];
							        document.getElementById("citypk").value =obj['city'];
							        document.getElementById("statepk").value =obj['state'];
							        document.getElementById("dobpk").value =obj['date_Of_birth'];
							        
						        */
						        
						        
						        
						        
						    		}		
			
					}
					    
				);
				
			}








function getmyaccounts( )

{
	username= document.getElementById("usernamehidden").value ;
	
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
		    
		    
	         var table =  $('#myTable55');
            
	         
				
	         
	         $('#myTable55').empty()   //clear the table
	         
	         for(var a=0; a<obj.length; a++)
	    		{
	    		var val =obj[a];
	    		
		
			    		

	    		
	    		
	    		var tab='<tr><td>'+a+"\n"+'</td><td id="accountid'+a+'" value="'+val['id']+'" >'+val['id']+"\n"+'</td><td>'
				+val['balance']+"\n"+'</td><td>'+val['currency']+"\n"+'</td><td>'
				 +val['status']+"\n"+'</td></tr>';
	    		
			    		$('#myTable55').append(tab)
			    		}

					

	      
				
	}	
	       
	     }
	
	
	     
	 );
	
	
}


