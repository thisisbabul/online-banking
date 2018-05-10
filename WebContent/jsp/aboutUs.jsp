<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/common.css">
        <title>Login | Hindustan Bank</title>
        <style>
        	h2{
        		color:darkblue;
        	}
        	h3{
        		color:darkred;
        	}
        	p{
        		color:green;
        		font-size:18px;
        	}
        </style>
        
    </head>
    <body>
        <div class="MainContainer">
            <div class="HeaderContainer">
                <jsp:include page="../includes/header.inc.jsp" />
                <div class="MenuContainer">
                	<jsp:include page="../includes/visitorMenu.inc.jsp" />
                </div>
            <jsp:include page="../includes/message.inc.jsp" />
            </div>
            <div id="leftContainer" class="LeftContainer" >
            	<div style="height:300px;width:500px;background-size:500px 300px;background-image: url('${path}/images/contactus.jpg');"></div>
					
            </div>
            <div id="rightContainer" class="RightContainer">
            	<h3>About us</h3>
            	<p>Hindustan Bank has an extensive administrative structure to oversee the large network 
					of branches in India and abroad. The Corporate Centre is in Mumbai and 14 Local Head Offices 
					and 57 Zonal Offices are located at important cities spread throughout the country. 
					The Corporate Centre has several other establishments in and outside Mumbai, 
					designated to cater to various functions. Our Colleges/Institutes/Training Centres are 
					the seats of learning and research and development to spread the wings of knowledge 
					not only to our employees but also other banks/establishments in India and abroad.</p>
					<h3>Call us</h3>
					<p>
					Please call HB's 24X7 helpline through Toll free 1800 11 2211, 1800 425 3800 or 
					Toll number 080-26599990 These are accessible from all landlines and mobile phones in the country.
					</p>
            </div>         
    	</div>
       
    <div class="Footer">
        <jsp:include page="../includes/footer.inc.jsp" />&nbsp;
    </div>
    </body>
</html>
