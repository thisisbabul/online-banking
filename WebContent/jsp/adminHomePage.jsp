<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/common.css" />
		<title>Hindustan Bank</title>
		<style>
		div.SideBarContainer
{
    border: 1px solid darkblue;
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    margin-top: 5px;
    margin-left: 700px;
    height:500px;
    width:398px;
    background-color:silver;
}
div.QuickLinksBoard
{
    margin-top:5px;
    padding: 2px 0px 0px 20px;
    margin-left:8px;
    border-radius: 20px;
    border: 1px solid cyan;
    height:150px;
    width:360px;
    background-color:white;
    box-shadow: 5px 5px 5px #000;
}
div.QuickLinksBoard,a
{
    text-decoration: none;
}
div.QuickLinksBoard a:hover
{
    text-decoration:underline; 
    
}
		</style>
	</head>
<body>
<div class="MainContainer">
            <div class="HeaderContainer">
                <%@include file="../includes/header.inc.jsp" %>
                <div class="MenuContainer">
                	<jsp:include page="../includes/adminMenu.inc.jsp" />
	            </div>
	            <jsp:include page="../includes/message.inc.jsp" />
           </div>
           <div class="MainBody">          
           		<div class="LeftContainer" style="width:650px;height:500px">
           			<div style="height:100px;width:650px;background-size:650px 100px;background-image: url('${path}/images/admin.png');"></div>
           			<div style="height:300px;width:650px;background-size:650px 300px;background-image: url('${path}/images/adminback.jpg');"></div>
           		</div>
               	
               	<div class="SideBarContainer">
                	<div class="QuickLinksBoard">
                   	 <span style="color:red;font-size: 20px;margin-left: 120px">Quick Links</span>
                    	<marquee height="110" onmouseover="this.stop()" onmouseout="this.start()" behavior="scroll" direction="up" scrollamount="2"> 
                        <a href="${path}/index.jsp" style="color:green;font-size:14px;">Goto Home Page</a><br>
                        <a href="${path}/jsp/adminHomePage.jsp" style="color:green;font-size:14px;">My Account</a><br>
                        <a href="${path}/jsp/openAccount.jsp" style="color:green;font-size:14px;">Create New Account</a><br>
                        <a href="${path}/jsp/accountDetails.jsp" style="color:green;font-size:14px;">View Account Details</a><br>
                        <a href="${path}/jsp/depositAmount.jsp" style="color:green;font-size:14px;">Deposit Amount</a><br>
                        <a href="${path}/jsp/withdrawAmount.jsp" style="color:green;font-size:14px;">Withdraw Amount</a><br>
                        <a href="${path}/jsp/fundTransfer.jsp" style="color:green;font-size:14px;">Fund Transfer</a><br>
                        <a href="${path}/jsp/quickTransaction.jsp" style="color:green;font-size:14px;">View Quick Transaction</a><br>
                        <a href="${path}/jsp/aboutUs.jsp" style="color:green;font-size:14px;">About Hindustan Bank</a><br>
                    	</marquee>
                	</div><br>
                	<img style="border: 1px solid green;margin-left:8px" src="${path }/images/operator.png">
            	</div>
           </div>
	</div><br><br>
        <div id="footer" class="Footer">
            <%@include  file="../includes/footer.inc.jsp" %>
            &nbsp;
        </div>  
</body>
</html>