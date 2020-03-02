<%@page import="com.stylopay.controller.AdminController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>







<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>    <c:out value="${Client_Agent_SubAgent_Name}">  </c:out>  's Dashboard </title>
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
    <title>     </title>
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
<body  onload="AccountsList();">
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
        </div>      <div class="ui-theme-settings">
            <button type="button" id="TooltipDemo" class="btn-open-options btn btn-warning">
                <em class="fa fa-cog fa-w-16 fa-spin fa-2x"></em>
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
        </div>   
        
  <!--  later added -->     
        
        
        
        
        
        
        
        
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
                           <!-- <label for="exampleCity" class="">Sender Account </label>
                            <input name="sender"  id="masteracc" placeholder="  " type="text" class="form-control"  >  --> 
                            
                       
                            
                              <div class="position-relative form-group"><label for="exampleCustomSelect" class="">From Account</label><select type="select" name="sender"  id="masteracc" class="custom-select">
                                                                <option value="">Select</option>
                                                                <option>69415466</option>
                                                                
                                                             
                                                            </select></div>
                            
                        
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
                    <h5 class="modal-title" id="exampleModalLongTitle">User Management</h5>
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
                                            
                                            
                                            
                                            
                                            
                                                         <div class="form-row">

                                                <div class="col-md-5">
                                                    <div class="position-relative form-group"><label for="username" class=""><strong>Username </strong></label><input name="User Name" id="username"  type="text" class="form-control" readonly></div>
                                                </div>



                                               <div class="col-md-3">
                                                    <div class="position-relative form-group"><label for="exampleAddress2" class=""><strong>First name</strong></label><input name="address2" id="fname" placeholder=" " type="text" class="form-control"  readonly>
                                                    </div>
                                                    </div>




                                                <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group"><label for="exampleCity" class=""><strong>Middle Name</strong></label><input name="mname"  id="mname" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div>

                                        </div>
                                        
                                        
                                        
                                        <div class="form-row">
                                        <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group"><label for="exampleCity" class=""><strong>Last Name</strong></label><input name="city"  id="lname" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div>
                                                
                                                 <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group">   <label for="exampleAddress2" class=""><strong>Cell Phone</strong></label><input name="address2" id="phone" placeholder=" " type="text" class="form-control"  disabled>
    </div>
                                                </div>
                                        
                                        
                                         <div class="col-md-2">
                                                    <div class="position-relative form-group"><label for="exampleState" class="">Registration Date</label><input name="state" id="date" type="text" class="form-control" disabled></div>
                                                </div>
                                              
                                                <div class="col-md-3">
                                                    <div class="position-relative form-group"><label for="userpermissiongroup" class="">User Permission Group</label><input name="userpermissiongroup"  id="userpermissiongroup" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div>
                                        </div>
                                        
                                          <div class="form-row">
                                     <div  class="col-md-5">
                                           
                                           <label for="email" class="">Email</label><input name="email"  id="email" placeholder=" " type="text" class="form-control" > 
                                         
                                        
                                         
                                          <input type="submit" class="mt-2 btn btn-primary" onclick="updateProfileInfo()" value="Update Email"> 
                                           </div>       
                                         </div>  
                                        
                                        
                                        
                                          
                                                         <div class="form-row">

                                            <!--     <div class="col-md-2">
                                                    <div class="position-relative form-group"><label for="username" class="">Balance</label><input name="User Name" id="balancepk"  type="text" class="form-control"></div>
                                                </div> -->


                                        </div>
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                                
                                           <div class="form-row">
                                                <div class='col-md-3'>
                                                    </div>
                                                    
                                         
                                       <!--    <div class="col-md-5">                                          
                                                    
    <label for="exampleCity" class="col-md-5">Username</label><input name="mname"  id="username" placeholder=" " type="text" class="form-control"  disabled>  
                
                      </div>           -->                                                        
                              
                                                  <!--  <div class="col-md-3">
                                                    <div class="position-relative form-group"><label for="exampleAddress2" class="">First name</label><input name="address2" id="fname" placeholder=" " type="text" class="form-control"  disabled>
                                                    </div>
                                                    </div> -->
                              
                                                   
                                                    
                                                    
                
                                                    <!--  <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group"><label for="exampleCity" class="">Middle Name</label><input name="mname"  id="mname" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div> -->
                                                <!-- <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group"><label for="exampleCity" class="">last Name</label><input name="city"  id="lname" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div>
                                                
                                                 <div class="col-md-3">
                                                    
                                                    <div class="position-relative form-group">   <label for="exampleAddress2" class="">Cell Phone</label><input name="address2" id="phone" placeholder=" " type="text" class="form-control"  disabled>
    </div>
                                                </div> -->

                                                  
                                             
                                               <!--  <div class="col-md-2">
                                                    <div class="position-relative form-group"><label for="exampleState" class="">Registration Date</label><input name="state" id="date" type="text" class="form-control" disabled></div>
                                                </div>
                                              
                                                <div class="col-md-3">
                                                    <div class="position-relative form-group"><label for="userpermissiongroup" class="">User Permission Group</label><input name="userpermissiongroup"  id="userpermissiongroup" placeholder=" " type="text" class="form-control"  disabled></div>
                                                </div> -->
                                                
                                            </div> 
                                          
                <!------------------------------ email update ----------------------------------->
                
                                        <!--    <div  class="col-md-5">
                                           
                                           <label for="email" class="">Email</label><input name="email"  id="email" placeholder=" " type="text" class="form-control" > 
                                         
                                        
                                         
                                          <input type="submit" class="mt-2 btn btn-primary" onclick="updateProfileInfo()" value="Update Email"> 
                                           </div>  -->
        
        
        
        
    <!--    email update -->
        
        
                   
                                                                                           
     
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

  
                                                <input type="submit" class="mt-2 btn btn-primary" onclick="updateAddressInfo()" value="Update Address"> 
                                                
                                                
                                                
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

