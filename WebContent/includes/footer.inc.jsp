<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<div class="FooterContainer">
    <div class ="FooterQuickLink">
        <table>
            <tr><td><span style="color: cyan;"><h3>Quick Links</h3></span></td><td>&nbsp;&nbsp;</td><td><span style="color: cyan;"><h3></h3></span></td></tr>
            <tr><td><a id="footer-signin-link"href="${path }/jsp/login.jsp">Sign In</a></td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href="">ATM Locator</a></td></tr>
            <tr><td><a id="footer-signup-link"href="">Forms</a></td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href="">Branch Locator</a></td></tr>
            <tr><td><a href="${path }/jsp/services.jsp">Services</a></td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href="">HB in the news</a></td></tr>
           <tr><td><a href="${path }/jsp/aboutUs.jsp">About Us</a></td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href=""></a></td></tr>
        </table>
    </div>
    <div class="Subscribe">
        <span style="color: cyan;"><h3>Safe and Secured Fund Transfer</h3></span>
        <img src="${path }/images/payment-option-logo.png">
    </div>
    <br><hr><span style="margin-left: 430px">Copyright © Hindustan Bank</span>
</div>