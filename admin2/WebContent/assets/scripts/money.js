
							function transfer( ){
								
								var tempReceiverAcc =  document.getElementById("accnumber").value;
								var tempAmount = document.getElementById("amount").value;
								var tempSenderAccount=document.getElementById("masteracc").value ;
								var tempCurrencyType= document.getElementById("currency").value;
								
								document.getElementById("msg").value ="";
								//document.getElementById("amount").value ="";
								
								
								
								
								swal({
									  title: "Are you sure?",
									  text: "Do you want to transfer?!",
									  icon: "warning",
									  buttons: true,
									  dangerMode: true,
									})
									.then((willDelete) => {
									  if (willDelete) {
										  
										  $.ajax({
											     type : "POST",
											     url : "/senderToReceiverTransfer",
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
											 
											  
										  
										  
										  
										  
										  
									    swal("OOOPSSS!!! Something went wrong.", {
									      icon: "success",
									    });
									  } else {
									    swal("Your imaginary file is safe!");
									  }
									});
								
								
								
								
								
								  
								   
								
							}
							
						
							
							
							
							
		
							
				