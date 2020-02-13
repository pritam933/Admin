function getdetails(){
						
					
								
														var username = document.getElementById("username").value;
														
													
															$.ajax({
																
															     type : "POST",
															     url : "/admin2/Detail",
															   data : {username:username},
															     timeout : 100000,
															     
															     
															     success : function(data) {							    	 
															    
															    		 var obj = JSON.parse(data);
															    		 var obj = obj['user_details'];
															    		 
															    		 
															    		 
															    	
															        document.getElementById("accountid").value =obj['id'];
														    		document.getElementById("fname").value =obj['first_name'];
														    		document.getElementById("mname").value =obj['middle_name'];
														    		document.getElementById("lname").value =obj['last_name'];
															        document.getElementById("userpermissiongroup").value =obj['user_permission_group'];	  	
															        document.getElementById("date").value =obj['date_register'];	
															     
															        document.getElementById("email").value =obj['email'];
															        document.getElementById("gender").value =obj['gender'];
															        document.getElementById("country").value =obj['country'];
															        document.getElementById("postal").value =obj['postal_code'];
															    
															      
															        
															        
															        
															        
														    	
															    		 },
															     error : function(e) {
															         console.log("ERROR: ", e);
														        
															        		 
															     },
															     done : function(e) {
															         console.log("DONE");
															         
															        		
															 
															     } 
															     
															 });
															
															
														}












