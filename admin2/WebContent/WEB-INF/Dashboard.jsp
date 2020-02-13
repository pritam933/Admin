<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="This is an example dashboard created using build-in elements and components.">
    <meta name="msapplication-tap-highlight" content="no">
  
<link href="assets/css/dashboard.css" rel="stylesheet">
<link href="assets/images/icons/favicon.ico" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">







 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Upload KYC</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="Build whatever layout you need with our Architect framework.">
    <meta name="msapplication-tap-highlight" content="no">
  
    <link href="assets/css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

/* The container must be positioned relative: */
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element: */
}

.select-selected {
  background-color: DodgerBlue;
}

/* Style the arrow inside the select element: */
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
}

/* Style items (options): */
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}
</style>

<script>

var x, i, j, selElmnt, a, b, c;
/* Look for any elements with the class "custom-select": */
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /* For each element, create a new DIV that will act as the selected item: */
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /* For each element, create a new DIV that will contain the option list: */
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /* For each option in the original select element,
    create a new DIV that will act as an option item: */
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /* When an item is clicked, update the original select box,
        and the selected item: */
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
    /* When the select box is clicked, close any other select boxes,
    and open/close the current select box: */
    e.stopPropagation();
    closeAllSelect(this);
    this.nextSibling.classList.toggle("select-hide");
    this.classList.toggle("select-arrow-active");
  });
}

function closeAllSelect(elmnt) {
  /* A function that will close all select boxes in the document,
  except the current select box: */
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}

/* If the user clicks anywhere outside the select box,
then close all select boxes: */
document.addEventListener("click", closeAllSelect);
    </script>
    
    
    <style>
    
    body {
	background-color: #6DC4F4;
}h1 { 
     color:white;
 
}
 
.container {
  width: 80%;
  max-width: 600px;
  margin: 50px auto;
}
 
button.accordion {
  width: 100%;
  background-color: whitesmoke;
  border: none;
  outline: none;
  text-align: left;
  padding: 15px 20px;
  font-size: 18px;
  color: #333;
  cursor: pointer;
  transition: background-color 0.2s linear;
}
 
button.accordion:after {
  content: '\f055';
  font-family: "fontawesome";
  font-size: 14px;
  float: right;
	
}
 
button.accordion.is-open:after {
  content: '\f056';
}
 
button.accordion:hover, button.accordion.is-open {
  background-color: #ddd;
}
 
.accordion-content {
  background-color: white;
  border-left: 1px solid whitesmoke;
  border-right: 1px solid whitesmoke;
  padding: 0 20px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-in-out;
}
    
    </style>
    </head>
    
    
    
    
    
    
    
    
  <!-------------------------------------------------  code body starts  here -------------->
    
    
    
    
