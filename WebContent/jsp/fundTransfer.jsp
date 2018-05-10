<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/common.css" />
	<title>Fund Transfer | Hindustan Bank</title>
	<script src="${path }/jquery/jquery-1.9.0.min.js" type="text/javascript"charset="utf-8"></script>
	<script type="text/javascript">
	function eraseError(id){
		document.getElementById('tdSourceAccountNo').innerHTML="<span id='checkAno' onclick='checkAccountNo()'>check</span>";
		document.getElementById('tdTargetAccountNo').innerHTML="";
        document.getElementById('tdTransferAmount').innerHTML="";
	}
	function checkAccountNo(){
		regx=/^[1-9]{1}[0-9]{15}$/;
		var accountNo=$("#sourceAccountNo").val().trim();
		if(accountNo!=""){
			if(regx.test(accountNo)){
				$("#tdSourceAccountNo").html("<div id='checkingAccount' class='CheckingAccount'></div>");
				$.getJSON("${path}/CheckExistingAccountNo?accountNo="+accountNo,function(data){
					if(data==1){
						document.getElementById("checkingAccount").style.backgroundImage='url(${path}/images/tick.gif)';
					}else{
						$("#tdSourceAccountNo").html("Account does not exist");
					}
				});
			}else{
				$("#tdSourceAccountNo").html("Plz. enter valid account no");
			}
		}else{
			$("#tdSourceAccountNo").html("Plz. enter account no");
		}
	}
	function checkValidation(){
		var regx=/^[0-9]+$/;
		var sourceAccountNo = $("#sourceAccountNo").val().trim();
		var targetAccountNo = $("#targetAccountNo").val().trim();
		var transferAmount = $("#transferAmount").val().trim();
		if(sourceAccountNo==""){
			$("#tdSourceAccountNo").html("Plz. Enter source account No");
		}else if(targetAccountNo==""){
			$("#tdTargetAccountNo").html("Plz. Enter target account No");
		}else if(transferAmount==""){
			$("#tdTransferAmount").html("Plz. Enter transfer amount");
		}else{
			
			if(sourceAccountNo.length==16 && targetAccountNo.length==16 && regx.test(sourceAccountNo)==true && regx.test(targetAccountNo)==true && transferAmount>0){
				if(sourceAccountNo==targetAccountNo){
					$("#tdTargetAccountNo").html("Target Account No should not be same");
				}else{
					return true;
				}
			}else if(sourceAccountNo.length<16){
				$("#tdSourceAccountNo").html("Account No should be 16 digis");
			}else if(targetAccountNo.length<16){
				$("#tdTargetAccountNo").html("Account No should be 16 digis");
			}else if(regx.test(sourceAccountNo)==false){
				$("#tdSourceAccountNo").html("Only digits are allowed");
			}else if(regx.test(targetAccountNo)==false){
				$("#tdTargetAccountNo").html("Only digits are allowed");
			}else if(regx.test(transferAmount)==false || transferAmount<1){
				$("#tdTransferAmount").html("Plz. Enter valid amount");
			}
		}
		return false;
	}
	function fundTransfer() {
		var sano =document.getElementById("sourceAccountNo").value.trim();
		var tano =document.getElementById("targetAccountNo").value.trim();
		var ta =document.getElementById("transferAmount").value.trim();
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
        xmlhttp.open("POST","<%=request.getServletContext().getContextPath()%>/FundTransferServlet?sourceAccountNo="+sano+"&targetAccountNo="+tano+"&transferAmount="+ta,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send();
    }
	$(document).ready(function() {
		$("#transferBtn").click(function() {
			if(checkValidation()){
				fundTransfer();
			}
		});
	});	
	</script>
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
           		<div class="LeftContainer" id="leftContainer"><h2 Style="color:darkblue">Fund Transfer</h2>
           			<table >
           				<tr><td style="color:blue;font-size:18px;">Source Account Number</td></tr>
           				<tr><td><input type="text" id="sourceAccountNo" name="sourceAccountNo" maxlength="16" onkeyup="eraseError(this)" style="padding:1px 3px;font-size:18px;width:200px;color:darkblue;" /></td>
           					<td id="tdSourceAccountNo" style="color:red"><span id="checkAno" onclick="checkAccountNo()">check</span></td>
           				</tr>
           				<tr><td style="color:blue;font-size:18px;">Target Account Number</td></tr>
           				<tr><td><input type="text" id="targetAccountNo" name="targetAccountNo" maxlength="16" onkeyup="eraseError(this)" style="padding:1px 3px;font-size:18px;width:200px;color:darkblue;" /></td>
           					<td id="tdTargetAccountNo" style="color:red"></td>
           				</tr>
           				<tr><td style="color:blue;font-size:18px;">Amount to be transfered</td></tr>
           				<tr><td><input type="text" id="transferAmount" name="transferAmount" onkeyup="eraseError(this)" style="padding:1px 3px;font-size:18px;width:200px;color:blue;" /></td>
           					<td id="tdTransferAmount" style="color:red"></td>
           				</tr>
           			</table>
           			<input type="button" id="transferBtn" value="transfer" style="padding:3px;width:120px;margin-left:3px;"/>
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