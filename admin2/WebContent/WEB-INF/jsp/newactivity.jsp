
<%@page import="com.stylopay.controller.AdminController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Configurable Dropdown Date Picker Example</title>
<script   src="https://code.jquery.com/jquery-2.2.3.min.js"   integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker3.min.css">
	<script>
	$( document ).ready(function() {
	    $("#from-datepicker").datepicker({ 
	        format: 'yyyy-mm-dd'
	    });
	    $("#from-datepicker").on("change", function () {
	        var fromdate = $(this).val();
	        alert(fromdate);
	    });
	}); 


	</script>





	<script>
	$( document ).ready(function() {
	    $("#end-datepicker").datepicker({ 
	        format: 'yyyy-mm-dd'
	    });
	    $("#end-datepicker").on("change", function () {
	        var enddate = $(this).val();
	        alert(enddate);
	    });
	}); 







	</script>


<script type="text/javascript">
	
function date ()  {


	var x= document.getElementById("from-datepicker").value;

	var y= document.getElementById("end-datepicker").value;	
}


</script>
<link rel="stylesheet" type="text/css" href="assets/css/dashboard.css">

 <script type="text/javascript" src="assets/scripts/dashboard.js"></script>
 <script type="text/javascript" src="assets/scripts/masteracc.js"></script>
  <script type="text/javascript" src="assets/scripts/newactivity.js"></script>
</head>




