<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<!DOCTYPE html>
<html>
    <head>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="css/common.css" />
        <link rel="stylesheet" type="text/css" href="css/index.css" />
        <link rel="stylesheet" type="text/css" href="css/nivo-slider.css"  media="screen" />
        <script src="jquery/jquery-1.9.0.min.js" type="text/javascript"></script>        
        <script src="jquery/jquery.nivo.slider.js" type="text/javascript"></script>
        <title>Online Banking System</title>
        <style>
        
        </style>
        <script>
            $(window).load(function()
            {
                $("#slider").nivoSlider();
            });
        </script>
    </head>
    <body >
        <div class="MainContainer">
            <div class="HeaderContainer">
                <jsp:include page="includes/header.inc.jsp" />
                <div class="MenuContainer">
                	<jsp:include page="includes/visitorMenu.inc.jsp" />
            	</div>
            <jsp:include page="includes/message.inc.jsp" />
           </div>
           <div class="MainBody">
               <div  id="home-page-displayer" class="HomePageDisplayer">
                    <div id="banners-displayer" class="BannersDisplayer" >                
                        <div class="Banner">
                            <div id="slider" class="nivoSlider">
                                <img src="images/image1.jpg" />
                                <img src="images/image2.jpg" />
                                <img src="images/image3.jpg" />
                                <img src="images/image4.jpg" />
                                <img src="images/image5.jpg" />
                            </div>	
                        </div>
                   </div>
               </div>
           </div>
        </div><br><br>
        <div id="footer" class="Footer">
            <jsp:include page="includes/footer.inc.jsp" />
            &nbsp;
        </div>  
    </body>
</html>