<body  onload="AccountsList();">
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <div class="app-header header-shadow">
            <div class="app-header__logo">
                <div class="logo-src"></div>
                <div class="header__pane ml-auto">
                
                
               <!-------------------------------------------  hamburger  button -->
                
                
                    <div>
                        <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="app-header__mobile-menu">
                <div>
                    <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                    </button>
                </div>
            </div>
            
            
            
         <!------------------------------------------    hamburger  ends here ------------------------->
            
            
            
            
            
            
          <!----------------------------------------  header  starts  here ----------------------->
            
            <div class="app-header__menu">
                <span>
                    <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                        <span class="btn-icon-wrapper">
                            <i class="fa fa-ellipsis-v fa-w-6"></i>
                        </span>
                    </button>
                </span>
            </div>    <div class="app-header__content">
                <div class="app-header-left">
                    <div class="search-wrapper">
                        <div class="input-holder">
                            <input type="text" class="search-input" placeholder="Type to search">
                            <button class="search-icon"><span></span></button>
                        </div>
                        <button class="close"></button>
                    </div>
                    
                    
                    
               <!--  add    header menu    here -----------------> 
                    
                   
                 
                       </div>
                       
                       
                       
                      <!---------------  right side of the header --------------------->
                <div class="app-header-right">
                    <div class="header-btn-lg pr-0">
                        <div class="widget-content p-0">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left">
                                    <div class="btn-group">
                                        <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
                                            <img width="42" class="rounded-circle" src="assets/images/avatars/1.jpg" alt="">
                                            <i class="fa fa-angle-down ml-2 opacity-8"> </i>
                                        </a>
                                        <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
                                           <a href="" class="dropdown-item">  <button type="button" tabindex="0" class="dropdown-item">Edit Account</button> </a>
                                            <div tabindex="-1" class="dropdown-divider"></div>
                                          <a href="login.jsp"  class="dropdown-item">  <button type="button" tabindex="0" class="dropdown-item">Log Out</button> </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-content-left  ml-3 header-user-info">
                                    <div class="widget-heading">
                                       
                                        ${UserName_UserID}
                                    </div>
                                    <div class="widget-subheading">
                                       
                                    </div>
                                    
                              
						    
						    
						    
						    
                                </div>
                                <div class="widget-content-right header-user-info ml-3">
                                    
                                         <form method = GET action = "/logout" name="logout">
									
									<input  type="submit" name="logout" class="mb-2 mr-2 btn btn-primary" value="Logout" />
						    </form>
						    
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>        </div>
                    
                   <!---------------  right side  ends here ------------------------->
            </div>
        </div>      
        
        
        
        
        
        
      
        
        
        
        
     <!-------------------------------------   enable if necessary ------------------------->
        
            
        
       <!--  Theme  settings  menu  starts  here -->
        
        
     
 
        
        
        
        
            
     <!-------------------------------------------------    money transfer modal ------------------------------------>
     <div class="modal fade" id="exampleModal" tabindex="-1" 
     role="dialog" aria-labelledby="exampleModalLabel" style="z-index:1088 !important" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fund Transfer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
        
        

        
        
        
          <form class="position-relative form-group"  >
                                            <div class="form-row">
                                              
                                           
                                           
                                           
                                           
                 <div class="col-md-6"> 
                           <label for="exampleCity" class="">Sender Account </label>
                            <input name="sender"  id="masteracc" placeholder="  " type="text" class="form-control"  >  
                            
                       
                            
                            
                            
                        
                             <%-- <label for="exampleCity" class="">Sender Account </label> </br>
                             <div class="col-md-6"> 
                           <select name="fundExchangeFromAccount" id="masteracc" onchange="getFromAccountInfo () ">
																			<option value="">Choose Account</option>
																			<c:forEach var="listValue" items="${accountInfo}">
													
																			<option value="${listValue}">${listValue}</option>
																											
																			</c:forEach>
																		</select>   
																		</div>  --%>           
                                            
                                            
                            <label for="exampleCity" class="">Receiver Account </label>
                            <input name="receiver"  id="accnumber" placeholder=" " type="text" class="form-control"  disabled>  
                                        
                                            
                                             
                            <label for="exampleCity" class="">Currency</label>
                            <input name="currency"  id="currency" placeholder="  " type="text" class="form-control"  disabled>  
                                           
                                            
                                             
                            <label for="exampleCity" class="">Amount</label>
                            <input name="amount"  id="amount" placeholder=" " type="number" class="form-control"  >  
                                            </div>
                                           
                                           
                                           
                                           
                                               
                                            </div>
                                
           	
 
 
  
 
                                        					 <button type="button" class="btn btn-primary mt-4" onclick="transfer()" >Transfer</button>
     
                                            
                          <div class="col-md-13">
                                           <label  for="msg" class="">Message From Server</label>
                            <input name="msg"  id="msg" placeholder="" type="text" class="form-control" readonly  >    
                                            </div>
                                        </form>
                                        
        
        
        
        
        
        
        
            
            
            
            
        
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
                
            </div>
        </div>
    </div>
</div>





