<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="message" value="${sessionScope.message}"></c:set>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<div id="display-message" class="DisplayMessages" style="display:none">
	    <div style="position: absolute; height:20px;width:1050px;margin:15px;">
	       <div id="image-icon" style="float: left;height:20px;width:20px;background-image: url('${path}/images/red-info.png');"></div>
	       <div style="margin-left:10px;float: left"><span id="message" style="color:darkred;">Something wrong</span></div>
	    </div>
	    <div id="close-btn" onclick="document.getElementById('display-message').style.display='none'" style="font-size:10px;height:12px;width:12px;text-align:center;margin-left:1065px;margin-top:17px;border:1px solid white;color:red">X
	    </div>
</div>

<c:if test="${message eq 'LOGIN FAIL' }">
	<div id="display-message1" class="DisplayMessages">
	    <div style="position: absolute; height:20px;width:1050px;margin:15px;">
	       <div id="image-icon" style="float: left;height:20px;width:20px;background-image: url('images/red-info.png');"></div>
	       <div style="margin-left:10px;float: left"><span id="message" style="color:darkred;">Login id and password are invalid</span></div>
	    </div>
	    <div id="close-btn" onclick="document.getElementById('display-message1').style.display='none'" style="font-size:10px;height:12px;width:12px;text-align:center;margin-left:1065px;margin-top:17px;border:1px solid white;color:red">X
	    </div>
	</div>
	<%session.setAttribute("message", ""); %>
</c:if>
<c:if test="${message eq 'ACCOUNT CREATED SUCCESSFULLY' }">
	<c:set var="accountNo" value="${sessionScope.accountNo }"></c:set>
	<c:set var="username" value="${sessionScope.username }"></c:set>
	<c:set var="loginPassword" value="${sessionScope.loginPassword }"></c:set>
	<c:set var="transactionPassword" value="${sessionScope.transactionPassword }"></c:set>
	<div id="display-message1" class="DisplayMessages" style="background-color:lightgreen;border-color:green">
	    <div style="position: absolute; height:20px;width:1050px;margin:15px;">
	       <div id="image-icon" style="float: left;height:20px;width:20px;background-image: url('../images/right-info.png');"></div>
	       <div style="margin-left:10px;float: left">
	       		<span id="message" style="color:green;">
	       			Account created successfully. Acc.NO: ${accountNo} ,Username: ${username },Login Pwd: ${loginPassword},Transaction Pwd: ${transactionPassword}
	       		</span>
	       	</div>
	    </div>
	    <div id="close-btn" onclick="document.getElementById('display-message1').style.display='none'" style="font-size:10px;height:12px;width:12px;text-align:center;margin-left:1065px;margin-top:17px;border:1px solid white;color:red">X
	    </div>
	</div>
	<%session.setAttribute("message", ""); %>
</c:if>