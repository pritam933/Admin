

<%@page import="com.stylopay.controller.AdminController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title> 404 Page </title>
  <script
        src="https://code.jquery.com/jquery-3.3.1.min.js"></script><link rel="stylesheet" href="assets/css/error.css">

</head>
<body>


<body class="bg-purple">
        
        <div class="stars">
            <div class="custom-navbar">
                <div class="brand-logo">
                    <img src="assets/scripts/stylogo.png " width="80px">    <!-- logo here -->
                </div>
                <div class="navbar-links">
                    <ul>
                                             <!-- list here --> 
                    </ul>
                </div>
            </div>
            <div class="central-body">
                <img class="image-404" src="http://salehriaz.com/404Page/img/404.svg" width="300px">
                <a href="/dasbo" class="btn-go-home" target="_blank">GO BACK HOME</a>
            </div>
            <div class="objects">
                <img class="object_rocket" src="http://salehriaz.com/404Page/img/rocket.svg" width="40px">
                <div class="earth-moon">
                    <img class="object_earth" src="http://salehriaz.com/404Page/img/earth.svg" width="100px">
                    <img class="object_moon" src="http://salehriaz.com/404Page/img/moon.svg" width="80px">
                </div>
                <div class="box_astronaut">
                    <img class="object_astronaut" src="http://salehriaz.com/404Page/img/astronaut.svg" width="140px">
                </div>
            </div>
            <div class="glowing_stars">
                <div class="star"></div>
                <div class="star"></div>
                <div class="star"></div>
                <div class="star"></div>
                <div class="star"></div>

            </div>

        </div>

    </body>
<!-- partial -->
  <script  src="assets/scripts/error.js"></script>

</body>
</html>
