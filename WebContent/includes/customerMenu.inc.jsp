<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<div id="menu">
                    <ul>
	                    <li><a href="${path }/index.jsp">Home</a></li>			
	                    <li id="viewAccount"><a>View Account</a></li>
	                    <li id="quickTransaction"><a>Quick Transaction</a></li>  
	                    <li id="fundTransfer"><a>Fund Transfer</a></li>
	                    <li id="changePassword"><a>Change Password</a></li>
	                </ul>
</div>