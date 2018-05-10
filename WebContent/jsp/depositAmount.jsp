<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/common.css" />
	<title>Deposit Amount | Hindustan Bank</title>
	<script src="../jquery/jquery-1.9.0.min.js" type="text/javascript"></script>  
	<script>
		$(document).ready(function(){
			$("#btnDeposit").click(function(){
				if(checkValidation()){
					depositAmount();
				}				
			});
		});
	</script>
	<script type="text/javascript">
	function eraseError(id){
		document.getElementById('tdAccountNo').innerHTML="<span id='checkAno' onclick='checkAccountNo()'>check</span>";
        document.getElementById('tdDepositAmount').innerHTML="";
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
	function checkValidation(){
		var regx=/^[0-9]+$/;
		var ano=document.getElementById("accountNo").value;
		var amount=document.getElementById("depositAmount").value;
		if(ano==""){
			document.getElementById('tdAccountNo').innerHTML="Plz. Enter Account No";
			document.getElementById('accountNo').focus();
		}else if(amount==""){
			document.getElementById('tdDepositAmount').innerHTML="Plz. Enter Deposit Amount";
			document.getElementById('depositAmount').focus();
		}else{
			var flag=regx.test(ano);
			if(!flag){    
				document.getElementById('tdAccountNo').innerHTML="Only digits allowed";
             }else if(ano.length!=16){
            	 document.getElementById('tdAccountNo').innerHTML="Account No should be 16 digits";
             }else{
            	 if(regx.test(amount) && amount>0){
            		 return true;
            		 
            	 }else{
            		 document.getElementById('tdDepositAmount').innerHTML="Plz. Enter Valid Amount";
            	 }            	 
             }
		}
		return false;
	}
	
	function depositAmount() {
        var ano=document.getElementById("accountNo").value;
        var amount=document.getElementById("depositAmount").value;
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
        xmlhttp.open("POST","${path}/DepositServlet?accountNo="+ano+"&depositAmount="+amount,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send();
    }
	
	
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
           		<div id="leftContainer" class="LeftContainer"><h2 Style="color:darkblue">Deposit Amount</h2>
           			<form action="/DepositServlet" method="post">
           			<table >
           				<tr><td style="color:blue;font-size:18px;">Account Number</td></tr>
           				<tr><td><input type="text" id="accountNo" name="accountNo" onkeyup="eraseError(this)" maxlength="16" style="padding:1px 3px;font-size:18px;width:200px;color:darkblue;" /></td>
           					<td id="tdAccountNo" style="color:red"><span id="checkAno" onclick="checkAccountNo()">check</span></td>
           				</tr>
           				<tr><td style="color:blue;font-size:18px;">Amount to be deposited</td></tr>
           				<tr><td><input type="text" id="depositAmount" name="depositAmount" onkeyup="eraseError(this)" style="padding:1px 3px;font-size:18px;width:200px;color:darkblue;" /></td>
           					<td id="tdDepositAmount" style="color:red"></td>
           				</tr>
           			</table>
           			<input type="button" id="btnDeposit" value="deposit" style="padding:3px;width:120px;margin-left:3px;"/>
           			
           			</form>
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