<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/common.css">
        <link rel="stylesheet" type="text/css" href="../css/login.css">
        <title>Login | Hindustan Bank</title>
        <script src="//connect.facebook.net/en_US/all.js"></script>
        <script>
        window.fbAsyncInit = function() {
            FB.init({
              appId      : '450826335060531', // Set YOUR APP ID
              channelUrl : 'http://localhost:8081/BankingSystem/index.jsp', // Channel File
              status     : true, // check login status
              cookie     : true, // enable cookies to allow the server to access the session
              xfbml      : true  // parse XFBML
            });
         
            FB.Event.subscribe('auth.authResponseChange', function(response) 
            {
             if (response.status === 'connected') 
            {
                document.getElementById("message").innerHTML +=  "<br>Connected to Facebook";
                //SUCCESS
         
            }    
            else if (response.status === 'not_authorized') 
            {
                document.getElementById("message").innerHTML +=  "<br>Failed to Connect";
         
                //FAILED
            } else 
            {
                document.getElementById("message").innerHTML +=  "<br>Logged Out";
         
                //UNKNOWN ERROR
            }
            }); 
         
            };
         
            function Login()
            {
         
                FB.login(function(response) {
                   if (response.authResponse) 
                   {
                        getUserInfo();
                    } else 
                    {
                     console.log('User cancelled login or did not fully authorize.');
                    }
                 },{scope: 'email,user_photos,user_videos'});
         
            }
         
          function getUserInfo() {
                FB.api('/me', function(response) {
         
              var str="<b>Name</b> : "+response.name+"<br>";
                  str +="<b>Link: </b>"+response.link+"<br>";
                  str +="<b>Username:</b> "+response.username+"<br>";
                  str +="<b>id: </b>"+response.id+"<br>";
                  str +="<b>Email:</b> "+response.email+"<br>";
                  str +="<input type='button' value='Get Photo' onclick='getPhoto();'/>";
                  str +="<input type='button' value='Logout' onclick='Logout();'/>";
                  document.getElementById("status").innerHTML=str;
         
            });
            }
            function getPhoto()
            {
              FB.api('/me/picture?type=normal', function(response) {
         
                  var str="<br/><b>Pic</b> : <img src='"+response.data.url+"'/>";
                  document.getElementById("status").innerHTML+=str;
         
            });
         
            }
            function Logout()
            {
                FB.logout(function(){document.location.reload();});
            }
         
          // Load the SDK asynchronously
          (function(d){
             var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
             if (d.getElementById(id)) {return;}
             js = d.createElement('script'); js.id = id; js.async = true;
             js.src = "//connect.facebook.net/en_US/all.js";
             ref.parentNode.insertBefore(js, ref);
           }(document));
	</script>
	        
        
        
        
        <script>
            function setBorderColor(id)
            {
                if(id.value!="") 
                    {
                        id.style.borderColor="silver";
                        document.getElementById('usernameError').innerHTML="";
                        document.getElementById('passwordError').innerHTML="";
                    }
            }
            function login()
            {
                if(document.getElementById('username').value=="")
                    {
                        document.getElementById('username').style.borderColor="red";
                        document.getElementById('usernameError').innerHTML="Please enter username";
                        document.getElementById('username').focus();
                    }
                else if(document.getElementById('password').value=="")
                    {
                        document.getElementById('password').style.borderColor="red";
                        document.getElementById('passwordError').innerHTML="Please enter login password";
                        document.getElementById('password').focus();
                    }
                else
                    {                   
                        document.forms[0].submit();
                    }
               
            }
           
            
           
           function submit_me(id,event)
           {
               keyvalue=event.charCode;
               if(keyvalue==13)
                   {
                       if(id.name=='password')
                           {
                               login();
                           }
                   }
           }
        </script>
    </head>
    <body>
        <div class="MainContainer">
            <div class="HeaderContainer">
                <jsp:include page="../includes/header.inc.jsp" />
                <div class="MenuContainer">
                	<jsp:include page="../includes/visitorMenu.inc.jsp" />
            	</div>
            	<jsp:include page="../includes/message.inc.jsp" />
            </div>
            <form  action="<%=pageContext.getServletContext().getContextPath() %>/LoginServlet" method="POST">
            <div class="SignIn">
                <h2>Login to your Account</h2><h4>We are happy to see you return! Please log in to continue.</h4>
                <table>
                    <tr><td><span>Username</span><br><input id="username" onChange="setBorderColor(this)" onkeyup="setBorderColor(this)" name="username" type="text" maxlength="30" required>
                            <div style="height:20px;font-size:13px;">
                                <span id="usernameError" style="color:red;"></span>
                            </div>
                        </td>
                    </tr>
                    <tr><td><span>Password</span><br><input id="password" onkeypress="submit_me(this,event)" onkeyup="setBorderColor(this)" name="password" type="password" maxlength="30" required>
                            <div style="height:20px;font-size:13px;">
                                <span id="passwordError" style="color:red;"></span>
                            </div>
                        </td>
                    </tr>
                </table>

                <input id="remember-me" type="checkbox" value="Remember me" style="width:15px;"  />Remember me<br><br>
                <input id="login-now" onclick="login()" type="button" style="border-radius: 25px;width:150px;height: 35px;background-image: url('../images/login-icon.png');" /><br>&nbsp;
                <hr>  
            </div>
            </form>            
            <div class="LoginImageContainer">
            	<div class="LoginImage"></div>                  
            </div><br> 
            <div id="status">
 Click on Below Image to start the demo: <br/>
<img src="http://hayageek.com/examples/oauth/facebook/oauth-javascript/LoginWithFacebook.png" style="cursor:pointer;" onclick="Login()"/>
</div>
 
<br/><br/><br/><br/><br/>
 
<div id="message">
Logs:<br/>
</div>          
    </div>
       
    <div class="Footer">
        <jsp:include page="../includes/footer.inc.jsp" />&nbsp;
    </div>
    </body>
</html>
