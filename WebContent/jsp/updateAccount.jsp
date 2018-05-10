<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/common.css" />
	<title>Insert title here</title>
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
           <div class="MainBody"><center><h2 Style="color:darkblue">Update Account</h2></center><hr>           
           		<div class="LeftContainer">
           			<table >
           				<tr><td style="color:blue;font-size:18px;">Account Number</td></tr>
           				<tr><td><input type="text" name="" style="padding:1px 3px;font-size:18px;width:200px;color:darkblue;" /></td>
           					<td><div id="email-loading" style="height:25px;width:25px;background-size:25px 25px;background-image: url('images/loading.gif');"></div></td>
           				</tr>
           			</table>
           			<input type="submit" value="show details" style="padding:3px;width:120px;margin-left:3px;"/>
           		</div>
           		<div class="RightContainer">
           		</div>
           </div>
	</div>
	<div id="footer" class="Footer">
            <%@include  file="../includes/footer.inc.jsp" %>
            &nbsp;
    </div>
</body>
</html>