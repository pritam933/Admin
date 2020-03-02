











	function updateAddressInfo(){
		
		
		

		
		var username = document.getElementById("username").value;
		var updateAddress1 = document.getElementById("address").value;
		var updateAddress2 = document.getElementById("address_2").value;
		var updateCity = document.getElementById("city").value;
		var updateZip = document.getElementById("postal_code").value;
		var updateState = document.getElementById("state").value;
		var updateCountry = document.getElementById("country").value;
		
		var updateBillingAddress1 = document.getElementById("billing_address").value;
		var updateBillingAddress2 = document.getElementById("billing_address_2").value;
		var updateBillingCity = document.getElementById("billing_city").value;
		var updateBillingZip = document.getElementById("billing_postal_code").value;
		var updateBillingState = document.getElementById("billing_state").value;
		var updateBillingCountry = document.getElementById("billing_country").value;
		
		var tempUpdateAddress1 = updateAddress1;	
		var tempUpdateAddress2 = updateAddress2;
		var tempUpdateCity = updateCity;
		var tempUpdateZip = updateZip;
		var tempUpdateState = updateState;
		var tempUpdateCountry = updateCountry;
		
		var tempUpdateBillingAddress1 = updateBillingAddress1;	
		var tempUpdateBillingAddress2 = updateBillingAddress2;
		var tempUpdateBillingCity = updateBillingCity;
		var tempUpdateBillingZip = updateBillingZip;
		var tempUpdateBillingState = updateBillingState;
		var tempUpdateBillingCountry = updateBillingCountry;
		
	//	alert("updateAddress1 is: " + updateAddress1);
		
		
		
		swal({
			  title: "Are you sure?",
			  text: "Once Updated, you will not be able to view the old address",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  
				  
					$.ajax({
					     type : "POST",
					     
					     
					
					     url : "/updateAddressInfo",
					     data : {username:username,updateAddress1:tempUpdateAddress1, updateAddress2:tempUpdateAddress2, updateCity:tempUpdateCity, updateZip:tempUpdateZip, updateState:tempUpdateState, updateCountry:tempUpdateCountry, updateBillingAddress1:tempUpdateBillingAddress1, updateBillingAddress2:tempUpdateBillingAddress2, updateBillingCity:tempUpdateBillingCity, updateBillingZip:tempUpdateBillingZip, updateBillingState:tempUpdateBillingState, updateBillingCountry:tempUpdateBillingCountry},
					     timeout : 100000,
					     async: false,
					     success : function(data) {							    	 
					   
					    	 swal("Address Updated!", {
							      icon: "success",
							    });
					    		 console.log(data); 
					    		
					    		// alert(data);					    		 
					    		 
					    		 },
					     error : function(e) {
					         console.log("ERROR: ", e);
					         display(e);
					     },
					     done : function(e) {
					         console.log("DONE");
					     } 
					     
					 });
				  
				  
				  
				  
				  
				  
				  
				  
			    swal("Address Updated!", {
			      icon: "success",
			    });
			  } else {
			    swal("Address is safe!");
			  }
			});	
	
		
	
		
		
		
		
						
						/*$.ajax({
						     type : "POST",
						     
						     
						
						     url : "/updateAddressInfo",
						     data : {username:username,updateAddress1:tempUpdateAddress1, updateAddress2:tempUpdateAddress2, updateCity:tempUpdateCity, updateZip:tempUpdateZip, updateState:tempUpdateState, updateCountry:tempUpdateCountry, updateBillingAddress1:tempUpdateBillingAddress1, updateBillingAddress2:tempUpdateBillingAddress2, updateBillingCity:tempUpdateBillingCity, updateBillingZip:tempUpdateBillingZip, updateBillingState:tempUpdateBillingState, updateBillingCountry:tempUpdateBillingCountry},
						     timeout : 100000,
						     async: false,
						     success : function(data) {							    	 
						   
								
						    		 console.log(data); 
						    		
						    		// alert(data);					    		 
						    		 
						    		 },
						     error : function(e) {
						         console.log("ERROR: ", e);
						         display(e);
						     },
						     done : function(e) {
						         console.log("DONE");
						     } 
						     
						 });
		*/
		
	}
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	

	function updateProfileInfo(){
		
		var username = document.getElementById("username").value;
		var updatedEmail = document.getElementById("email").value;
		var tempUpdatedEmail = updatedEmail;	
		
		//alert("updatedEmail is: " + updatedEmail);
		
		
		
		
		
		
		
		swal({
			  title: "Are you sure?",
			  text: "Once updated! You will not be able to view the old email!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  
				  
					$.ajax({
					     type : "POST",
					     url : "/updatePersonalInfo",
					     data : {updatedEmail: tempUpdatedEmail, username: username},
					     timeout : 100000,
					     async: false,
					     success : function(data) {							    	 
					   		 
					    	 
					    	 
					    	
					    		 console.log(data); 
					    		
					    		// alert(data);		

					    		 
					    		 },
					     error : function(e) {
					         console.log("ERROR: ", e);
					         display(e);
					     },
					     done : function(e) {
					         console.log("DONE");
					     } 
					    
					     
					 });	
				  
				  
			    swal("Success! Email updated!", {
			      icon: "success",
			    });
			  } else {
			    swal("Email is safe");
			  }
			});
		
		
		
		
		
		
						
												
						
						
						
		
	}