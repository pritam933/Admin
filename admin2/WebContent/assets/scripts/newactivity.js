	
	$( document ).ready(function() {
	    $("#from-datepicker").datepicker({ 
	        format: 'yyyy-mm-dd'
	    });
	    $("#from-datepicker").on("change", function () {
	        var fromdate = $(this).val();
	        alert(fromdate);
	    });
	}); 







	$( document ).ready(function() {
	    $("#end-datepicker").datepicker({ 
	        format: 'yyyy-mm-dd'
	    });
	    $("#end-datepicker").on("change", function () {
	        var enddate = $(this).val();
	        alert(enddate);
	    });
	}); 










	
function date ()  {


	var x= document.getElementById("from-datepicker").value;

	var y= document.getElementById("end-datepicker").value;	
}