<!-- hidden  inputs for  IDV checking -->
 <input name="username"  id="usernamepk" value=" "  type="hidden"  > 
<!--  <input name="isoCountryCodepk"  id="address" value=" "  type="hidden"  > 
 --> <input name="dob"  id="dobpk" value=" "  type="hidden"  > 
 <input name="fname"  id="fnamepk" value=" "  type="hidden"  > 
 <input name="aptNo"  id="aptnopk" value=" "  type="hidden"  > 
 <input name="city"  id="citypk" value=" "  type="hidden"  > 
  <input name="postcode"  id="postalcodepk" value=" "  type="hidden"  > 
  
  <input name="lname"  id="lastnamepk" value=" "  type="hidden"  > 
  
  <input name="isoCountryCode"  id="countrypk" value=" "  type="hidden"  > 
  
  <input name="state"  id="statepk" value=" "  type="hidden"  > 
  
                                       
<!-- hidden  inputs for  IDV checking -->







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
                                 
                                   <!-- <div class="form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                            <label class="form-check-label" for="invalidCheck">
                                                Confirm
                                            </label>
                                            <div class="invalid-feedback">
                                                Please Confirm
                                            </div>
                                        </div>
                                    </div> -->
                                 
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
                                                <div id="demopk"  class="card-body">
                                                
                                                
                                               
                                                 
                                                 
                                                 
                                                    <table class="mb-0 table table-bordered">
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <!--  later added -->
        
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
                    
                    
                    
                    
                    
                    
                    
                <!--     side bar  starts  here -->
                     
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
                                    
                                     <li class="app-sidebar__heading">Sponsored Accounts</li>
                                   <li>
                                        <a href="/mysponsoredaccounts">
                                            <i class="metismenu-icon fa fa-clipboard">
                                            </i>My Sponsored Accounts
                                        </a>
                                    </li>
                                    <!---<li class="app-sidebar__heading">UI Components</li>   --->
                                    <li>
                                       
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
                                        <a href="/ACCactivity">
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
                        
                        
                        
                        
                        <!-- sidebar  ends here -->
                        
                        
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
                                    <div>     <c:out value="${Client_Agent_SubAgent_Name}">  </c:out>  's Dashboard
                                        <div class="page-title-subheading"> Welcome    # <c:out value="${UserName_UserID}"></c:out>
                                        </div>
                                    </div>
                                </div>
                               <!--  <div class="page-title-actions">
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
                                </div>  -->   </div>
                        </div>   
                        
                        
                        
                        
                    <!--   before  table -->
                    
                            <div class="row">
                            <div class="col-md-6 col-xl-4">
                                <div class="card mb-3 widget-content bg-midnight-bloom">
                                    <div class="widget-content-wrapper text-white">
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Total Users</div>
                                            <div class="widget-subheading">. </div>
                                        </div>
                                        <div class="widget-content-right">
                                            <div class="widget-numbers text-white"><span> <c:out value="${cardholders}"></c:out>  </span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                    
                    
                    <!-- components  before table -->
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                                
                        
                        
                        
                      <!--   add tabs here if needed -->
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <div class="tab-content">
                            <div class="tab-pane tabs-animation fade show active" id="tab-content-0" role="tabpanel">
                                <div class="main-card mb-3 card">
                                    <div class="card-body"> <!---<h5 class="card-title">Rows</h5>--->
                                         <form class=""   method=POST   action=" " >
                                                
                                            <!-- form body 1 -->
                                            
                  
                                               <div class="row">

                            
                            <div class="col-md-12">
                                
                                <div class="main-card mb-3 card">
                                    <div class="card-header">  All Essentials
                                            <div class="d-block text-center card-footer">
                                            
                                            
                               <%--   <c:out value="${UserName_UserID}"> </c:out>            
                                 --%>              
                                            
                                          <!--   <input name="username"    id="userpk" value="debasis01"  type="hidden"  > 
                                            --> 
                                 
                                            
                                                   
                                                
                                                          </div>
                                        

  
                                            
                                        <div class="btn-actions-pane-right">
                                         
                                          
                                            
                                            <div role="group" class="btn-group-sm btn-group">


                                                
                                              
                                            </div>
                                        </div>
                                    </div>
                                    
                         <!--   loading options start here -->  
                                   <div class="row">
                                       <div class="col-md-3">
                                        
                                        <a href="javascript:notallowed();">  <!-- /frombank -->