<body  onload="accgetmasteracc();" >
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <div class="app-header header-shadow">
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
            </div>    <div class="app-header__content">
                <div class="app-header-left">
                    <div class="search-wrapper">
                        <div class="input-holder">
                            <input type="text" class="search-input" placeholder="Type to search">
                            <button class="search-icon"><span></span></button>
                        </div>
                        <button class="close"></button>
                    </div>
                    <ul class="header-menu nav">
                        <li class="nav-item">
                            <a href="javascript:void(0);" class="nav-link">
                                <i class="nav-link-icon fa fa-database"> </i>
                                Statistics
                            </a>
                        </li>
                        <li class="btn-group nav-item">
                            <a href="javascript:void(0);" class="nav-link">
                                <i class="nav-link-icon fa fa-edit"></i>
                                Projects
                            </a>
                        </li>
                        <li class="dropdown nav-item">
                            <a href="javascript:void(0);" class="nav-link">
                                <i class="nav-link-icon fa fa-cog"></i>
                                Settings
                            </a>
                        </li>
                    </ul>        </div>
             <div class="app-header-right">
                    <div class="header-btn-lg pr-0">
                        <div class="widget-content p-0">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left">
                                    <div class="btn-group">
                                        <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
                                            <img width="42" class="rounded-circle" src="assets/images/avatars/1.jpg" alt="">
                                            <i class="fa fa-angle-down ml-2 opacity-8"></i>
                                        </a>
                                        <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
                                             <a class="dropdown-item" href="/editacc">
                                            <button type="button" tabindex="0" class="dropdown-item">My Profile</button>
                                            </a>
                                           <div tabindex="-1" class="dropdown-divider"></div>
                                           <a class="dropdown-item" href="/logout">
                                            <button type="button" tabindex="0" class="dropdown-item">Log Out</button>
                                    		</a>                   
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-content-left  ml-3 header-user-info">
                                    <div class="widget-heading">
                                       <c:out value="${UserName_UserID}"> </c:out>
                                    </div>
                                    <div class="widget-subheading">
                                      <c:out value="${Email_ID}"></c:out>
                                    </div>
                                </div>
                                <div class="widget-content-right header-user-info ml-3">
                                    <button type="button" class="btn-shadow p-1 btn btn-primary btn-sm show-toastr-example">
                                        <i class="fa text-white fa-calendar pr-1 pl-1"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>        </div>
            </div>
        </div>   
        
        
        
        
          <div class="ui-theme-settings">
            <button type="button" id="TooltipDemo" class="btn-open-options btn btn-warning">
                <i class="fa fa-cog fa-w-16 fa-spin fa-2x"></i>
            </button>
            <div class="theme-settings__inner">
                <div class="scrollbar-container">
                    <div class="theme-settings__options-wrapper">
                        <h3 class="themeoptions-heading">Layout Options
                        </h3>
                        <div class="p-3">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="widget-content p-0">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left mr-3">
                                                <div class="switch has-switch switch-container-class" data-class="fixed-header">
                                                    <div class="switch-animate switch-on">
                                                        <input type="checkbox" checked data-toggle="toggle" data-onstyle="success">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="widget-content-left">
                                                <div class="widget-heading">Fixed Header
                                                </div>
                                                <div class="widget-subheading">Makes the header top fixed, always visible!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="widget-content p-0">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left mr-3">
                                                <div class="switch has-switch switch-container-class" data-class="fixed-sidebar">
                                                    <div class="switch-animate switch-on">
                                                        <input type="checkbox" checked data-toggle="toggle" data-onstyle="success">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="widget-content-left">
                                                <div class="widget-heading">Fixed Sidebar
                                                </div>
                                                <div class="widget-subheading">Makes the sidebar left fixed, always visible!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="widget-content p-0">
                                        <div class="widget-content-wrapper">
                                            <div class="widget-content-left mr-3">
                                                <div class="switch has-switch switch-container-class" data-class="fixed-footer">
                                                    <div class="switch-animate switch-off">
                                                        <input type="checkbox" data-toggle="toggle" data-onstyle="success">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="widget-content-left">
                                                <div class="widget-heading">Fixed Footer
                                                </div>
                                                <div class="widget-subheading">Makes the app footer bottom fixed, always visible!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <h3 class="themeoptions-heading">
                            <div>
                                Header Options
                            </div>
                            <button type="button" class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-header-cs-class" data-class="">
                                Restore Default
                            </button>
                        </h3>
                        <div class="p-3">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <h5 class="pb-2">Choose Color Scheme
                                    </h5>
                                    <div class="theme-settings-swatches">
                                        <div class="swatch-holder bg-primary switch-header-cs-class" data-class="bg-primary header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-secondary switch-header-cs-class" data-class="bg-secondary header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-success switch-header-cs-class" data-class="bg-success header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-info switch-header-cs-class" data-class="bg-info header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-warning switch-header-cs-class" data-class="bg-warning header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-danger switch-header-cs-class" data-class="bg-danger header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-light switch-header-cs-class" data-class="bg-light header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-dark switch-header-cs-class" data-class="bg-dark header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-focus switch-header-cs-class" data-class="bg-focus header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-alternate switch-header-cs-class" data-class="bg-alternate header-text-light">
                                        </div>
                                        <div class="divider">
                                        </div>
                                        <div class="swatch-holder bg-vicious-stance switch-header-cs-class" data-class="bg-vicious-stance header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-midnight-bloom switch-header-cs-class" data-class="bg-midnight-bloom header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-night-sky switch-header-cs-class" data-class="bg-night-sky header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-slick-carbon switch-header-cs-class" data-class="bg-slick-carbon header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-asteroid switch-header-cs-class" data-class="bg-asteroid header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-royal switch-header-cs-class" data-class="bg-royal header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-warm-flame switch-header-cs-class" data-class="bg-warm-flame header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-night-fade switch-header-cs-class" data-class="bg-night-fade header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-sunny-morning switch-header-cs-class" data-class="bg-sunny-morning header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-tempting-azure switch-header-cs-class" data-class="bg-tempting-azure header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-amy-crisp switch-header-cs-class" data-class="bg-amy-crisp header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-heavy-rain switch-header-cs-class" data-class="bg-heavy-rain header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-mean-fruit switch-header-cs-class" data-class="bg-mean-fruit header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-malibu-beach switch-header-cs-class" data-class="bg-malibu-beach header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-deep-blue switch-header-cs-class" data-class="bg-deep-blue header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-ripe-malin switch-header-cs-class" data-class="bg-ripe-malin header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-arielle-smile switch-header-cs-class" data-class="bg-arielle-smile header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-plum-plate switch-header-cs-class" data-class="bg-plum-plate header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-happy-fisher switch-header-cs-class" data-class="bg-happy-fisher header-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-happy-itmeo switch-header-cs-class" data-class="bg-happy-itmeo header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-mixed-hopes switch-header-cs-class" data-class="bg-mixed-hopes header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-strong-bliss switch-header-cs-class" data-class="bg-strong-bliss header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-grow-early switch-header-cs-class" data-class="bg-grow-early header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-love-kiss switch-header-cs-class" data-class="bg-love-kiss header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-premium-dark switch-header-cs-class" data-class="bg-premium-dark header-text-light">
                                        </div>
                                        <div class="swatch-holder bg-happy-green switch-header-cs-class" data-class="bg-happy-green header-text-light">
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <h3 class="themeoptions-heading">
                            <div>Sidebar Options</div>
                            <button type="button" class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-sidebar-cs-class" data-class="">
                                Restore Default
                            </button>
                        </h3>
                        <div class="p-3">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <h5 class="pb-2">Choose Color Scheme
                                    </h5>
                                    <div class="theme-settings-swatches">
                                        <div class="swatch-holder bg-primary switch-sidebar-cs-class" data-class="bg-primary sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-secondary switch-sidebar-cs-class" data-class="bg-secondary sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-success switch-sidebar-cs-class" data-class="bg-success sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-info switch-sidebar-cs-class" data-class="bg-info sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-warning switch-sidebar-cs-class" data-class="bg-warning sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-danger switch-sidebar-cs-class" data-class="bg-danger sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-light switch-sidebar-cs-class" data-class="bg-light sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-dark switch-sidebar-cs-class" data-class="bg-dark sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-focus switch-sidebar-cs-class" data-class="bg-focus sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-alternate switch-sidebar-cs-class" data-class="bg-alternate sidebar-text-light">
                                        </div>
                                        <div class="divider">
                                        </div>
                                        <div class="swatch-holder bg-vicious-stance switch-sidebar-cs-class" data-class="bg-vicious-stance sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-midnight-bloom switch-sidebar-cs-class" data-class="bg-midnight-bloom sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-night-sky switch-sidebar-cs-class" data-class="bg-night-sky sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-slick-carbon switch-sidebar-cs-class" data-class="bg-slick-carbon sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-asteroid switch-sidebar-cs-class" data-class="bg-asteroid sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-royal switch-sidebar-cs-class" data-class="bg-royal sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-warm-flame switch-sidebar-cs-class" data-class="bg-warm-flame sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-night-fade switch-sidebar-cs-class" data-class="bg-night-fade sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-sunny-morning switch-sidebar-cs-class" data-class="bg-sunny-morning sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-tempting-azure switch-sidebar-cs-class" data-class="bg-tempting-azure sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-amy-crisp switch-sidebar-cs-class" data-class="bg-amy-crisp sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-heavy-rain switch-sidebar-cs-class" data-class="bg-heavy-rain sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-mean-fruit switch-sidebar-cs-class" data-class="bg-mean-fruit sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-malibu-beach switch-sidebar-cs-class" data-class="bg-malibu-beach sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-deep-blue switch-sidebar-cs-class" data-class="bg-deep-blue sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-ripe-malin switch-sidebar-cs-class" data-class="bg-ripe-malin sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-arielle-smile switch-sidebar-cs-class" data-class="bg-arielle-smile sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-plum-plate switch-sidebar-cs-class" data-class="bg-plum-plate sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-happy-fisher switch-sidebar-cs-class" data-class="bg-happy-fisher sidebar-text-dark">
                                        </div>
                                        <div class="swatch-holder bg-happy-itmeo switch-sidebar-cs-class" data-class="bg-happy-itmeo sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-mixed-hopes switch-sidebar-cs-class" data-class="bg-mixed-hopes sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-strong-bliss switch-sidebar-cs-class" data-class="bg-strong-bliss sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-grow-early switch-sidebar-cs-class" data-class="bg-grow-early sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-love-kiss switch-sidebar-cs-class" data-class="bg-love-kiss sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-premium-dark switch-sidebar-cs-class" data-class="bg-premium-dark sidebar-text-light">
                                        </div>
                                        <div class="swatch-holder bg-happy-green switch-sidebar-cs-class" data-class="bg-happy-green sidebar-text-light">
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <h3 class="themeoptions-heading">
                            <div>Main Content Options</div>
                            <button type="button" class="btn-pill btn-shadow btn-wide ml-auto active btn btn-focus btn-sm">Restore Default
                            </button>
                        </h3>
                        <div class="p-3">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <h5 class="pb-2">Page Section Tabs
                                    </h5>
                                    <div class="theme-settings-swatches">
                                        <div role="group" class="mt-2 btn-group">
                                            <button type="button" class="btn-wide btn-shadow btn-primary btn btn-secondary switch-theme-class" data-class="body-tabs-line">
                                                Line
                                            </button>
                                            <button type="button" class="btn-wide btn-shadow btn-primary active btn btn-secondary switch-theme-class" data-class="body-tabs-shadow">
                                                Shadow
                                            </button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>        <div class="app-main">
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
                                        <a href="/dasbo" class="mm-active">
                                            <i class="metismenu-icon fa fa-home"></i>
                                           User Management
                                        </a>
                                    </li>
                                    <!---<li class="app-sidebar__heading">UI Components</li>   --->
                                      <li class="app-sidebar__heading">Sponsored Accounts</li>
                                   <li>
                                        <a href="/mysponsoredaccounts">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>My Sponsored Accounts
                                        </a>
                                    </li>
                                       
                                   <li class="app-sidebar__heading">Report</li>
                                   <li>
                                        <a href="/report">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Revenue Report
                                        </a>
                                    </li>
                                     <li>
                                        <a href="#">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>KYC Reports
                                        </a>
                                    </li>
                                    
                                    
                                    
                                    <li class="app-sidebar__heading">Activities</li>
                                    <li>
                                        <a href="#">
                                            <i class="metismenu-icon fa fa-money">
                                            </i>Account Activity
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/CARDactivity">
                                            <i class="metismenu-icon fa fa-money">
                                            </i>Card Activity
                                        </a>
                                    </li>
                                    
                                     
                                   
                                <li class="app-sidebar__heading">Load</li> 
                                     <li>
                                        <a href="/loading">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Load Funds
                                        </a>
                                    </li>
                                   
                                   <li class="app-sidebar__heading">Withdraw</li> 
                                     <li>
                                        <a href="/withdrawmoney">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Withdraw Funds
                                        </a>
                                    </li> 
                                    
                                    
                                     <li class="app-sidebar__heading">Multiple Transfer</li> 
                                     <li>
                                        <a href="/paymulti">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Multiple Payments
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/batchupload">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Batch Upload
                                        </a>
                                    </li>  
                                    
                                  <!--   <li>
                                        <a href="/requests">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Requests
                                        </a>
                                    </li>  -->
    
                                    <li class="app-sidebar__heading">Queries</li> 
                                     <li>
                                        <a href="https://stylopay.freshdesk.com/support/login">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>Raise A Ticket
                                        </a>
                                    </li>
                                <!--     <li>
                                        <a href="#">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>View Ticket Status
                                        </a>
                                    </li> -->
                                 
     
    
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
                    <div class="app-main__outer">
                    <div class="app-main__inner">
                        <div class="app-page-title">
                            <div class="page-title-wrapper">
                                <div class="page-title-heading">
                                    <div class="page-title-icon">
                                        <i class="metismenu-icon fa fa-clipboard">
                                        </i>
                                    </div>
                                    <div>     <c:out value="${Client_Agent_SubAgent_Name}">  </c:out>  's Activity
                                        <div class="page-title-subheading"> Welcome    # <c:out value="${UserName_UserID}"></c:out>
                                        </div>
                                    </div>
                                </div>
                              </div>
                        </div>   
                        
                        
                        
                        
                    <!--   before  table -->
                    
                            <div class="row">
                         
                            <div class="col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content bg-arielle-smile">
                                    <div class="widget-content-wrapper text-white">
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Admin Account ID</div>
                                            <div class="widget-subheading">.</div>
                                        </div>
                                        <div class="widget-content-right">
                                            <div class="widget-numbers text-white"><span> <c:out value="${AccountId}"></c:out>  </span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <div class="col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content bg-grow-early">
                                    <div class="widget-content-wrapper text-white">
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Admin Agent Code</div>
                                            <div class="widget-subheading">.</div>
                                        </div>
                                        <div class="widget-content-right">
                                            <div class="widget-numbers text-white"><span> <c:out value="${Admin_Agent_code}"></c:out> </span></div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
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
                    
                        
                        
                        
                         <div class="tab-content">
                            <div class="tab-pane tabs-animation fade show active" id="tab-content-0" role="tabpanel">
                                <div class="main-card mb-3 card">
                                    <div class="card-body"> <!---<h5 class="card-title">Rows</h5>--->
                                         <form class=""   method=POST   action=" " >
                                                
                                            <!-- form body 1 -->
                                            
                  
                                               <div class="row">

                            
                            <div class="col-md-12">
                                
                                <div class="main-card mb-3 card">
                                    <div class="card-header">  Account Activity
                                            <div class="d-block text-center card-footer">
                                            
                                            
                               <%--   <c:out value="${UserName_UserID}"> </c:out>            
                                 --%>              
                                       <%--      
                                            <input name="username"    id="userpk" value=" <c:out value="${UserName_UserID}"> </c:out>  "  type="hidden"  > 
                                            
                                             <label class="mb-2 mr-2 badge badge-primary" for="exampleCustomSelect" class="">Choose Account</label>  
                                    <select name="userAccountDetails" placeholder="select account" id="masteracc" name="senderAccountNo" required>
												   									<!--  <option value="">Select Wallet Account</option> -->
												   									
												   							<!-- 	<option value="">Select</option>
																			 -->		<c:forEach var="listValue" items="${accountInfo}">
													
																					<option value="${listValue}">${listValue}</option>
																											
																					</c:forEach>
												
										
										
										
										
																				</select>  --%>
                                            
                                                   
                                                
                                                          </div>
                                        

