<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
 <div id="login-box" >
  <div class="left">
    <h1>Class Open</h1>
    
    <input type="text" id="ciName" name="ciName" placeholder="반이름" />
    <input type="text" id="ciDesc" name="ciDesc" placeholder="상세정보" /> 
    <input type="button" class="butbut" name="signup_submit" value="Open" onclick="insertClass()" />  
  </div>
  
 <div class="right">
    <span class="loginwith"><br/></span>
    
  </div>  
 </div>
	
</body>


<script>
function insertClass(){	
	var ciName = $("#ciName").val().trim();
	var ciDesc = $("#ciDesc").val().trim();
	
	var param= {ciName:ciName, ciDesc:ciDesc};
	
	param = "param=" + JSON.stringify(param);	
	
	$.ajax({
		url : '/class/insert',
		type : 'post',
		data : param,
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result=="ok"){
				
				location.href="<%=rootPath%>/view/class/list";
			}
		},
		error:function(xhr,status,error){
			
		}		
	});	
}
	


</script>

</html>