<div class="mb-3 card card-body"><h5 align="center" class="card-title">FUND TRANSFER FROM</h5><div class="font-icon-wrapper"><i class="fa fa-university fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>BANK</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                    <!--     <div class="col-md-3">
                                        
                                        <a href="#">
<div class="mb-3 card card-body"><h5 align="center" class="card-title">TRANSFER FROM</h5><div class="font-icon-wrapper"><i class="fa fa-cc-mastercard fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>MASTERCARD</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div> -->
                                        
                                        <!--   <div class="col-md-3">
                                        
                                        <a href="#">
<div class="mb-3 card card-body"><h5 align="center" class="card-title">TRANSFER FROM</h5><div class="font-icon-wrapper"><i class="fa fa-cc-visa fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>VISA</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div> -->
                                        
                                        
                                         <div class="col-md-3">
                                        
                                        <a href="/crypto">
<div class="mb-3 card card-body"><h5 align="center" class="card-title">FUND TRANSFER FROM</h5><div class="font-icon-wrapper"><i class="fa fa-btc fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>BITCOIN</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div> 
                                        
                                        
                                        
                     <div class="col-md-3">
                                        
                                        <a href="/editacc">
<div class="mb-3 card card-body"><h5 align="center" class="card-title">MY PROFILE</h5><div class="font-icon-wrapper"><i class="fa fa-user fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>MY PROFILE</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div>                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                 
                                       <div class="col-md-3">
                                        
                                        <a href="#">
<div class="mb-3 card card-body"><h5 align="center" class="card-title"> BITCOIN TRANSFER</h5><div class="font-icon-wrapper"><i class="fa fa-btc fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>BITCOIN</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div> 
                                     
                                        
                                        
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                  <!--  row 2 -->
                                   <div class="row">
                                     
                                        
                                        
                                        
                                        
                                        
                                    <!--     <div class="col-md-3">
                                        
                                        <a href="#">
