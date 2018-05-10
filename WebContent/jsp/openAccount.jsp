<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/common.css" />
		<link rel="stylesheet" type="text/css" href="../css/openAccount.css" />
		<title>Open Account | Hindustan Bank</title>
	</head>
	<script src="${path }/jquery/jquery-1.9.0.min.js"></script>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$("#photograph").change(function(){
				var imageObj=document.getElementById("photograph");
				var imagePath=imageObj.value;
				if (imagePath =="") {
					alert("plz select an image");
				} else {
					if (imageObj.files && imageObj.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$("#pImage").attr("src",e.target.result);
						}
						reader.readAsDataURL(imageObj.files[0]);
					}
				}	
			});
		});
	</script>
<body>
<div class="MainContainer">
            <div class="HeaderContainer">
                <%@include file="../includes/header.inc.jsp" %>
                <div class="MenuContainer">
                	<jsp:include page="../includes/adminMenu.inc.jsp" />
	            </div>
	            <jsp:include page="../includes/message.inc.jsp" />
           </div>
           <div class="MainBody"><center><h2 Style="color:darkblue">New Account Opening Form</h2><hr></center>              
           	<form action="<%=pageContext.getServletContext().getContextPath() %>/OpenAccount" enctype="multipart/form-data" method="post">
           		<div class="LeftContainer">
           			<table id="tbl-account-opening">
           				<tr><td>First name</td><td><input required type="text" name="firstName"  /></td></tr>
           				<tr><td>Last name</td><td><input required type="text" name="lastName" /></td></tr>
           				<tr><td>Father's name</td><td><input required type="text" name="fatherName" /></td></tr>
           				<tr><td>Date of birth</td><td><input required type="date" name="dateOfBirth" /></td></tr>
           				<tr><td>Gender</td>
           					<td><select required id="selectGender" name="gender" style="width:290px;color: blue; font-size:16px;padding: 5px;">
		                          <option value="">Select Gender</option>
		                          <option value="Male">Male</option>
		                          <option value="Female">Female</option>
		                        </select>
                          </td>
           				</tr>
           				<tr><td>Nationality</td>
           					<td><select required id="selectNationality" name="nationality" style="width:290px;color: blue; font-size:16px;padding: 5px;">
		                          <option value="">Select Nationality</option>
		                          <option value="Indian">Indian</option>
		                          <option value="Other">Other</option>
		                        </select>
		                   </td>
		                </tr>
           				<tr><td>Marital status</td>
           					<td><select required id="selectMaritalStatus" name="maritalStatus" style="width:290px;color: blue; font-size:16px;padding: 5px;">
		                          <option value="">Select Marital Status</option>
		                          <option value="Married">Married</option>
		                          <option value="Unmarried">Unmarried</option>
		                        </select>
		                   </td>
		                </tr>
           				<tr><td>Account type</td>
           					<td><select required id="selectAccountType" name="accountType" style="width:290px;color: blue; font-size:16px;padding: 5px;">
		                          <option value="">Select Account Type</option>
		                          <option value="Saving">Saving</option>
		                          <option value="Current">Current</option>
		                          <option value="Credit">Credit</option>
		                        </select>
		                   </td></tr>
           				<tr><td>Balance</td><td><input type="text" name="balance" /></td></tr>
           			</table>
           		</div>
               	<div class="RightContainer">
               		<table id="tbl-account-opening">
           				<tr><td></td>
           					<td><div id="photographContainer" class="PhotographContainer">
           						<img  src="" id="pImage" height="110px" width="108px"> 
           						</div>
           						
           					</td>
           				</tr>
           				<tr><td>Upload image</td><td><input required type="file" id="photograph" name="photograph" style="margin-left:-3px;" /></td></tr>
           				<tr><td>Email id</td><td><input required  type="text" name="emailId" /></td></tr>
           				<tr><td>Mobile no</td><td><input required type="text" name="mobileNo" maxlength="10" /></td></tr>
           				<tr><td>Address</td><td><textarea required name="address" rows="3" cols="24" style="margin-left:0px;color:blue;font-size:18px"></textarea></td></tr>
           				<tr><td></td><td><input id="btnSubmit" type="submit" value="submit" style="width:142px" />
           				<input id="btnReset" type="reset" value="clear" style="width:142px"/></td>
           				</tr>
           			</table>
               	</div>
               </form>
           </div>
	</div><br><br>
        <div id="footer" class="Footer">
            <%@include  file="../includes/footer.inc.jsp" %>
            &nbsp;
        </div>  
</body>
</html>