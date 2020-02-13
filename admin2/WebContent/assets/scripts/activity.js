




//Fri Mar 16 2018 14:57:52 GMT+0530 (India Standard Time)
var fullDate      = new Date();    //alert(fullDate +'fullDate');
    
//convert month to 2 digits
var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) :(fullDate.getMonth()+1);
var currentDate   = fullDate.getFullYear() + "-" + twoDigitMonth + "-" + fullDate.getDate();    //alert(currentDate+'currentDate');

fullDate.setDate(fullDate.getDate()+1);

// format a date
var tomorrow = fullDate.getFullYear() + '-' + ("0" + (fullDate.getMonth() + 1)).slice(-2) + '-' +fullDate.getDate() ; //alert(tomorrow+'tomorrow');
   
    
$('input[name="daterange"]').daterangepicker(
{
    locale: {
      format: 'YYYY-MM-DD'
    },
    startDate: currentDate,
    endDate: tomorrow
}, 


function  (start, end, label) {
   // alert("A new date range was chosen: " + start.format('DD-MM-YYYY') + ' to ' + end.format('DD-MM-YYYY'));


	   var accountId = document.getElementById("masteracc").value;							
	
///	convert array to string
	   //var startstring=start.toString();
	  // var endstring=end.toString();
	   
	
	   
	   
	   
	   //assign    
	   
	   var tempAccountId = accountId;
		var tempFromDate = "2020-02-01";
		var tempToDate = "2020-02-11";
		
		
	
		
		
//		accountId:tempAccountId,
		$.ajax({
		     type : "POST",
		     url : "/admin2/getactivity",
		     data : {accountId:tempAccountId, fromDate:tempFromDate, toDate:tempToDate},
		     timeout : 100000,
		     async: false,
		     success : function(data) {	
				  
			    	var obj = JSON.parse(data);
			  //  alert(data);
			    
			  // var val= obj;
			    var obj = obj['activity'];
			    
			    
		       var table =  $('#activitytable');
	            
		         
		     //  var obj = JSON.parse(obj['activity']);
		         
		       $('#activitytable').empty()   //clear the table
		         
		         for(var a=0; a<obj.length; a++)
		    		{
		    		var val =obj[a];
		    	
			
				    		
		    		
		    		
		    		
		    		var tab='<tr><td>'+a+"\n"+'</td><td id="transactionid'+a+'" value="'+val['id']+'" >'+val['id']+"\n"+'</td><td>'
					+val['date']+"\n"+'</td><td>'+val['sender']+"\n"+'</td><td>'
					 
					 +val['recipient']+"\n"+'</td><td>'
					 +val['debit']+"\n"+'</td><td>'
					 +val['currency']+"\n"+'</td><td>'
					 +val['description']+"\n"+'</td></tr>';	
		    	   
		    	
		    		
		    		$('#activitytable').append(tab)
		    		
		    		
		    		
		    	/*	
		    		var tab='<tr><td>'+myBooks[i].DepositAmountRequested+"\n"+'</td><td>'+myBooks[i].SourceCurrencyCode+"\n"+'</td><td>'+myBooks[i].DateCreate+"\n"+'</td><td>'
			          +myBooks[i].TransactionRequestID+"\n"+'</td><td>'+myBooks[i].TransactionRequestStatus+"\n"+'</td></tr>';

		    		$('#activitytable').append(tab)*/
				    		}

						

						
					
		     },
	     
		 });	


});     







	
	
	