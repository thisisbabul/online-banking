<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${path }/css/common.css" />
	<title>Close Account | Hindustan Bank</title>
	<script src="${path }/jquery/jquery-1.9.0.min.js" type="text/javascript"charset="utf-8"></script>
	<style>
		
	</style>
	<script type="text/javascript">
	function eraseError(id){
		document.getElementById('tdAccountNo').innerHTML="<span id='checkAno' onclick='checkAccountNo()'>check</span>";
	}
	function closeAccount(){
		var ano=document.getElementById("accountNo").value.trim();
        document.getElementById('loadingContainer').style.display="block";
        var xmlhttp;
        if (window.XMLHttpRequest){
        	xmlhttp=new XMLHttpRequest();
        }else{
        	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4)
            { 
            	document.getElementById('loadingContainer').style.display="none";
            	document.getElementById("leftContainer").innerHTML=xmlhttp.responseText;
            }
          }
        xmlhttp.open("POST","<%=request.getServletContext().getContextPath()%>/CloseAccountServlet?accountNo="+ano,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send();
	}
	function checkAccountNo(){
		regx=/^[1-9]{1}[0-9]{15}$/;
		var accountNo=$("#accountNo").val().trim();
		if(accountNo!=""){
			if(regx.test(accountNo)){
				$("#tdAccountNo").html("<div id='checkingAccount' class='CheckingAccount'></div>");
				$.getJSON("${path}/CheckExistingAccountNo?accountNo="+accountNo,function(data){
					if(data==1){
						document.getElementById("checkingAccount").style.backgroundImage='url(${path}/images/tick.gif)';
					}else{
						$("#tdAccountNo").html("Account does not exist");
					}
				});
			}else{
				$("#tdAccountNo").html("Plz. enter valid account no");
			}
		}else{
			$("#tdAccountNo").html("Plz. enter account no");
		}
	}
	$(document).ready(function() {
		$("#buttonId").click(function() {
			var accountNo=$("#accountNo").val();
			var regx=/^[0-9]+$/;
			if(accountNo!=""){
				if(regx.test(accountNo)){
					if(accountNo.length==16){
						closeAccount();
					}else{
						$("#tdAccountNo").html("Account No should be 16 digits");
					}
				}else{
					$("#tdAccountNo").html("Only digis are allowed");
				}
			}else{
				$("#tdAccountNo").html("Plz. Enter Account No");
			} 
		});
	});
	</script>
	
	</head>
<body>
<body>
	<div class="MainContainer">
		<div class="HeaderContainer">
			<%@include file="../includes/header.inc.jsp"%>
			<div class="MenuContainer">
				<jsp:include page="../includes/adminMenu.inc.jsp" />
			</div>
			<jsp:include page="../includes/message.inc.jsp" />
		</div>
		<div class="MainBody">
			<form action="" method="post">
				
				<div id="leftContainer" class="LeftContainer">
					<h2 Style="color: darkblue">Close Account </h2>
					<table>
						<tr>
							<td style="color: blue; font-size: 18px;">Account Number</td>
						</tr>
						<tr>
							<td><input type="text" id="accountNo" name="accountNo" maxlength="16" onkeyup="eraseError(this)"
								style="padding: 1px 3px; font-size: 18px; width: 200px; color: darkblue;" /></td>
							<td id="tdAccountNo" style="color:red"><span id="checkAno" onclick="checkAccountNo()">check</span></td>
						</tr>
					</table>
					<input type="button" id='buttonId' value="show details"
						style="padding: 3px; width: 120px; margin-left: 3px;" />
				</div>
				<div id="rightContainer" class="RightContainer"></div>
				
			</form>
		</div>
	</div>
	<div id="footer" class="Footer">
		<%@include file="../includes/footer.inc.jsp"%>
		&nbsp;
	</div>
</body>
</html>