<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<c:set var="accountNo" value="${sessionScope.accountNo }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="${path }/css/common.css" />
	<link rel="stylesheet" type="text/css" href="${path }/css/customerHomePage.css" />
	<title>Quick Transaction | Hindustan Bank</title>
	<script src="${path }/jquery/jquery-1.9.0.min.js"></script>
	<script type="text/javascript">
	function eraseError(id){
		document.getElementById('tdTargetAccountNo').innerHTML="";
        document.getElementById('tdTransferAmount').innerHTML="";
        document.getElementById('tdTransactionPassword').innerHTML="";
        document.getElementById("tdConfirmTransactionPassword").innerHTML="";
	}
	function eraseError1(id){
		
        document.getElementById('tdOldUsername').innerHTML="";
        document.getElementById('tdNewUsername').innerHTML="";
        document.getElementById('tdLoginPassword').innerHTML="";
        document.getElementById('tdConfirmLoginPassword').innerHTML="";
        document.getElementById('tdCurrentUsername').innerHTML="";
        document.getElementById('tdOldPassword').innerHTML="";
        document.getElementById('tdNewPassword').innerHTML="";
        document.getElementById('tdConfirmPassword').innerHTML="";
        document.getElementById('tdCurrentTxnUsername').innerHTML="";
        document.getElementById('tdOldTxnPassword').innerHTML="";
        document.getElementById('tdNewTxnPassword').innerHTML="";
        document.getElementById('tdConfirmTxnPassword').innerHTML="";
	}
	function checkChangeUsernameValidation(){
		var regx=/^([\_]?[A-z]+[0-9]*)+$/;
		var oldUsername =document.getElementById("oldUsername").value.trim();
		var newUsername =document.getElementById("newUsername").value.trim();
		var loginPassword =document.getElementById("loginPassword").value.trim();
		var confirmLoginPassword =document.getElementById("confirmLoginPassword").value.trim();
		if(oldUsername==""){
			$("#tdOldUsername").html("Plz. enter old username");
		}else if(newUsername==""){
			$("#tdNewUsername").html("Plz. enter new username");
		}else if(loginPassword==""){
			$("#tdLoginPassword").html("Plz. enter login password");
		}else if(confirmLoginPassword==""){
			$("#tdConfirmLoginPassword").html("Plz. enter confirm login password");
		}else{
			if(regx.test(newUsername)==true && regx.test(oldUsername)==true &&  oldUsername!=newUsername && loginPassword==confirmLoginPassword){
				changeUsername();
			}else{
				if(regx.test(oldUsername)==false){
					$("#tdOldUsername").html("Plz. enter a valid username");
				}else if(regx.test(newUsername)==false){
					$("#tdNewUsername").html("Plz. enter a valid username");
				}else if(oldUsername==newUsername){
					$("#tdNewUsername").html("old & new username can't be same");
				}else if(loginPassword!=confirmLoginPassword){
					$("#tdConfirmLoginPassword").html("Confirm password does not match");
				}
			}
		}
	}
	function checkChangeLoginPasswordValidation(){
		var regx=/^([\_]?[A-z]+[0-9]*)+$/;
		var currentUsername =document.getElementById("currentUsername").value.trim();
		var oldPassword =document.getElementById("oldPassword").value.trim();
		var newPassword =document.getElementById("newPassword").value.trim();
		var confirmPassword =document.getElementById("confirmPassword").value.trim();
		if(currentUsername==""){
			$("#tdCurrentUsername").html("Plz. enter current username");
		}else if(oldPassword==""){
			$("#tdOldPassword").html("Plz. enter old password");
		}else if(newPassword==""){
			$("#tdNewPassword").html("Plz. enter new password");
		}else if(confirmPassword==""){
			$("#tdConfirmPassword").html("Plz. enter confirm password");
		}else{
			if(regx.test(currentUsername)==true && oldPassword!=newPassword && newPassword==confirmPassword){
				changeLoginPassword();
			}else{
				if(regx.test(currentUsername)==false){
					$("#tdCurrentUsername").html("Plz. enter a valid username");
				}else if(oldPassword==newPassword){
					$("#tdNewPassword").html("old & new password can't be same");
				}else if(newPassword!=confirmPassword){
					$("#tdConfirmPassword").html("Confirm password does not match");
				}
			}
		}
	}
		
	function checkChangeTransactionPasswordValidation(){
		var regx=/^([\_]?[A-z]+[0-9]*)+$/;
		var currentTxnUsername =document.getElementById("currentTxnUsername").value.trim();
		var oldTxnPassword =document.getElementById("oldTxnPassword").value.trim();
		var newTxnPassword =document.getElementById("newTxnPassword").value.trim();
		var confirmTxnPassword =document.getElementById("confirmTxnPassword").value.trim();
		if(currentTxnUsername==""){
			$("#tdCurrentTxnUsername").html("Plz. enter current username");
		}else if(oldTxnPassword==""){
			$("#tdOldTxnPassword").html("Plz. enter old password");
		}else if(newTxnPassword==""){
			$("#tdNewTxnPassword").html("Plz. enter new password");
		}else if(confirmTxnPassword==""){
			$("#tdConfirmTxnPassword").html("Plz. enter confirm password");
		}else{
			if(regx.test(currentTxnUsername)==true && oldTxnPassword!=newTxnPassword && newTxnPassword==confirmTxnPassword){
				changeTransactionPassword();
			}else{
				if(regx.test(currentTxnUsername)==false){
					$("#tdCurrentTxnUsername").html("Plz. enter a valid username");
				}else if(oldTxnPassword==newTxnPassword){
					$("#tdNewTxnPassword").html("old & new password can't be same");
				}else if(newTxnPassword!=confirmTxnPassword){
					$("#tdConfirmTxnPassword").html("Confirm password does not match");
				}
			}
		}
	}
	function checkFundTransferValidation(){
		var regx=/^[0-9]+$/;
		var tano =document.getElementById("targetAccountNo").value.trim();
		var ta =document.getElementById("transferAmount").value.trim();
		var txnPwd =document.getElementById("transactionPassword").value.trim();
		var cTxnPwd =document.getElementById("confirmTransactionPassword").value.trim();
		if(tano==""){
			$("#tdTargetAccountNo").html("Plz. enter target account no");
		}else if(ta==""){
			$("#tdTransferAmount").html("Plz. enter transfer amount");
		}else if(txnPwd==""){
			$("#tdTransactionPassword").html("Plz. enter transaction password");
		}else if(cTxnPwd==""){
			$("#tdConfirmTransactionPassword").html("Plz. enter confirm password");
		}else{
			if(tano.length==16 && regx.test(tano)==true && ta>0 && txnPwd==cTxnPwd){
				fundTransfer();
			}else{
				if(regx.test(tano)==false){
					$("#tdTargetAccountNo").html("Only digits are allowed");
				}else if(tano.length!=16){
					$("#tdTargetAccountNo").html("Account no should be 16 digits");
				}else if(ta<1 || regx.test(ta)==false){
					$("#tdTransferAmount").html("Plz. enter valid amount");
				}else if(txnPwd!=cTxnPwd){
					$("#tdConfirmTransactionPassword").html("Confirm password does not match");
				}
			}
		}
	}	
	function changeUsername(){
		var oldUsername =document.getElementById("oldUsername").value.trim();
		var newUsername =document.getElementById("newUsername").value.trim();
		var loginPassword =document.getElementById("loginPassword").value.trim();
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
            	document.getElementById("oldUsername").value="";
        		document.getElementById("newUsername").value="";
        		document.getElementById("loginPassword").value="";
        		document.getElementById("confirmLoginPassword").value="";
            	document.getElementById('loadingContainer').style.display="none";
            	if(xmlhttp.responseText==1){
            		document.getElementById('display-message').style.display='block';
                    document.getElementById('message').style.color='green';
                    document.getElementById('display-message').style.backgroundColor='lightgreen';
                    document.getElementById('image-icon').style.backgroundImage='url(${path}/images/right-info.png)';
                    document.getElementById('display-message').style.borderColor='green';
                    document.getElementById('message').innerHTML='Congratulates ! Your have successfully changed your username.';
            
            	}else if(xmlhttp.responseText==0){
            		document.getElementById('display-message').style.display='block';
                    document.getElementById('message').style.color='darkred';
                    document.getElementById('display-message').style.backgroundColor='#FFA07A';
                    document.getElementById('image-icon').style.backgroundImage='url(${path}/images/wrong-info.png)';
                    document.getElementById('display-message').style.borderColor='darkred';
                    document.getElementById('message').innerHTML='Sorry ! Invalid username or password.';
            	}
            }
          }
        xmlhttp.open("POST","${path}/ChangeUsernameServlet?oldUsername="+oldUsername+"&newUsername="+newUsername+"&loginPassword="+loginPassword,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send();
	}
	function changeLoginPassword(){
		document.getElementById('loadingContainer').style.display="block";
		var currentUsername =document.getElementById("currentUsername").value.trim();
		var oldPassword =document.getElementById("oldPassword").value.trim();
		var newPassword =document.getElementById("newPassword").value.trim();
        var xmlhttp;
        if (window.XMLHttpRequest){
        	xmlhttp=new XMLHttpRequest();
        }else{
        	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4)
            { 
            	document.getElementById("currentUsername").value="";
        		document.getElementById("oldPassword").value="";
        		document.getElementById("newPassword").value="";
        		document.getElementById("confirmPassword").value="";
            	document.getElementById('loadingContainer').style.display="none";
            	if(xmlhttp.responseText==1){
            		document.getElementById('display-message').style.display='block';
                    document.getElementById('message').style.color='green';
                    document.getElementById('display-message').style.backgroundColor='lightgreen';
                    document.getElementById('image-icon').style.backgroundImage='url(${path}/images/right-info.png)';
                    document.getElementById('display-message').style.borderColor='green';
                    document.getElementById('message').innerHTML='Congratulates ! Your have successfully changed your login password.';
            
            	}else if(xmlhttp.responseText==0){
            		document.getElementById('display-message').style.display='block';
                    document.getElementById('message').style.color='darkred';
                    document.getElementById('display-message').style.backgroundColor='#FFA07A';
                    document.getElementById('image-icon').style.backgroundImage='url(${path}/images/wrong-info.png)';
                    document.getElementById('display-message').style.borderColor='darkred';
                    document.getElementById('message').innerHTML='Sorry ! Invalid username or password.';
            	}
            }
          }
        xmlhttp.open("POST","${path}/ChangeLoginPasswordServlet?currentUsername="+currentUsername+"&oldPassword="+oldPassword+"&newPassword="+newPassword,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send();
	}
	function changeTransactionPassword(){
		document.getElementById('loadingContainer').style.display="block";
		var currentTxnUsername =document.getElementById("currentTxnUsername").value.trim();
		var oldTxnPassword =document.getElementById("oldTxnPassword").value.trim();
		var newTxnPassword =document.getElementById("newTxnPassword").value.trim();
        var xmlhttp;
        if (window.XMLHttpRequest){
        	xmlhttp=new XMLHttpRequest();
        }else{
        	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4)
            { 
            	document.getElementById("currentTxnUsername").value="";
        		document.getElementById("oldTxnPassword").value="";
        		document.getElementById("newTxnPassword").value="";
        		document.getElementById("confirmTxnPassword").value="";
            	document.getElementById('loadingContainer').style.display="none";
            	if(xmlhttp.responseText==1){
            		document.getElementById('display-message').style.display='block';
                    document.getElementById('message').style.color='green';
                    document.getElementById('display-message').style.backgroundColor='lightgreen';
                    document.getElementById('image-icon').style.backgroundImage='url(${path}/images/right-info.png)';
                    document.getElementById('display-message').style.borderColor='green';
                    document.getElementById('message').innerHTML='Congratulates ! Your have successfully changed your transaction password.';
            
            	}else if(xmlhttp.responseText==0){
            		document.getElementById('display-message').style.display='block';
                    document.getElementById('message').style.color='darkred';
                    document.getElementById('display-message').style.backgroundColor='#FFA07A';
                    document.getElementById('image-icon').style.backgroundImage='url(${path}/images/wrong-info.png)';
                    document.getElementById('display-message').style.borderColor='darkred';
                    document.getElementById('message').innerHTML='Sorry ! Invalid username or password.';
            	}
            }
          }
        xmlhttp.open("POST","${path}/ChangeTransactionPasswordServlet?currentTxnUsername="+currentTxnUsername+"&oldTxnPassword="+oldTxnPassword+"&newTxnPassword="+newTxnPassword,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send();
	}
	
	function fundTransfer() {
		var tano =document.getElementById("targetAccountNo").value.trim();
		var ta =document.getElementById("transferAmount").value.trim();
		var txnPwd =document.getElementById("transactionPassword").value.trim();
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
            	document.getElementById("mainBody").innerHTML=xmlhttp.responseText;
            	document.getElementById("mainBody").style.height="500px";
            }
          }
        xmlhttp.open("POST","${path}/CustomerFundTransferServlet?targetAccountNo="+tano+"&transferAmount="+ta+"&transactionPassword="+txnPwd,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send();
    }	
	function createChangeUsernamePasswordContainer(){
		var contents="<div id='changeUsernamePasswordContainer' class='ChangeUsernamePasswordContainer'>"+
		"<div  class='Left'>"+
			"<h2 style='color:darkblue'>Change Username</h2>"+
			"<table >"+
				"<tr><td >Old username</td></tr>"+
				"<tr><td><input type='text' id='oldUsername' name='oldUsername' maxlength='30' onkeyup='eraseError1(this)'/></td></tr>"+
				"<tr><td id='tdOldUsername' style='color:red'></td></tr>"+
				"<tr><td >New username</td></tr>"+
				"<tr><td><input type='text' id='newUsername' name='newUsername' maxlength='30' onkeyup='eraseError1(this)'  /></td></tr>"+
				"<tr><td id='tdNewUsername' style='color:red'></td></tr>"+
				"<tr><td >Login password</td></tr>"+
				"<tr><td><input type='password' id='loginPassword' name='loginPassword' maxlength='30' onkeyup='eraseError1(this)'  /></td></tr>"+
				"<tr><td id='tdLoginPassword' style='color:red'></td></tr>"+
				"<tr><td >Confirm login password</td></tr>"+
				"<tr><td><input type='password' id='confirmLoginPassword' name='confirmLoginPassword' maxlength='30' onkeyup='eraseError1(this)'  /></td></tr>"+
				"<tr><td id='tdConfirmLoginPassword' style='color:red'></td></tr>"+
				"</table><br>"+
				"<input type='button' id='changeUsernameBtn' onclick='checkChangeUsernameValidation()' value='change' style='padding:3px;width:228px;margin-left:3px;'/>"+
		"</div>"+
		"<div  class='Middle'>"+
			"<h2 style='color:darkblue'>Change login password</h2>"+
			"<table >"+
				"<tr><td >Current username</td></tr>"+
				"<tr><td><input type='text' id='currentUsername' name='currentUsername' maxlength='30' onkeyup='eraseError1(this)'/></td></tr>"+
				"<tr><td id='tdCurrentUsername' style='color:red'></td></tr>"+
				"<tr><td >Old password</td></tr>"+
				"<tr><td><input type='password' id='oldPassword' name='oldPassword' maxlength='30' onkeyup='eraseError1(this)'/></td></tr>"+
				"<tr><td id='tdOldPassword' style='color:red'></td></tr>"+
				"<tr><td >New password</td></tr>"+
				"<tr><td><input type='password' id='newPassword' name='newPassword' maxlength='30' onkeyup='eraseError1(this)'  /></td></tr>"+
				"<tr><td id='tdNewPassword' style='color:red'></td></tr>"+
				"<tr><td >Confirm password</td></tr>"+
				"<tr><td><input type='password' id='confirmPassword' name='confirmPassword' maxlength='30' onkeyup='eraseError1(this)'  /></td></tr>"+
				"<tr><td id='tdConfirmPassword' style='color:red'></td></tr>"+
				"</table><br>"+
				"<input type='button' id='changeLoginPasswordBtn' onclick='checkChangeLoginPasswordValidation()' value='change' style='padding:3px;width:228px;margin-left:3px;'/>"+
		"</div>"+
		"<div  class='Right'>"+
		"<h2 style='color:darkblue'>Change transaction password</h2>"+
		"<table >"+
			"<tr><td >Current username</td></tr>"+
			"<tr><td><input type='text' id='currentTxnUsername' name='currentTxnUsername' maxlength='30' onkeyup='eraseError1(this)'/></td></tr>"+
			"<tr><td id='tdCurrentTxnUsername' style='color:red'></td></tr>"+
			"<tr><td >Old password</td></tr>"+
			"<tr><td><input type='password' id='oldTxnPassword' name='oldTxnPassword' maxlength='30' onkeyup='eraseError1(this)'/></td></tr>"+
			"<tr><td id='tdOldTxnPassword' style='color:red'></td></tr>"+
			"<tr><td >New password</td></tr>"+
			"<tr><td><input type='password' id='newTxnPassword' name='newTxnPassword' maxlength='30' onkeyup='eraseError1(this)'  /></td></tr>"+
			"<tr><td id='tdNewTxnPassword' style='color:red'></td></tr>"+
			"<tr><td >Confirm password</td></tr>"+
			"<tr><td><input type='password' id='confirmTxnPassword' name='confirmTxnPassword' maxlength='30' onkeyup='eraseError1(this)'  /></td></tr>"+
			"<tr><td id='tdConfirmTxnPassword' style='color:red'></td></tr>"+
			"</table><br>"+
			"<input type='button' id='changeTxnPasswordBtn' onclick='checkChangeTransactionPasswordValidation()' value='change' style='padding:3px;width:228px;margin-left:3px;'/>"+
		"</div>"+
	"</div>";
	$("#mainBody").html(contents);
	}
	function createFundTransferContainer(){
		var contents="<div id='fundTransferContainer' class='FundTransferContainer'>"+
   		"<h2 Style='color: darkblue'>Fund Transfer</h2><table >"+
				"<tr><td style='color:blue;font-size:18px;'>Target Account Number</td></tr>"+
				"<tr><td><input type='text' id='targetAccountNo' name='targetAccountNo' maxlength='16' onkeyup='eraseError(this)'/></td>"+
					"<td id='tdTargetAccountNo' style='color:red'></td>"+
				"</tr>"+
				"<tr><td style='color:blue;font-size:18px;'>Amount to be transfered</td></tr>"+
				"<tr><td><input type='text' id='transferAmount' name='transferAmount' maxlength='10' onkeyup='eraseError(this)' /></td>"+
					"<td id='tdTransferAmount' style='color:red'></td>"+
				"</tr>"+
				"<tr><td style='color:blue;font-size:18px;'>Transaction password</td></tr>"+
				"<tr><td><input type='password' id='transactionPassword' name='transactionPassword' maxlength='30' onkeyup='eraseError(this)' /></td>"+
					"<td id='tdTransactionPassword' style='color:red'></td>"+
				"</tr>"+
				"<tr><td style='color:blue;font-size:18px;'>Confirm transaction password</td></tr>"+
				"<tr><td><input type='password' id='confirmTransactionPassword' name='confirmTransactionPassword' maxlength='30' onkeyup='eraseError(this)' /></td>"+
					"<td id='tdConfirmTransactionPassword' style='color:red'></td>"+
				"</tr>"+
			"</table>"+
			"<input type='button' id='fundTransferBtn' onclick='checkFundTransferValidation()' value='transfer' style='padding:3px;width:120px;margin-left:3px;'/>"+
		"</div>";
		$("#mainBody").html(contents);
	}	
		function viewAccountDetails(){
			document.getElementById('loadingContainer').style.display="block";
			$.getJSON("${path}/AccountDetails?accountNo="+${accountNo}, function(data) {
				document.getElementById('loadingContainer').style.display="none";
				if(data!=null){
					var accountDetailsContents="<div id='leftContainer' class='LeftContainer'>"+
					"<table class='AccountDetailsTable'>"+
	   				"<tr><td>First name</td><td><span>"+data.firstName+"</span></td></tr>"+
	   				"<tr><td>Last name</td><td><span>"+data.lastName+"</span></td></tr>"+
	   				"<tr><td>Father"+"'s name</td><td><span>"+data.fatherName+"</span></td></tr>"+
	   				"<tr><td>Date Of birth</td><td><span>"+data.dateOfBirth+"</span></td></tr>"+
	   				"<tr><td>Gender</td><td><span>"+data.gender+"</span></td></tr>"+
	   				"<tr><td>Nationality</td><td><span>"+data.nationality+"</span></td></tr>"+
	   				"<tr><td>Marital status</td><td><span>"+data.maritalStatus+"</span></td></tr>"+
	   				"<tr><td>Email id</td><td><span>"+data.emailId+"</span></td></tr>"+
	   				"<tr><td>Mobile no</td><td><span>"+data.mobileNo+"</span></td></tr>"+
	   				"<tr><td>Address</td><td><span>"+data.address+"</span></td></tr>"+
	   			"</table></div>"+
	   			"<div id='rightContainer' class='RightContainer'>"+
	   				"<table class='AccountDetailsTable'>"+
	   				"<tr><td>Photograph</td><td><div id='photographContainer' class='PhotographContainer'></div></td></tr>"+
	   				"<tr><td>&nbsp</td><td><span></span></td></tr>"+
	   				"<tr><td>Username</td><td><span>"+data.loginId+"</span></td></tr>"+
	   				"<tr><td>Account no</td><td><span>"+data.accountDTO.accountNo+"</span></td></tr>"+
	   				"<tr><td>Account type</td><td><span>"+data.accountDTO.accountType+"</span></td></tr>"+
	   				"<tr><td>Opening date</td><td><span>"+data.accountDTO.accountOpeningDate+"</span></td></tr>"+
	   				"<tr><td>Available balance</td><td><span>"+data.accountDTO.netBalance+" /-</span></td></tr>"+
	   			"</table></div>";
	   			$("#mainBody").html(accountDetailsContents);
			}else{
				var contents="<h2 style='color:red'>Sorry ! Account does not exist.</h2>";
				$("#mainBody").html(contents);
			}
			});
		}
		function viewQuickTransaction(){
			document.getElementById('loadingContainer').style.display="block";
			$.getJSON("${path}/QuickTransactionServlet?accountNo="+${accountNo}, function(data) {
				document.getElementById('loadingContainer').style.display="none";
				if(data!=null){
					var transactionDetailsContents="<div id='transactionDetailsContainer' class='TransactionDetailsContainer'>"+
           			"<span>Login Date : </span><span id='loginDateId'>28-07-2014</span><br>"+
           			"<span>Account Number : </span ><span id='accountNoId'></span><br>"+
           			"<span>Account Holder Name : </span ><span id='accountHolderNameId'></span><br><hr><br>"+
           			"<table id='transactionDetailsTbl'><thead ><tr><th>Transaction Id</th><th>Transaction Date</th><th>Debit</th><th>Credit</th><th>Description</th><th>Target Acc No</th><th>Net Balance</th></tr></thead>"+
           				   "<tbody id='tbodyId'></tbody>"+
           			"</table><br></div>";
           			$("#mainBody").html(transactionDetailsContents);
					//$("#tbodyId").html("");
					$("#accountNoId").html(data.accountNo);
					$("#accountHolderNameId").html(data.firstName+" "+data.lastName);
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
						$("#tbodyId").append(dataString);
						dataString="";
					});
					
				}else{
					$("#mainBody").html("<h2 style='color:red'>Sorry ! Account does not exist</h2>");
				}
			});
		}
		$(document).ready(function(){
			
			$("#viewAccount").click(function(){
				viewAccountDetails();
			});
			$("#fundTransfer").click(function(){
				createFundTransferContainer();
			});
			$("#quickTransaction").click(function(){
				viewQuickTransaction();
			});
			$("#changePassword").click(function(){
				createChangeUsernamePasswordContainer();
			});
			
		});
	</script>
	
