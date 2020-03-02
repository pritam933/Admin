function getquote( ){
	
	
	/*  document.getElementById("btcamount").value= " ";
	document.getElementById("currencybtc").value= " ";
	document.getElementById("seelingcurrency").value= " " ;

	
	document.getElementById("cagent").value = " ";
	document.getElementById("csubagent").value = " ";
	document.getElementById("cusername").value = " ";
	document.getElementById("cemail").value = " ";*/
//	document.getElementById("text").value = " ";
	
	
	
								
								var tempdamount =  document.getElementById("btcamount").value;
								var tempdcurrency = document.getElementById("currencybtc").value;
								var tempdselling=document.getElementById("seelingcurrency").value ;
			
								
								var tempcagent=document.getElementById("cagent").value ;
								var tempcsubagent=document.getElementById("csubagent").value ;
								var tempcusername=document.getElementById("cusername").value ;
								var tempcemail=document.getElementById("cemail").value ;
								
								
								//  	var tempemail =document.getElementById("seelingcurrency").value ;
							//	document.getElementById("msg").value ="";
								//document.getElementById("amount").value ="";
								
								
								
								
					
										  
										  $.ajax({
											     type : "POST",
											     url : "/loadcrypto",
											     data : {Email:tempcemail,UserName:tempcusername,Agent_Code:tempcagent,Sub_Agent_Code:tempcsubagent,DepositCurrencyCode: tempdcurrency,SellingCurrencyCode:tempdselling, DepositAmount: tempdamount},
											     timeout : 100000,
											     success : function(data) {							    	 
											   		 
											    	/*
											    		 var response = data;
											    	*/	 
											    		 
											    		   var obj = JSON.parse(data);
											    		   
											    		   var obj= obj["ResponseData"];
											    		   
											    		   
											    		   
											    		   swal("Your transaction  is ready .Please Generate the QR  and load BTC"      );
											    		   document.getElementById("text").value =obj['TransactionRequestID'];
											    		  // document.getElementById("text").value = " ";
											    		   document.getElementById("trid").value=obj['TransactionRequestID'];
													    //	var status = obj['ResponseData'];
													    	//document.getElementById("msg").value =status['Message'];
													    	//var status = JSON.parse(status);
													    	
											    		 
											    		
											    		 },
											
											    
											 });
											 
											  
										  
										  
										  
										  
										  
									  
									   
								
								
								
								
								
								
								  
								   
								
							}
							
						
				/*		get status*/	
function getstatus( ){
	
	
	///document.getElementById("text").value = " ";
	
	var tempdamount =  document.getElementById("btcamount").value;
	var tempdcurrency = document.getElementById("currencybtc").value;
	var tempdselling=document.getElementById("seelingcurrency").value ;

	
	var tempcagent=document.getElementById("cagent").value ;
	var tempcsubagent=document.getElementById("csubagent").value ;
	var tempcusername=document.getElementById("cusername").value ;
	var tempcemail=document.getElementById("cemail").value ;
	var tempcid= document.getElementById("trid").value;
	
	
	//  	var tempemail =document.getElementById("seelingcurrency").value ;
//	document.getElementById("msg").value ="";
	//document.getElementById("amount").value ="";
	
	
	
	

			  
			  $.ajax({
				     type : "POST",
				     url : "/cryptostatus",
				     data : {TransactionRequestID:tempcid,Email:tempcemail,UserName:tempcusername,Agent_Code:tempcagent,Sub_Agent_Code:tempcsubagent,DepositCurrencyCode: tempdcurrency,SellingCurrencyCode:tempdselling, DepositAmount: tempdamount},
				     timeout : 100000,
				     success : function(data) {							    	 
				   		 
				    	
				    		// var response = data;
				    		 
				    		 
				    		   var obj = JSON.parse(data);
				    		   
				    		var obj= obj["ResponseData"];

				    		   
				    		swal("Status :"+ " " + obj["TransactionRequestStatus"] + " " + "For Amount :" + " "+ obj["RequestedAmount"] );
				    		//   document.getElementById("text").value =obj['TransactionRequestID'];
								
						    	
						    //	var status = obj['ResponseData'];
						    	//document.getElementById("msg").value =status['Message'];
						    	//var status = JSON.parse(status);
						    
				    		
				    		 },
				
				    
				 });
				 
				  
			  
			  
			  
			  
			  
		  
		   
	
	
	
	
	
	
	  
	   
	
}




       /*crypto history*/


window.onload=function cryptohistory( ){
	var tempcagent=document.getElementById("cagent").value ;
	var tempcsubagent=document.getElementById("csubagent").value ;
	var tempcusername=document.getElementById("cusername").value ;
	var tempcemail=document.getElementById("cemail").value ;
	
//alert(username);
	
//	$('div#demopk').empty();
//	$.ajaxSetup({
//		  // Disable caching of AJAX responses
//		  cache: false
//		});

	$.ajax({
		
	     type : "POST",
	     url : "/cryptohistory",
	     data : {Email:tempcemail,UserName:tempcusername,Agent_Code:tempcagent,Sub_Agent_Code:tempcsubagent},
		     timeout : 100000,
	 
	     success : function(data) {	
		  
		   var obj = JSON.parse(data);
		  //  alert(data);
		    
		    
		    var obj = obj['TransactionList'];
		    
		    
	         var table =  $('#cryptotable');
            
	         
				
	         
	         $('#cryptotable').empty()   //clear the table
	         
	         for(var x=0; x<obj.length; x++)
	    		{
	    		var val =obj[x];
	    		
		
			    		

	    		
	    		
	    		var tab='<tr><td>'+ x +"\n"+'</td><td id="damount'+ x +'" value="'+val['DepositAmountRequested']+'" >'+val['DepositAmountRequested']+"\n"+'</td><td>'
				+val['SourceCurrencyCode']+"\n"+'</td><td>'+val['DateCreate']+"\n"+'</td><td>'
				 
				 +val['TransactionRequestID']+"\n"+'</td><td>'
				 +val['TransactionRequestStatus']+"\n"+'</td></tr>';	
	    		
	    		
			    		$('#cryptotable').append(tab)
			    		}

					

	      
				
	}	
	       
	     }
	
	
	     
	 );
	
	
}







							
							
					
		
							
				