<!--     <label class="mb-2 mr-2 badge badge-primary" for="exampleCustomSelect" class="">Choose Date Range </label>
                        <input type="text" placeholder="Click Here"name="daterange" value="" style="width:30%"/> -->
                                            
                                        <div class="btn-actions-pane-right">

       <a id="downloadLink" class="btn-wide btn btn-success" onclick="exportF(this)">Export to excel</a>
                                             
                                          
                                            
                                            <div role="group" class="btn-group-sm btn-group">


                                                
                                              
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-row">
                                    
                                         
                                            <input name="username"    id="userpk" value=" <c:out value="${UserName_UserID}"> </c:out>  "  type="hidden"  > 
                                            
                                             <label class="mb-2 mr-2 badge badge-primary" for="exampleCustomSelect" class="">Choose Account</label>  
                                    <select name="userAccountDetails" placeholder="select account" id="masteracc" name="senderAccountNo" required>
												   									<!--  <option value="">Select Wallet Account</option> -->
												   									
												   							<!-- 	<option value="">Select</option>
																			 -->		<c:forEach var="listValue" items="${accountInfo}">
													
																					<option value="${listValue}">${listValue}</option>
																											
																					</c:forEach>
												
										
										
										
										
																				</select> 
                                    
                                <label class="mb-2 mr-2 badge badge-primary" for="exampleCustomSelect" class="">Choose Start Date </label>
          
                             <input  placeholder="start" type="text" id="from-datepicker"/>
                                <label class="mb-2 mr-2 badge badge-primary" for="exampleCustomSelect" class="">Choose End Date </label>
   