<!-- test  money -->







        
        <!-------------------------------------------------    money transfer modal ends here------------------------------------>
        
        
        
        
             <!-------------------------------main  modal ------------------------------------------------>
        <div class="modal fade bd-example-modal-lg" id="exampleModalLongTitle" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div id="exampleModalLongTitle" class="modal-body">
                
                
     <!--  modal body -->    
     
     
     
     
     
   <!-----------------------------------------------   user details  accordion  starts here -->
     
           
                                                  
                     <div class="col-md-12">
                                    <div id="accordion" class="accordion-wrapper mb-3">
                                        <div class="card">
                                            <div id="headingOne" class="card-header">
                                                <button type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne" class="text-centre m-0 p-0 btn btn-link btn-block">
                                                    <h5 class="m-0 p-0">Manage User </h5>
                                                </button>
                                            </div>
                                            <div data-parent="#accordion" id="collapseOne1" aria-labelledby="headingOne" class="collapse show">
                                                <div class="card-body">
                                                
                                                
                                                
                                           
                
                
                
              <!---------------------------   test ------------------------>
                
                
                
                   <!--  test -->
                                          
                                          
                                          
                                           
                                         
                                          
                                             <div class="form-row">
                                                <div class='col-md-3'>
                                                    </div>
                                                    
                                         
                                          <div class="col-md-5">                                          
                                                    
    <label for="exampleCity" class="col-md-5">Username</label><input name="mname"  id="username" placeholder=" " type="text" class="form-control"  disabled>  
                
                      </div>                                                                  
                              
                               <div class="col-md-3">
                                                    <div class="position-relative form-group"><label for="exampleAddress2" class="">First name</label><input name="address2" id="fname" placeholder=" " type="text" class="form-control"  disabled>
                                                    </div>
                                                    </div>
                              
                                                   
                                                    
                                                    
                
                                                     <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group"><label for="exampleCity" class="">Middle Name</label><input name="mname"  id="mname" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div>
                                                <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group"><label for="exampleCity" class="">last Name</label><input name="city"  id="lname" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div>
                                                
                                                 <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group">   <label for="exampleAddress2" class="">Cell Phone</label><input name="address2" id="phone" placeholder=" " type="text" class="form-control"  disabled>
    </div>
                                                </div>

                                                  
                                             
                                                <div class="col-md-2">
                                                    <div class="position-relative form-group"><label for="exampleState" class="">Registration Date</label><input name="state" id="date" type="text" class="form-control" disabled></div>
                                                </div>
                                              
                                                <div class="col-md-3">
                                                    <div class="position-relative form-group"><label for="userpermissiongroup" class="">User Permission Group</label><input name="userpermissiongroup"  id="userpermissiongroup" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div>
                                                
                                            </div> 
                                          
                <!------------------------------ test ----------------------------------->
                
                                           <div  class="col-md-5">
                                           
                                           <label for="email" class="">Email</label><input name="email"  id="email" placeholder=" " type="text" class="form-control" > 
                                         
                                           <div class="form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                            <label class="form-check-label" for="invalidCheck">
                                                Confirm
                                            </label>
                                            <div class="invalid-feedback">
                                                Please Confirm
                                            </div>
                                        </div>
                                    </div>
                                         
                                          <input type="submit" class="mt-2 btn btn-primary"  value="Update Email"> 
                                           </div> 
        
        
        
        
       
        
        
                   
                                                                                           
     
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                         
   <!-----------------------------------------------   user details  accordion  ends here -->
   
   
   
   
   
   
   
    
   <!-----------------------------------------------   address  accordion  starts here ------------->
     
                                       
                                        <!-- address -->
                                          <div class="card">
                                            <div id="headingTwo" class="b-radius-0 card-header">
                                                <button type="button" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="false" aria-controls="collapseTwo" class="text-centre m-0 p-0 btn btn-link btn-block"><h5 class="m-0 p-0">View and Update Address</h5></button>
                                            </div>
                                            <div data-parent="#accordion" id="collapseOne2" class="collapse">
                                                <div class="card-body">
                                                
                                        
                                              <div>                                                             
                                                             
                                                    
                                       <label for="exampleCity" class="col-md-6"><strong>Address Line1</strong></label><input name="mname"  id="address" placeholder=" " type="text" class="form-control"  >  
                                       <label for="exampleAddress2" class="col-md-6"><strong>Address Line2</strong></label><input name="address2" id="address_2" placeholder=" " type="text" class="form-control" >
                                             
                <div class="form-row">
                       
                                           <div class="col-md-3">
                         <div class="position-relative form-group"><label for="exampleCity" class=""><strong>State</strong></label><input name="mname"  id="state" placeholder=" " type="text" class="form-control"  ></div>
                                           </div>
                                                
                                           <div class="col-md-3">
                         <div class="position-relative form-group">
                         <label for="exampleCity" class=""><strong>City</strong></label><input name="city"  id="city" placeholder=" " type="text" class="form-control"  >
                         </div>
                                           </div>
                                           
                                           <div class="col-md-3">
                         <div class="position-relative form-group">
                         <label for="exampleCity" class=""><strong>Postal Code</strong></label><input name="city"  id="postal_code" placeholder=" " type="text" class="form-control"  >
                         </div>
                                           </div>
                                                
                                           <div class="col-md-3">
                         <div class="position-relative form-group"> 
                         <label for="exampleAddress2" class=""><strong>Country</strong></label><input name="address2" id="country" placeholder=" " type="text" class="form-control"  >
                         </div>
                                          </div>
                                                
                                                
              </div> 



                  <!-- billing -->                 
                  
                  
                                       <label for="exampleCity" class="col-md-6"><strong>Billing Address Line1</strong></label><input name="mname"  id="billing_address" placeholder=" " type="text" class="form-control"  >  
                                       <label for="exampleAddress2" class="col-md-6"><strong>Billing Address Line2</strong></label><input name="address2" id="billing_address_2" placeholder=" " type="text" class="form-control" >
                                                  
                                                                                                                                 
                                                        
                                                
                                                
                 <div class="form-row">
                       
                                      
                                              <div class="col-md-3">
                                      <div class="position-relative form-group">
                                      <label for="exampleCity" class=""><strong>Billing State</strong></label><input name="mname"  id="billing_state" placeholder=" " type="text" class="form-control"  >
                                      </div>
                                              
                                              </div>
                                                
                                              <div class="col-md-3">
                                       <div class="position-relative form-grosup">
                                       <label for="exampleCity" class=""><strong>Billing City</strong></label><input name="city"  id="billing_city" placeholder=" " type="text" class="form-control"  >
                                       </div>
                                               
                                              </div>
                                                
                                              <div class="col-md-3">
                                        <div class="position-relative form-group">
                                        <label for="exampleCity" class=""><strong>Billing Postal Code</strong></label><input name="city"  id="billing_postal_code" placeholder=" " type="text" class="form-control"  >
                                        </div>
                                              
                                                </div>
                                                
                                              <div class="col-md-3">
                                         <div class="position-relative form-group">   
                                         <label for="exampleAddress2" class=""><strong> Billing Country</strong></label><input name="address2" id="billing_country" placeholder=" " type="text" class="form-control"  >
                                         </div>
                                                </div>
                                                
                                                
                      </div> 
  <div class="position-relative form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                            <label class="form-check-label" for="invalidCheck">
                                                Confirm
                                            </label>
                                            <div class="invalid-feedback">
                                                Please Confirm
                                            </div>
                                        </div>
                                    </div>
  
                                                <input type="submit" class="mt-2 btn btn-primary"  value="Update Address"> 
                                                
                                                
                                                
                                                 </div>     
                                                
        	                    
                                                
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
      <!-----------------------------------------------   address  accordion  ends here ------------->                                  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
