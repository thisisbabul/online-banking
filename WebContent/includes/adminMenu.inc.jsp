<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<div id="menu">
                    <ul>
	                    <li><a href="${path }/index.jsp">Home</a></li>	
	                    <li><a href="${path }/jsp/openAccount.jsp">Open Account</a></li>	
	                    <li><a href="${path }/jsp/closeAccount.jsp">Close Account</a></li>				
	                    <li><a href="${path }/jsp/accountDetails.jsp">View Account</a></li>
	                    <li><a href="${path }/jsp/depositAmount.jsp">Deposit</a></li>
	                    <li><a href="${path }/jsp/withdrawAmount.jsp">Withdraw</a></li>
	                    <li><a href="${path }/jsp/fundTransfer.jsp">Fund Transfer</a></li>
	                    <li><a href="${path }/jsp/quickTransaction.jsp">Quick Transaction</a></li>  
	                </ul>
</div>