<div class="mb-3 card card-body"><h5 align="center" class="card-title">TRANSFER FROM</h5><div class="font-icon-wrapper"><i class="fa fa-cc-mastercard fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>MASTERCARD</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div> -->
                                        
                                        <!--   <div class="col-md-3">
                                        
                                        <a href="#">
<div class="mb-3 card card-body"><h5 align="center" class="card-title">TRANSFER FROM</h5><div class="font-icon-wrapper"><i class="fa fa-cc-visa fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>VISA</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div> -->
                                        
                                        
                                        
                                        
                                        
                                        
                     <div class="col-md-3">
                                        
                                        <a href="/ACCactivity">
<div class="mb-3 card card-body"><h5 align="center" class="card-title">MY ACCOUNT ACTIVITY</h5><div class="font-icon-wrapper"><i class="fa fa-line-chart fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>MY ACCOUNT ACTIVITY</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div>                     
                                        
                                                                  
                     <div class="col-md-3">
                                        
                                        <a href="/CARDactivity">
<div class="mb-3 card card-body"><h5 align="center" class="card-title">MY CARD ACTIVITY</h5><div class="font-icon-wrapper"><i class=" fa fa-credit-card-alt fa-1x" aria-hidden="true" style="color:black"></i>
</br>
<p>MY CARD ACTIVITY</p> 
                                                        </div>
                                           
                                        </div>   </a>
                                        </div>   
                                        
                                       
                                        
                                        
                                        
                                 
                                         
                                     
                                        
                                        
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
                    </div>  </div>
        </div>
    </div>
    <script type="text/javascript" src="assets/scripts/dashboard.js"></script>
    <script type="text/javascript" src="assets/scripts/Details.js"></script>
    <!-- <script type="text/javascript" src="assets/scripts/jquery.min.js"></script> -->
    <!-- <script type="text/javascript" src="assets/scripts/jquery-3.2.1.min.js"></script> -->
    <script type="text/javascript" src="assets/scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="assets/scripts/intlTelInput.js"></script>
     <script type="text/javascript" src="assets/scripts/less.min.js"></script>
      <script type="text/javascript" src="assets/scripts/bootstrap.min.js"></script>
      
    <script>
function myFunction() {
  var x = document.getElementById("fileupload2").required;
  document.getElementById("demo").innerHTML = x;
}
</script>



<script type="text/javascript" src="assets/scripts/dashboard.js"></script></body>
   <script type="text/javascript"> 
    </script> 
                                                    
    <script type="text/javascript" src="assets/scripts/dashboard.js"></script>
     <script type="text/javascript" src="assets/scripts/accountholders.js"></script>
     <script type="text/javascript" src="assets/scripts/jquery.min.js"></script>
     <script type="text/javascript" src="assets/scripts/money.js"></script>
      <script type="text/javascript" src="assets/scripts/masteracc.js"></script>
     <!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> -->
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script type="text/javascript" src="assets/scripts/updateinfo.js"></script>  
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

<script >
function exportF(elem) {
	  var table = document.getElementById("table");
	  var html = table.outerHTML;
	  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
	  elem.setAttribute("href", url);
	  elem.setAttribute("download", "Registered users.xls"); // Choose the file name
	  return false;
	}
</script>





    
    </body>
</html>





<!-- <div class="col-md-3"><label for="exampleCustomSelect" class="">From Account</label><select type="select" name="sender"  id="masteracc" class="custom-select">
                                                                <option value="">Select</option>
                                                                <option>69415466</option>
                                                                
                                                             
                                                            </select>
                                                            
                                                            
                                                            
                                                               <div class="card-header">Choose Date Range
                                                     <a  class="mb-2 mr-2 badge badge-primary">Enter Start Date and End Date</a>     
                         <input type="text" placeholder="Click Here"name="daterange" value="" style="width:65%"/>
                                            
                                            
                                            </div>
                                            
                                            position-relative form-group
                                            </div>
                                                     -->
