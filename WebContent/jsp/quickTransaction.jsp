<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${path }/css/common.css" />
	<title>Quick Transaction | Hindustan Bank</title>
	<script src="${path }/jquery/jquery-1.9.0.min.js"></script>
	<script type="text/javascript">
		function eraseError(id){
			document.getElementById('tdAccountNo').innerHTML="<span id='checkAno' onclick='checkAccountNo()'>check</span>";
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
		
		$(document).ready(function(){
			$("#showDetailsBtn").click(function(){
				var accountNo=$("#accountNo").val();
				var regx=/^[0-9]+$/;
				if(accountNo!=""){
					if(regx.test(accountNo)){
						if(accountNo.length==16){
							document.getElementById('loadingContainer').style.display="block";
							$.getJSON("${path}/QuickTransactionServlet?accountNo="+ accountNo, function(data) {
								document.getElementById('loadingContainer').style.display="none";
								if(data!=null){
									$("#leftContainer").hide();
									$("#transactionDetailsContainer").show();
									$("#accountNoId").html(data.accountNo);
									$("#accountHolderNameId").html(data.firstName+" "+data.lastName);
									//alert(data.transactionDTOs.transactionId);
									$.each(data.transactionDTOs,function(key,txn){
										var dataString="<tr><td>"+txn.transactionId+"</td><td>"+txn.transactionDate+"</td>";
										var description=(txn.description).toString();
										if(description=="CASH DEPOSIT"){
											dataString=dataString+"<td>-</td><td>"+txn.transactionAmount+"</td><td>"+txn.description+"</td><td>-</td>";
										}else if(description=="CASH WITHDRAW"){
											dataString=dataString+"<td>"+txn.transactionAmount+"</td><td>-</td><td>"+txn.description+"</td><td>-</td>";
										}else if (description=="FUND TRANSFER"){
											dataString=dataString+"<td>"+txn.transactionAmount+"</td><td>-</td><td>"+txn.description+"</td><td>"+txn.targetAccountNo+"</td>";
										}
										dataString=dataString+"<td>"+txn.netBalance+"</td></tr>";
										$("#transactionDetailsTbl").append(dataString);
										dataString="";
									});
								}else{
									$("#leftContainer").html("<h2 style='color:red'>Sorry ! Account does not exist</h2>");
								}
							});
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
	<style>
		div.TransactionDetailsContainer{
			width:1050px;
			height:auto;
			padding:10px 25px;
		}
		div.TransactionDetailsContainer th{
			background-color:darkblue;
			width:150px;
			padding:5px 0px;
			color:white;
			border:1px solid blue;
		}
		div.TransactionDetailsContainer td{
			background-color:lightblue;
			width:150px;
			padding:5px 0px;
			color:blue;
			text-align:center;
			border:1px solid white;
			
		}
		div.TransactionDetailsContainer span{
			font-size:18px;
			color:darkblue;
		}
		#loginDateId,#accountHolderNameId,#accountNoId{
			color:background;
		}
		#transactionDetailsTbl{
			border:1px solid blue;
		}
	</style>
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
           <div id="mainBody" class="MainBody" > 
           		<div id="leftContainer" class="LeftContainer" style="position:relative;height:380px">
           		<h2 Style="color: darkblue">View Transaction Details</h2>
           		<form action="" method="post">
           			<table >
           				<tr><td style="color:blue;font-size:18px;">Account Number</td></tr>
           				<tr><td><input type="text" id="accountNo" name="accountNo" onkeyup="eraseError(this)" maxlength="16" style="padding:1px 3px;font-size:18px;width:200px;color:darkblue;" /></td>
           					<td id="tdAccountNo" style="color:red"><span id="checkAno" onclick="checkAccountNo()">check</span></td>
           				</tr>
           			</table>
           			<input type="button" id="showDetailsBtn" value="show details" style="padding:3px;width:120px;margin-left:3px;"/>
           		</form>
           		</div>
           		<div id="transactionDetailsContainer" class='TransactionDetailsContainer' style="display:none">
           			<span>Login Date : </span><span id="loginDateId"><%=new java.util.Date() %></span><br>
           			<span>Account Number : </span ><span id="accountNoId"></span><br>
           			<span>Account Holder Name : </span ><span id="accountHolderNameId"></span><br><br>
           			<hr><br>
           			<table id="transactionDetailsTbl"><tbody id="tbodyId"><tr><th>Transaction Id</th><th>Transaction Date</th><th>Debit</th><th>Credit</th><th>Description</th><th>Target Acc No</th><th>Net Balance</th></tr>
           				   </tbody>
           			</table><br>
           		</div>
           </div>
	</div>
	<div id="footer" class="Footer">
            <%@include  file="../includes/footer.inc.jsp" %>
            &nbsp;
    </div>
</body>
</html>