<!-----------------------------------------------   KYC  accordion  starts here ------------->                                 
                                        
                                  
                                        <div class="card">
                                            <div id="headingTwo" class="b-radius-0 card-header">
                                                <button type="button" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="false" aria-controls="collapseTwo" class="text-left m-0 p-0 btn btn-link btn-block"><h5 class="m-0 p-0">KYC</h5></button>
                                            </div>
                                            <div data-parent="#accordion" id="collapseOne2" class="collapse">
                                                <div class="card-body">
                                                
                                                <form class="position-relative form-group"                method=POST   action="/admin2/kycupload" modelAttribute="uploadFiles" enctype="multipart/form-data" ">

                                   <div class="form-row">

                
                        <div class="position-relative form-group"><label for="exampleFile" class="">ID Proof  [Front Side]</label><input name="files" id="fileupload2" type="file" class="form-control-file" required>
                                                        <small class="form-text text-muted">File Type : .jpg,.jpeg,.png,.pdf.  </small>
                                                    </div>




<div class="position-relative form-group"><label for="exampleFile" class="">ID Proof [Back Side]</label><input name="files"       id="fileupload2" type="file" class="form-control-file" required>
    <small class="form-text text-muted">File Type : .jpg,.jpeg,.png,.pdf.  </small>
</div>




                                                     <div class="position-relative form-group"><label for="exampleFile" class="">Proof Of Address</label><input name="files" id="fileupload2" type="file" class="form-control-file" required>
                                                        <small class="form-text text-muted">File Type : .jpg,.jpeg,.png,.pdf.</small>
                                                    </div>



                                       

 
                                           
                                 </div>
                                 
                                   <div class="form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                            <label class="form-check-label" for="invalidCheck">
                                                Confirm
                                            </label>
                                            <div class="invalid-feedback">
                                                Please Confirm
                                            </div>
                                        </div>
                                    </div>
                                 
                                   <input type="submit" class="mt-2 btn btn-primary"  value="Submit"> 
                                           
                                         
                                        </form>
                                                
                                                
                                                </div>
                                            </div>
                                        </div>
                                        
                                   <!-----------------------------------------------   KYC  accordion  ends here ------------->     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                             <!-----------------------------------------------   user accounts  accordion  starts here ------------->            
                                        
                                        
                                        <div class="card">
                                            <div id="headingThree" class="card-header">
                                                <button type="button" data-toggle="collapse" onclick="getuseraccounts();" data-target="#collapseOne3" aria-expanded="false" aria-controls="collapseThree" class="text-left m-0 p-0 btn btn-link btn-block"><h5 class="m-0 p-0">User Accounts 
                                                    </h5></button>
                                            </div>
                                            <div data-parent="#accordion" id="collapseOne3" class="collapse">
                                                <div class="card-body">
                                                
                                                
                                               
                                                 
                                                 
                                                 
                                                    <table class="align-middle mb-0 table table-borderless table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th class="text-center" id="sln">			#           </th>
                                                <th class="text-center" id="accountid"> Account ID 		</th>
                                                
                                                <th class="text-center" id="balance"> Balance   		</th>
                                                <th class="text-center" id="currency"> Currency   		</th>
                                               <th class="text-center" id="status"> Status </th>
              
                                               <th class="text-center" id="transfer"> Money Transfer  		</th> 
                                                 
                                                 
                                                
                                  </tr>
                               </thead>
                                        <tbody id="myTable2">
														 
										</tbody>
							  </table>
                                                 
                                                
                                                </div>
                                            </div>
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                     
                                          
                                        </div>
                                        
                                        
                                        
                                        
                      <!-----------------------------------------------   user accounts  accordion  ends here ------------->                  
                                        
                                        
                                         <div class="card">
                                            <div id="headingTwo" class="b-radius-0 card-header">
                                                <button type="button" data-toggle="" data-target="" aria-expanded="false" aria-controls="collapseTwo" class="text-left m-0 p-0 btn btn-link btn-block"><h5 class="m-0 p-0">User Cards</h5></button>
                                            </div>
                                            <div data-parent="#accordion" id="collapseOne2" class="collapse">
                                                <div class="card-body">
                                                
                                                
                                                    
                                                    
                                                          body   
                                                    
                                                
                                                    <!-- body -->
                                
                                                
                                                
                                                
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                     <!------------------------------------   IBAN Accordion starts-->
                                     
                                     
                                       <div class="card">
                                            <div id="headingTwo" class="b-radius-0 card-header">
                                                <button type="button" data-toggle="" data-target="" aria-expanded="false" aria-controls="collapseTwo" class="text-left m-0 p-0 btn btn-link btn-block"><h5 class="m-0 p-0">IBAN</h5></button>
                                            </div>
                                            <div data-parent="#accordion" id="collapseOne2" class="collapse">
                                                <div class="card-body">
                                                
                                                
                                                    
                                                    
                                                    
                                                          body   
                                                    
                                                    <!-- body -->
                                
                                                
                                                
                                                
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                     <!------------------------------------   IBAN Accordion     ends------------------->
                                        

                                        
                                    </div>
                                </div>                            
           
                </div>
                
                
                
                
                
                
             <!----------------------------------------    modal footer   starts -------------->
                
                
                
                <div class="modal-footer">
                  <!-- <button type="button" class="btn btn-primary">Update User</button> -->
                  <!--   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
                    <!-- <button type="button" class="btn btn-primary">Update Address</button> -->
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!----------------------------------------- modal footer ends------------------------------->
        
        
        
        
       <!-------------------------------main  modal body ends here ------------------------------------------------>  
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      <!-------------------------------------  left side Navigation menu  starts -------------------------------------> 
        
        
          <div class="app-main">
                <div class="app-sidebar sidebar-shadow">
                    <div class="app-header__logo">
                        <div class="logo-src"></div>
                        <div class="header__pane ml-auto">
                            <div>
                                <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="app-header__mobile-menu">
                        <div>
                            <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                    <div class="app-header__menu">
                        <span>
                            <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                                <span class="btn-icon-wrapper">
                                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                                </span>
                            </button>
                        </span>
                    </div>   
                    
                    
                    
                     <div class="scrollbar-sidebar">
                        <div class="app-sidebar__inner">
                            <ul class="vertical-nav-menu">
                                   <li class="app-sidebar__heading">Dashboard</li>
                                    <li>
                                        <a href="#" class="mm-active">
                                            <i class="metismenu-icon fa fa-home"></i>
                                           User Management
                                        </a>
                                    </li>
                                    <!---<li class="app-sidebar__heading">UI Components</li>   --->
                                    <li>
                                       
                                   <li class="app-sidebar__heading">Report</li>
                                   <li>
                                        <a href="#">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Revenue Report
                                        </a>
                                    </li>
                                    <li>
                                        <a href="accactivity.jsp">
                                            <i class="metismenu-icon fa fa-money">
                                            </i>Account Activity
                                        </a>
                                    </li>
                                    
                                      <li>
                                        <a href="#">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>KYC Reports
                                        </a>
                                    </li>
                                   
    
    
                                    <li class="app-sidebar__heading">Queries</li> 
                                     <li>
                                        <a href="https://stylopay.freshdesk.com/support/login">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Raise A Ticket
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>View Ticket Status
                                        </a>
                                    </li>
                                 
     
    
                                    <!-- <li class="app-sidebar__heading">Queries</li> -->
                               
                                  <!--   <li>
                                        <a href="forms-layouts.html">
                                            <i class="metismenu-icon pe-7s-eyedropper">
                                            </i> Account Activities of Agents
                                        </a>
                                    </li>  -->
                                   <!--  <li>
                                        <a href="accountholders.jsp">
                                            <i class="metismenu-icon pe-7s-eyedropper">
                                            </i> Account Holders
                                        </a>
                                    </li>
                                      <li>
                                        <a href="#">
                                            <i class="metismenu-icon pe-7s-eyedropper">
                                            </i>Account's Activity
                                        </a>
                                    </li>
                                       <li>
                                        <a href="a.jsp">
                                            <i class="metismenu-icon pe-7s-eyedropper">
                                            </i>sample page
                                        </a>
                                    </li> -->
                                   <!--  <li>
                                        <a href="forms-layouts.html">
                                            <i class="metismenu-icon pe-7s-eyedropper">
                                            </i> Commisson Of Agents
                                        </a>
                                    </li> -->
                                </ul>
                            </div>
                        </div>
                    </div>  
                    
            
            
            
            
            
            
           <!-------------------------------  left navigation menu ends here ----------------------------------->
            
            
            
            
            
            
        <!-------------------------------------------    Dashboard  main body  starts  here --> 
                    
                      <div class="app-main__outer">
                    <div class="app-main__inner">
                        <div class="app-page-title">
                            <div class="page-title-wrapper">
                                <div class="page-title-heading">
                                    <div class="page-title-icon">
                                        <i class="metismenu-icon fa fa-home">
                                        </i>
                                    </div>
                                    <div>Admin Dashboard
                                        <div class="page-title-subheading">This is an example dashboard                                        </div>
                                    </div>
                                </div>
                                <div class="page-title-actions">
                                    <button type="button" data-toggle="tooltip" title="Example Tooltip" data-placement="bottom" class="btn-shadow mr-3 btn btn-dark">
                                        <i class="fa fa-star"></i>
                                    </button>
                                    <div class="d-inline-block dropdown">
                                        <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn-shadow dropdown-toggle btn btn-info">
                                            <span class="btn-icon-wrapper pr-2 opacity-7">
                                                <i class="fa fa-business-time fa-w-20"></i>
                                            </span>
                                            Buttons
                                        </button>
                                        <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
                                            <ul class="nav flex-column">
                                                <li class="nav-item">
                                                    <a href="javascript:void(0);" class="nav-link">
                                                        <i class="nav-link-icon lnr-inbox"></i>
                                                        <span>
                                                            Inbox
                                                        </span>
                                                        <div class="ml-auto badge badge-pill badge-secondary">86</div>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="javascript:void(0);" class="nav-link">
                                                        <i class="nav-link-icon lnr-book"></i>
                                                        <span>
                                                            Book
                                                        </span>
                                                        <div class="ml-auto badge badge-pill badge-danger">5</div>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="javascript:void(0);" class="nav-link">
                                                        <i class="nav-link-icon lnr-picture"></i>
                                                        <span>
                                                            Picture
                                                        </span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a disabled href="javascript:void(0);" class="nav-link disabled">
                                                        <i class="nav-link-icon lnr-file-empty"></i>
                                                        <span>
                                                            File Disabled
                                                        </span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>    </div>
                        </div>    
                        
                        
                        
                        
                        
                        
                        
                                <div class="row">
                            <div class="col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content bg-midnight-bloom">
                                    <div class="widget-content-wrapper text-white">
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Total Users</div>
                                            <div class="widget-subheading">.</div>
                                        </div>
                                        <div class="widget-content-right">
                                            <div class="widget-numbers text-white"><span>1896</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content bg-arielle-smile">
                                    <div class="widget-content-wrapper text-white">
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Master Account Balance</div>
                                            <div class="widget-subheading">.</div>
                                        </div>
                                        <div class="widget-content-right">
                                            <div class="widget-numbers text-white"><span>$ 9999999</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!--     <div class="col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content bg-grow-early">
                                    <div class="widget-content-wrapper text-white">
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Followers</div>
                                            <div class="widget-subheading">People Interested</div>
                                        </div>
                                        <div class="widget-content-right">
                                            <div class="widget-numbers text-white"><span>90%</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <div class="d-xl-none d-lg-block col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content bg-premium-dark">
                                   <!--  <div class="widget-content-wrapper text-white">
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Products Sold</div>
                                            <div class="widget-subheading">Revenue streams</div>
                                        </div>
                                        <div class="widget-content-right">
                                            <div class="widget-numbers text-warning"><span>$14M</span></div>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    
                    
                    
                    
                    
                    
                    
           <!-------------------------------------  account holders(card holders)  list here ------------------------------------->      
                    
                    
                        <div class="row">

                            
                            <div class="col-md-12">
                                
                                <div class="main-card mb-3 card">
                                    <div class="card-header">Registered Users
                                            <div class="d-block text-center card-footer">
                                                   <!--  <button class="mr-2 btn-icon btn-icon-only btn btn-outline-danger"><i class="pe-7s-trash btn-icon-wrapper"> </i></button> -->
                                                    <button class="btn-wide btn btn-success">Copy</button>
                                                    <button class="btn-wide btn btn-success">Excel</button>
                                                    <button class="btn-wide btn btn-success" >Pdf</button>
                                                    <button class="btn-wide btn btn-success"onclick="printJS({printable: base64, type: 'pdf', base64: true})">Print</button>
                                                </div>
                                        


                                            
                                        <div class="btn-actions-pane-right">


                                            
                                            <div role="group" class="btn-group-sm btn-group">



                                                
                                                <button class="active btn btn-focus">Last Week</button>
                                                <button class="btn btn-focus">All Month</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                  <!--   <p style="color:#000; margin:10px" class="panel-money__title">Account Holders List <button type="submit"  class="mb-2 mr-2 btn btn-primary" id ="accountlist" onclick="AccountsList();this.disabled=true;">View</button></p>	
                                    --> 
                                  <!--   <button type="button" class="dropdown-item" data-toggle="modal" data-target=".bd-example-modal-lg">Details</button> -->
                                        <table class="align-middle mb-0 table table-borderless table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th class="text-center" id="sln">			#           </th>
                                                <th class="text-center" id="username"> User Name 		</th>
                                                
                                                <th class="text-center" id="memberid"> Member ID   		</th>
                                                <th class="text-center" id="emailid"> Email ID    		</th>
                                               <th class="text-center" id="cellphone"> Phone Number</th>
                                               <th class="text-center" id="cellphone"> W2 IDVCheck Status</th> 
                                               <th class="text-center" id="cellphone"> KYC Approval </th> 
                                                <th class="text-center" id="details">  Details    		</th>
                                                 
                                                 
                                                
                                  </tr>
                               </thead>
                                        <tbody id="myTable">
														 
										</tbody>
							  </table>
							  
                                    </div>
                               
                                </div>
                            </div>
                        </div>
                    
                    
                    
                    
                    
                      <!-------------------------------------  account holders(card holders)  list ends here ------------------------------------->   
                    
                    
                    
                        <div class="row">
                       
                            <div class="d-xl-none d-lg-block col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content">
                                    <div class="widget-content-outer">
                                       <!--  <div class="widget-content-wrapper">
                                            <div class="widget-content-left">
                                                <div class="widget-heading">Income</div>
                                                <div class="widget-subheading">Expected totals</div>
                                            </div>
                                            <div class="widget-content-right">
                                                <div class="widget-numbers text-focus">$147</div>
                                            </div>
                                        </div> -->
                                     <!--    <div class="widget-progress-wrapper">
                                            <div class="progress-bar-sm progress-bar-animated-alt progress">
                                                <div class="progress-bar bg-info" role="progressbar" aria-valuenow="54" aria-valuemin="0" aria-valuemax="100" style="width: 54%;"></div>
                                            </div>
                                            <div class="progress-sub-label">
                                                <div class="sub-label-left">Expenses</div>
                                                <div class="sub-label-right">100%</div>
                                            </div>
                                        </div> -->
                                    </div>	
                                </div>
                            </div>
                        </div>
                       
                       
                       
                       
                       <!-- main body -->
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                    <!--   add components here --> 
                        
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       <!-- main body -->
                       
                     

                    </div>
                    
                    
                    
                    
                    
                    
                    
                    <!------------------------------------------ footer  starts here ------------------------->
                                       
                    
                    <div class="app-wrapper-footer">
                        <div class="app-footer">
                            <div class="app-footer__inner">
                                <div class="app-footer-left">
                                    <ul class="nav">
                                        <li class="nav-item">
                                            <a href="https://portal.idvcheck.com/Login.aspx?ReturnUrl=%2fPortal%2fViewApplication.aspx%3fid%3d585459&id=585459" class="nav-link">
                                                IDV
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="https://portal.w2globaldata.com/Account/Login?ReturnUrl=%2Fdashboard%2Fresult%3FcallRef%3DWSCR70629230-8af1-4f3a-afc5-60f6eca4c864" class="nav-link">
                                                W2 Compliance
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="app-footer-right">
                                    <ul class="nav">
                                        <li class="nav-item">
                                            <a href="javascript:void(0);" class="nav-link">
                                                Footer Link 3
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="javascript:void(0);" class="nav-link">
                                                <div class="badge badge-success mr-1 ml-0">
                                                    <small>NEW</small>
                                                </div>
                                                Footer Link 4
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div> 
                    
                    
                    <!------------------- footer  ends ---------------------->
                    
                    
                    
                    
                       </div>
                       
                       
                       
                       
                 
                       
                       
  <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
  
  
  
  
  
  <!-- check  for  div tag  error -->
  
  
  
  
  
  
  
  </div>
  </div>