<input  placeholder="end" type="text" id="end-datepicker"/>
<button type="button" onclick="date()"> View   </button>
                                   
                                   </div>
                                    <div class="table-responsive">
                                      
                                   
                                      <table id="table" border="1" class="mb-0 table table-bordered" ><caption></caption>
                                            <thead>
                                            <tr>
                                                <th class="text-center" id="sln">			#           </th>
                                                <th class="text-center" id="transactionid"> Transaction ID		</th>
                                                
                                                <th class="text-center" id="date">  	Date	</th>
                                                <th class="text-center" id="sender">    Sender 		</th>
                                               <th class="text-center" id="recipient"> Recipient</th>
                                               <th class="text-center" id="debit"> Amount</th> 
                                               <th class="text-center" id="currency"> Currency </th> 
                                                <th class="text-center" id="description">  Description    		</th>
                                                 
                                                 
                                                
                                  </tr>
                               </thead>
                                        <tbody id="activitytable">
														 
										</tbody>
							  </table>
							  
                                    </div>
                                    
                                    
                               
                                </div>
                            </div>
                        </div>
                    
                                     
                                          
                                            
                                            
                                        </form>
                                    </div>
                                </div>
                               
                            </div>


                            <div class="tab-pane tabs-animation fade" id="tab-content-1" role="tabpanel">
                                    <div class="main-card mb-3 card">
                                        <div class="card-body"><h5 align='center' class="card-title">Add</h5>
                                               



                                            <form class="cards__settings-form" id="card_info"  method="post" action=" ">
        
                                              
                                              
                                             <!--  form body 2 -->
                                              
                                              
                                                
                            </form> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        
                        
                        
                        
                        
                      
                    </div>
                    <div class="app-wrapper-footer">
                        <div class="app-footer">
                            <div class="app-footer__inner">
                              
                                <div class="app-footer-right">
                                    <ul class="nav">
                                        
                                        <li class="nav-item">
                                            <a href="javascript:void(0);" class="nav-link">
                                                <div class="badge badge-success mr-1 ml-0">
                                                    
                                                </div>
                                               © 2020  stylopay.com All Rights Reserved
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>    </div>
                    
                    
                   
        </div>
    </div>
    <script type="text/javascript" src="assets/scripts/dashboard.js"></script>
       <script type="text/javascript" src="assets/scripts/activity.js"></script>
        <script type="text/javascript" src="assets/scripts/newactivity.js"></script>
        <script type="text/javascript" src="assets/scripts/masteracc.js"></script>
        <script type="text/javascript" src="assets/scripts/jquery.min.js"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
 <script >
function exportF(elem) {
	  var table = document.getElementById("table");
	  var html = table.outerHTML;
	  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
	  elem.setAttribute("href", url);
	  elem.setAttribute("download", "Account Activity.xls"); // Choose the file name
	  return false;
	}
</script>
 
 
    </body>




<!-- <input  placeholder="start" type="text" id="from-datepicker"/>
<input  placeholder="end" type="text" id="end-datepicker"/>
<button type="button" onclick="date()"> View   </button> -->

</html>



