<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="username" value="${sessionScope.username}"></c:set>
<c:set var="userType" value="${sessionScope.userType}"></c:set>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<a href="${path }/index.jsp"><div class="Logo"></div></a>
            <div class="HeaderContent">
                <div style="text-align: right;padding: 0px 5px;font-size: 18px;height:35px;">
                    <c:if test="${username eq null}">
                    	<span>Welcome Guest | </span>
                    </c:if>
                    <c:if test="${username ne null}">
                    	<span>Welcome <c:out value="${username }"></c:out> | </span>
                    </c:if>
                    <span>24 Hours Customer Support | </span>
                    <a id="header-contactus-link" href="${path }/jsp/aboutUs.jsp">Contact us</a><span> | </span>
                    <c:if test="${username ne null}">
                    	<c:if test="${'ADMIN' eq userType}" >
                			<a id='header-myaccount-link' href='${path }/jsp/adminHomePage.jsp'>My Account</a><span id='link-saparetor'> | </span>
                		</c:if>
	                	<c:if test="${'CUSTOMER' eq userType}">
	                		<a id='header-myaccount-link' href='${path }/jsp/customerHomePage.jsp'>My Account</a><span id='link-saparetor'> | </span>
	                	</c:if>
                        <a id='header-logout-link' href='${path }/LogoutServlet'>Logout</a>
                    </c:if>
                    <c:if test="${username eq null}">
                            <a id='header-signin-link' href='${path }/jsp/login.jsp'>Login</a>
                    </c:if>
                </div>
                <div class='LogedUserContent'><span id='loged-user'></span></div>
            <div class="SearchContent">
                
                <table padding="5px">
                	<tr>
	                <td><span style="margin:0px 10px;font-size: 18px;color:white">Search</span></td>
	                <td><input id="search-field" name="searchField" type="text" onkeypress="search(this,event)" style="width:400px;color:blue;border-color: blue;background-color:buttonface;border-radius: 5px; font-size:14px;padding: 5px;" /></td>
	                <td><input id="search" type="Button" onclick="searchBook()" style="text-align: right;width:30px;padding: 5px;border-radius: 5px;  background-image: url(${path}/images/search-icon.png);" /></td>
	                </tr>
                </table>
                
            </div>
            <div id="loadingContainer" class="LoadingContainer">
            	<table><tr><td><div class="LoadingImage"></div></td>
            	<td><span id="loadingMessage" style="margin-top:-10px;color:red;font-size:18px;">Please wait ...</span></td>
            	</tr></table>
            </div>
        </div>
        
