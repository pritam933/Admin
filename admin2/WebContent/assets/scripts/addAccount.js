function addAccount(){	
	
	var currency = document.getElementById("addAccountCurrency").value;
	var username= document.getElementById("addAccountusername").value;
	var tempCurrency = currency;	
	var tempusername=username;
	
	
					$.ajax({
					     type : "POST",
					     url : "/accountadd",
					     data : {currency: tempCurrency,username:tempusername},
					     timeout : 100000,
					     async: false,
					     success : function(data) {							    	 
					   		 
					    		 console.log(data);
					    		 
					    		 
					    		   var obj = JSON.parse(data);
					    			var status = obj['msg'];
								    
					    		 
					    			
					    			
					    			delete status.msgCode;
					    			delete status;
					    		 swal(status);
					    		 
					    		 
					    		///alert(msg);	
					    		
					    		
					    		
					    		 
					    		 },
					     error : function(e) {
					         console.log("ERROR: ", e);
					         display(e);
					     },
					     done : function(e) {
					         console.log("DONE");
					     } 
					     
					 });								
					
				}