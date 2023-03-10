<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<title>SHOOKREAM</title>
<!-- <script src="js/jquery-3.6.3.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style type="text/css">
#sform {
          display: inline-block;
          text-align: center;
        }
        
#dbCheckId {
		display:inline;
      box-sizing: border-box;
}
table.type03 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1.5px solid #ccc;
  border-left: 1.5px solid #ccc;
  margin-left:auto; 
  margin-right:auto;
}
table.type03 th {
  width: 147px;
  padding: 10px;
  font-weight: bold;
  font-size : 17px;
  vertical-align: top;
  color: #828282; 
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  height: 90px;
  width: 300px;

}
table.type03 td {
  height: 90px;
  width: 700px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
</style>
<style>
.w3-sidebar a {font-family: "Noto Sans KR", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Noto Sans KR", sans-serif;}
</style>


<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
var idStatus = false;
var passwdStatus = false;
var phoneStatus = false;
var emailStatus = false;

$(function() {
	$("#id").on("keyup", function() {
		let id = $("#id").val();
		
		let regex = /^[A-Za-z0-9-_.]{5,20}$/;
		if(!regex.exec(id)) {
			$("#checkIdSpan").html("????????? ????????? ???????????????").css("color", "red");
			idStatus = false;
		} else {
			$("#checkIdSpan").html("????????? ????????? ???????????????").css("color", "blue");
			idStatus = true;
		}
	});
	
	$("#pass").on("keyup", function() {
		let pass = $("#pass").val();
		
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/; // ?????? ????????? ??????
		
		let engUpperRegex = /[A-Z]/; // ?????????
		let engLowerRegex = /[a-z]/; // ?????????
		let numRegex = /[0-9]/; // ??????
		let specRegex = /[!@#$%]/; // ????????????
		
		if(!lengthRegex.exec(pass)) {
			$("#checkPasswdResult").html("?????? ???????????? ????????????").css("color", "red");
			passwdStatus = false;
		} else {

			let count = 0; // ??? ????????? ?????? ????????? ????????? ??? ?????? ??????
			
			if(engUpperRegex.exec(pass)) { count++ };
			if(engLowerRegex.exec(pass)) { count++ };
			if(numRegex.exec(pass)) { count++ };
			if(specRegex.exec(pass)) { count++ };
			
			passwdStatus = true;
			switch(count) {
				case 4 : $("#checkPasswdResult").html("??????").css("color", "green"); break;
				case 3 : $("#checkPasswdResult").html("??????").css("color", "orange"); break;
				case 2 : $("#checkPasswdResult").html("??????").css("color", "gray"); break;
					case 1 : 
							$("#checkPasswdResult").html("?????? ???????????? ????????????").css("color", "red");
							passwdStatus = false;
			}
			
		}
	});
	
// 		????????? ??????
// 		$("#email").on("change", function() {
// 			let email = $("#email").val();
			
// // 			let regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 			let regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
// 			if(!regex.exec(email)) {
// 				$("#emailCheckResult").html("????????? ????????? ???????????????").css("color", "red");
// 				emailStatus = false;
// 			} else {
// 				$("#emailCheckResult").html("????????? ????????? ???????????????").css("color", "blue");
// 				emailStatus = true;
// 			}
// 		});
		
		// ???????????? ??????
		$("#phone").on("change", function() {
			let phone = $("#phone").val();
			
			let regex =/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$/;
			if(!regex.exec(phone)) {
				$("#phoneCheckResult").html("????????? ???????????? ???????????????").css("color", "red");
				phoneStatus = false;
			}else {
				$("#phoneCheckResult").html("????????? ???????????? ???????????????").css("color", "blue");
				phoneStatus = true;
				}
			});
		
		$("#domain").on("change", function() {
			$("#email2").val($(this).val());
			
			if($(this).val() == "") {
				$("#email2").prop("readonly", false);
				$("#email2").css("background-color", "white");
				$("#email2").focus();
			} else {
				$("#email2").prop("readonly", true);
				$("#email2").css("background-color", "lightgray");
			}
		});
		
		});
		
</script>
</head>
<body class="w3-content" style="max-width:95%">

<!-- Sidebar/menu -->
<jsp:include page="../inc/side.jsp"/>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide">SHOOKREAM</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px;margin-top: 20px;margin-right: 17px;">
	
 <!-- Push down content on small screens -->
 <div class="w3-hide-large" style="margin-top:83px"></div>
 
 <!-- Top header -->
 <div style="float: right;">
 <jsp:include page="../inc/top.jsp"/>
</div>

  <!-- ???????????? ??? -->
  
  <div style="padding: 50px 80px;">
  	<form action="MemberJoinPro.me" method="post" id="joinForm" name="joinForm" style="margin-bottom: 150px">
			<h1 style="text-align: center; padding-top: 60px;">????????????</h1>
			<h6 style="color: gray;text-align: center;margin-bottom: 50px" >SHOOKREAM??? ?????? ?????? ???????????????.</h6>
<!-- 		    <h3 class="w3-wide" ><b>SHOOKREAM</b></h3> -->
			
			
			<div>
				<table class="type03">
					<tr>
						<th scope="row">?????????</th>
						<td>
						<input type="text" name="member_id" id ="id" required size="20px" style="line-height: 30px" onkeydown="inputIdChk()" > &nbsp;
						<button class="btn btn-dark" name="dbCheckId" id="dbCheckId" onclick="fn_dbCheckId()">?????? ??????</button>
<!-- 						<button type="button" class="btn btn-secondary" name="dbCheckId" id="dbCheckId" onclick="fn_dbCheckId()">ID check</button> -->
						<input type="hidden" name="isCheckId" value="idUncheck"/>		
						<br>
						<span style="color: gray;" >(?????? ?????????/??????/????????????(-_.) ????????????, 5~20???)</span> &nbsp;
						<span id="checkIdSpan"></span>
						</td>
					</tr>
					<tr>
						<th scope="row">????????????</th>
						<td>
						<input type="password" name="member_pass" id ="pass" required size="20px" style="line-height: 30px" onkeyup="checkPasswd(this.value)">&nbsp; <span id="checkPasswdResult"></span><br>
						<span style="color: gray;">(?????? ??? ?????????/??????/????????????(!@#$%) ??? 2?????? ?????? ??????, 8~16???)</span>
						
						</td>
					</tr>
					<tr>
						<th scope="row">???????????? ??????</th>
						<td>
						<input type="password" name="pass2" required size="20px" style="line-height: 30px" onkeyup="reCheckPasswd(this.value)">&nbsp; <span id ="recheckResult"></span><br>
						<span style="color: gray;">(???????????? ????????? ?????? ???????????? ??????????????????.)</span>
						</td>
					</tr>
					<tr>
						<th scope="row">??????</th>
						<td>
						<input type="text" name="member_name" required size="20px"style="line-height: 30px" ><br>
						<span style="color: gray;">(????????? ??????????????????.)</span>
					
						
						</td>
					</tr>
					<tr>
						<th scope="row">??????</th>
						<td>
						<input type="text" name="address1" id="address_kakao2" required size="30px" style="margin-bottom: 10px;line-height: 30px"> &nbsp;
						<button id="address_kakao" class="btn btn-dark">????????????</button><br>
						<input type="text" name="address2"  size="30px" style="line-height: 30px" ><br>
						<span style="color: gray;">(?????? ????????? ??????????????????.)</span>
						</td>
					</tr>
					<tr>
						<th scope="row">????????????</th>
						<td>
						<input type="text" name="member_phone" id="phone" required size="20px" style="line-height: 30px" >&nbsp; <span id ="phoneCheckResult"></span><br>
						<span style="color: gray;">("-"??? ????????? ??????????????? ??????????????????. ex)01011111111 )</span>
						</td>
					</tr>
					<tr>
						<th scope="row">?????????</th>
						<td>
						<input type="text" name="email1" id="email1" placeholder="" required size="15px" style="line-height: 30px"> @
						<input type="text" name="email2" id="email2" placeholder="" required size="15px" style="line-height: 30px">
						<select name="selectDomain" id="domain"  style="padding: .4em .5em; ">
						<option value="">????????????</option>	
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						</select> &nbsp;
						<input type="button" class="btn btn-dark" id="checkEmail"  value="?????? ?????? ??????" onclick="alert('????????? ?????? ??????!')"><br>
						<span style="color: gray">("@"??? ???????????? ???????????? ??????????????????. ex) abcd@gmail.com)</span><br>
						
<!-- 						<input type="text" name="email" id="email" placeholder="" required size="20px" style="line-height: 30px"> &nbsp; -->
<!-- 						<input type="button" class="btn btn-dark" id="checkEmail"  value="?????? ?????? ??????" onclick="alert('????????? ?????? ??????!')"><br> -->
<!-- 						<span style="color: gray">("@"??? ???????????? ???????????? ??????????????????. ex) abcd@gmail.com)</span><br> -->
						
						
						<div id ="authResult">
						<input type="text" name="authCode" id="authCode" size="20px" style="line-height: 30px" required="required"> &nbsp;
						<input type="button" class="btn btn-dark" id="checkEmail2"  value="?????? ??????"><br>
						<span style="color: gray">(???????????? 6????????? ???????????????)</span> &nbsp;
						<span id="authEmailResult"></span>
						</div>
						</td>
						
					</tr>
					<tr>
						<td colspan="2" align="center"><button type="submit" id="join_btn" name ="join" class="btn btn-dark"  onclick="fn_joinMember()">????????????</button></td>
					</tr>
				</table>

			</div>

		</form>
</div>

  <br>
  <!-- Footer -->
  <jsp:include page="../inc/footer.jsp"/>
 </div>	
<!--   <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div> -->
<!-- ????????? ?????? ??? -->
  <!-- End page content -->


<!-- Newsletter Modal -->
<div id="newsletter" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom" style="padding:32px">
    <div class="w3-container w3-white w3-center">
      <i onclick="document.getElementById('newsletter').style.display='none'" class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
      <h2 class="w3-wide">NEWSLETTER</h2>
      <p>Join our mailing list to receive updates on new arrivals and special offers.</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('newsletter').style.display='none'">Subscribe</button>
    </div>
  </div>
</div>

<c:set var="contextPath" value="<%= request.getContextPath()%>"/>
<!-- ------------------------------------------------------------------------------------------------------------>
<!-- ?????????????????? ?????? -->
<script type="text/javascript">
// 	var isIdCheck = false;
	var isEmailAuth = false;
	
function fn_joinMember() {
	var joinForm = document.joinForm;
	
	if(joinForm.isCheckId.value != "idCheck"){
		alert("ID ??????????????? ????????????!")
		event.preventDefault(); // submit ?????? ??????
	
	} else if(idStatus == false) {
		alert("ID??? ??????????????????!")
		event.preventDefault(); // submit ?????? ??????
	} else if(passwdStatus == false) {
		alert("??????????????? ??????????????????!")
		event.preventDefault(); // submit ?????? ??????
	}else if(phoneStatus == false) {
		alert("??????????????? ??????????????????!")
		event.preventDefault(); // submit ?????? ??????
	}
	
// 	else if(emailStatus == false) {
// 		alert("???????????? ??????????????????!")
// 		event.preventDefault(); // submit ?????? ??????
// 	}
}

// window.opener.isIdCheck = true;

function fn_dbCheckId() {
	var id = document.getElementById("id").value;
// 	if(id.length == 0 || id == ""){
// 		alert("???????????? ??????????????????.");
// 		joinForm.id.focus();
// 	}
// 	else 
	if(id.length >= 5 && id.length <= 20){
		window.open("dbCheckId.me?member_id="+id,"","width=500, height=200, left=600, top=300");
	}else{
		alert("5 ~ 20 ????????? ??????????????????.");
		joinForm.id.focus();
	}
// 		if(id.length > 16 && id.length < 8) {
// 		alert("8 ~ 16 ????????? ??????????????????.");
// 		joinForm.id.focus();
// 	}else{
// 		window.open("dbCheckId.me?member_id="+id,"","width=500, height=200, left=600, top=300");
// 		window.open("http://localhost:8080/Project/dbCheckId.me?member_id="+id,"","width=500, height=300");
	
}
			
function reCheckPasswd(pass2) {//????????? ?????? 
	var pass = document.getElementById("pass").value;
// 	var pass2 = document.getElementById("pass2").value;
	let spanRecheckResult = document.getElementById("recheckResult");

	if(pass == pass2){
		spanRecheckResult.innerHTML = "????????? ???????????? ?????????";
		spanRecheckResult.style.color = "BLUE";
		passwdStatus = true;		
	}else{
		spanRecheckResult.innerHTML = "???????????? ?????? ???????????? ?????????";
		spanRecheckResult.style.color = "RED";  
		passwdStatus = false;
		event.preventDefault(); // submit ?????? ??????
	}
}


function inputIdChk(){
	var joinForm = document.joinForm;
	var dbCheckId = document.joinForm.dbCheckId;
	document.joinForm.isCheckId.value = "idUncheck";
	dbCheckId.disabled=false;
	openJoinfrm.dbCheckId.style.opacity=1;
	openJoinfrm.dbCheckId.style.cursor="pointer";
}


// function checkPasswd(passwd) { // ???????????? ?????? ??????
// 	let spanCheckPasswdResult = document.getElementById("checkPasswdResult");

// 	if(passwd.length >= 8 && passwd.length <= 16) {
// 		spanCheckPasswdResult.innerHTML = "?????? ????????? ???????????? ?????????";
// 		spanCheckPasswdResult.style.color = "BLUE";    		
// 	} else {
// 		spanCheckPasswdResult.innerHTML = "8 ~ 16?????? ???????????????";
// 		spanCheckPasswdResult.style.color = "RED";
// 		event.preventDefault(); // submit ?????? ??????

// 	}
// }


	/* ????????? ?????? 1 */
	$(function() {
		$("#joinForm").submit(function() { // ??? ?????????
			// ????????? ??????, ????????? ?????? ?????? 
// 			if($("") != "idCheck"){ //
// 				alert("ID ??????????????? ????????????!")
// 				event.preventDefault(); // submit ?????? ??????
// 			}	
		
			// ????????? ?????? ??????
			if(!isEmailAuth) { 
				
// 				alert(isEmailAuth); 
				alert("Email ????????? ?????? ????????????!");
				event.preventDefault(); // submit ?????? ??????
				
				return false; // submit ??????
			}
// 				alert(isEmailAuth); 
				alert("Email ?????? ??????!");
				return true; // submit ??????
		});
		
			$("#checkEmail").on("click", function() {

				$.ajax({
					type: "get",
		            url: "CheckEmailAddress.me",
		            data: {
		               id: $("#id").val(),
		               authCode: $("#authCode").val(),
		               email1: $("#email1").val(),
		               email2: $("#email2").val()
		            }
				    
		         });
			});
			
		/* ????????? ?????? 2 */
		$("#checkEmail2").on("click", function() {
				/* var chkAuth = $("#authCode").val();
				alert(chkAuth); */
				$.ajax({
					type: "get",
		            url: "CompareEmailAddress.me",
		            data: {
		               id: $("#id").val(),
		               authCode: $("#authCode").val()
		            },
		            datatype: "html",
					success:function(data){
						const isSuccess = $.trim(data);
// 						alert(isSuccess);
						if(isSuccess == "true"){ 
							
							alert("?????? ??????");
	                	  	 $("#authEmailResult").html("?????? ??????!").css("color", "blue");
// 	                	  	 $("#authResult").reload(window.location.href + " #authResult");
	                	  	 isEmailAuth = true;
// 	                	  	 alert(isEmailAuth);
	    	            } else {
							alert("?????? ??????");
							 $("#authEmailResult").html("?????? ??????!").css("color", "red");
// 							 event.preventDefault(); // submit ?????? ??????
// 							 $('join_btn').prop('disabled', false);
// 							 $("#authResult").reload(window.location.href + " #authResult");
	                	  	 isEmailAuth = false;
// 	                	  	alert(isEmailAuth);
	    	            }//else
					
					}//success
		         
				});//ajax
			});
		});
	
	
	

	


// Accordion 
function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}

function myAccFunc1() {
	  var x = document.getElementById("cusAcc");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}

// Click on the "Jeans" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();


// Open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "552ea0bb-d4a5-4c70-8ba7-463b7682c434"
  });
</script>
<!-- End Channel Plugin -->

<!-- ????????? ?????? API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //?????????????????? ????????????
        //????????? ?????? ??????
        new daum.Postcode({
            oncomplete: function(data) { //????????? ????????? ??????
                document.getElementById("address_kakao2").value = data.address; // ?????? ??????
                document.querySelector("input[name=address_detail]").focus(); //???????????? ?????????
            }
        }).open();
    });
}
</script>



</body>
</html>