<script type="text/javascript" src="assets/scripts/dashboard.js"></script></body>
   <script type="text/javascript"> 
    </script> 
                                                    
    <script type="text/javascript" src="assets/scripts/dashboard.js"></script>
     <script type="text/javascript" src="assets/scripts/accountholders.js"></script>
     <script type="text/javascript" src="assets/scripts/jquery.min.js"></script>
     <script type="text/javascript" src="assets/scripts/money.js"></script>
    
     <script>
 
     /** code by webdevtrick ( https://webdevtrick.com ) **/
     var accordions = document.getElementsByClassName("accordion");
      
     for (var i = 0; i < accordions.length; i++) {
       accordions[i].onclick = function() {
         this.classList.toggle('is-open');
      
         var content = this.nextElementSibling;
         if (content.style.maxHeight) {
           // accordion is currently open, so close it
           content.style.maxHeight = null;
         } else {
           // accordion is currently closed, so open it
           content.style.maxHeight = content.scrollHeight + "px";
         }
       }
     }
     
     </script>
     
     <script>
function myFunction() {
  var x = document.getElementById("fileupload2").required;
  document.getElementById("demo").innerHTML = x;
}
</script>
     
     
     
    <%--  <% request.setAttribute("user_details"); 
     %> --%>
</html>
