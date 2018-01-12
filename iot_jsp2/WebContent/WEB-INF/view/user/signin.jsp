<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
<body class="moon">
	
 <div id="login-box" >
  <div class="left">
    <h1>Sign up</h1>
    
    <input class="forsingup" type="text" id="uiName" name="uiName" placeholder="이름" />
    <input class="forsingup" type="text" id="uiAge" name="uiAge" placeholder="나이" />
    <input class="forsingup" type="text" id="uiId" name="uiId" placeholder="ID" />
    <input class="forsingup" type="password" id="uiPwd" name="uiPwd" placeholder="Password" />    
    <select class="cussel forsingup" name="ciNo" id="ciNo" >
	</select>	
	<input class="forsingup" type="text" id="address" name="address" placeholder="주소" />    
    <input class="forsingup" type="button" class="butbut" name="signup_submit" value="Sign me up" onclick="signin()" />
  </div>
 <div class="right">
    <span class="loginwith"><br/></span>
  </div>  
 </div>
</body>
<script>
function signin(){
	//"uiName,uiAge,uiId,uiPwd,ciNo,address"
	var uiName = $("#uiName").val().trim();
	var uiAge = $("#uiAge").val().trim();
	var uiId = $("#uiId").val().trim();
	var uiPwd = $("#uiPwd").val().trim();
	var ciNo = $("#ciNo").val();
	var address = $("#address").val().trim();
	var param= {uiName:uiName, uiAge:uiAge, uiId:uiId, uiPwd:uiPwd,ciNo:ciNo,address:address};
	param = "param=" + JSON.stringify(param);
	$.ajax({
		url : '/user/signin',
		type : 'post',
		data : param,
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result=="ok"){
				location.href="<%=rootPath%>/";
			}
		},
		error:function(xhr,status,error){			
		}		
	})
}
$(document).ready(function(){
	$.ajax({
		url : '/class/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str = "";
			for(var ci of list){
				str += "<option value='" + ci.ciNo + "'>" + ci.ciName +"</option>";
			}
			//document.getElementById("ciNo").insertAdjacentHTML("beforeend",str);
			$("#ciNo").html(str);
		},
		error:function(xhr,status,error){			
		}
	});	
});
</script>
</html>