</head>
<body>
	<div class="MainContainer">
            <div class="HeaderContainer">
                <%@include file="../includes/header.inc.jsp" %>
                <div class="MenuContainer">
                	<jsp:include page="../includes/customerMenu.inc.jsp" />
	            </div>
	            <jsp:include page="../includes/message.inc.jsp" />
           </div>
           <div id="mainBody" class="MainBody" >
           		<div id="leftContainer" class="LeftContainer">
           			<h2 style="color:darkblue">Welcome to Hindustan Bank</h2>
           			<div style="height:300px;width:500px;background-size:500px 300px;background-image:url('${path}/images/online.jpg');"></div>
           		</div>
           		
           		<div class="SideBarContainer">
                	<div class="QuickLinksBoard">
                   	 <span style="color:red;font-size: 20px;margin-left: 120px">Quick Links</span>
                    	<marquee height="110" onmouseover="this.stop()" onmouseout="this.start()" behavior="scroll" direction="up" scrollamount="2"> 
                        <a href="${path }/index.jsp" style="color:green;font-size:14px;">Goto Home Page</a><br>
                        <a href="" style="color:green;font-size:14px;">My Account</a><br>
                        <a href="" style="color:green;font-size:14px;">View Account Details</a><br>
                        <a href="" style="color:green;font-size:14px;">Fund Transfer</a><br>
                        <a href="" style="color:green;font-size:14px;">View Quick Transaction</a><br>
                        <a href="${path }/jsp/sevices.jsp" style="color:green;font-size:14px;">About Hindustan Bank Services</a><br>
                        <a href="${path }/jsp/aboutUs.jsp" style="color:green;font-size:14px;">About Hindustan Bank</a><br>
                    	</marquee>
                	</div><br>
                	<img style="border: 1px solid green;margin-left:8px" src="${path }/images/operator.png">
            	</div>
            	
           </div>
	</div>
	<div id="footer" class="Footer">
            <%@include  file="../includes/footer.inc.jsp" %>
            &nbsp;
    </div>
</body>
</html>