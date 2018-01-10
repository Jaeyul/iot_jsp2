<%
if(user==null){
	//response.sendRedirect("/view/user/login");
}else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IOT_TEST</title>
</head>

<body class="moon" onload="myFunction()">
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	<div class="container" style="border-color : white">
	 
      <div class="star" style= "color: white">       
        <h1 class="h1bt">We welcome to <span class="pen"><%=user.getUiName()%></span></h1>        
        <p><h2>The secret to creativity is knowing</h2></p>
        <p><h2> how to hide your source.</h2></p>           
        <p id="demo"></p> 
		<p class="lead"><br></p>      
      </div>            
      
	  
        
</div><!-- /.container -->      
</body>
<script>
function myFunction() {
    var d = new Date();
    var n = d.toLocaleTimeString();
    document.getElementById("demo").innerHTML = n;
    
    setTimeout(myFunction, 1000);
}
</script>

</html>
<%
}
%>