<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body style="background :url('http://img.insight.co.kr/upload/2015/12/26/ART151226123327R9HE3H2B.jpg'); background-size: cover" >
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	<br>
	 <h1 class="h1c">User List</h1>	
	 
	 
	    <table class="tbc" cellpadding="0" cellspacing="0" border="0" id="grid1" data-key="uiNo">
	      <thead>
	        <tr>
	          <th class="thc" data-field="uiNo,ro" >번호</th>
	          <th class="thc" data-field="uiName,txt">이름</th>
	          <th class="thc" data-field="uiAge,txt">나이</th>
	          <th class="thc" data-field="uiId,ro">ID</th>
	          <th class="thc" data-field="uiRegdate,ro">가입일자</th>
	          <th class="thc" data-field="address,txt">주소</th>	          
	          <th class="thc" data-field="BTN">버튼</th>
	        </tr>
	      </thead>	  
	      <tbody id="result_tb">
	      </tbody>
		</table>		
	
	
	<div style="margin-top : 10px; margin-left : 80%">
	<input type="text"><a class='btn btn-danger' onclick='searchUser()'><em class='glyphicon glyphicon-search'></em></a>
	</div>
	
	
	
	
	
</body>
<script>









function deleteUser(uiNo){
	
	var isDelete = confirm("정말로 삭제하겠습니까?");
	
	var param = "uiNo=" + uiNo;
	if(isDelete){
		$.ajax({
			url : '/user/delete',			
			type : 'post',
			data : param,
			dataType : 'Json',
			success:function(res){
				alert(res.msg);
				if(res.result=='ok'){
					location.reload();					
				}
			},
			error:function(xhr,status,error){
				
			}			
		});		
	}	
}

function updateUser(uiNo){
		
		var uiName = $("#uiName" + uiNo).val().trim();
		var uiAge = $("#uiAge" + uiNo).val().trim();
		var address = $("#address" + uiNo).val().trim();
		
		var param = {
				uiNo : uiNo,
				uiName : uiName,
				uiAge : uiAge,
				address : address			
		}
		
		param = "param=" + JSON.stringify(param);		
		
		$.ajax({
			url : '/user/update',			
			type : 'post',
			data : param,
			dataType : 'Json',
			success:function(res){
				alert(res.msg);
				if(res.result=='ok'){
					location.reload();					
				}
			},
			error:function(xhr,status,error){
				
			}			
			
			
		})	
}

//var colsInfo = new Array();  아래의 []와 동일하다.
var colsInfo = [];

$(document).ready(function(){
	var colList = $("#grid1 th[data-field]");
	for(var i=0; i<colList.length; i++){		
		//colsInfo[colsInfo.length]
		colsInfo.push(colList[i].getAttribute("data-field"));		
	}
	
	var keyCol =$("#grid1").attr("data-key");
	

	$.ajax({
		url : '/user/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str ="";
			for(var uc of list["ul"]){
				var key = uc[keyCol]
				
				str += "<tr>";
				for(var field of colsInfo){
					str += "<td class='tdtd'>";
					if(field=="BTN"){						
						str += "<a class='btn btn-default' onclick='updateUser("+ key +")'><em class='glyphicon glyphicon-refresh'></em></a>";
						str += "<a class='btn btn-danger' onclick='deleteUser("+ key +")'><em class='glyphicon glyphicon-trash'></em></a>";									
					}else{
						var colName = field.split(",")[0];
						var colType = field.split(",")[1];
						if(colType == "ro"){							
							str += uc[colName];
						}else{
							str += "<input type='text' style='color : black'  id='"+ colName + key + "'  value='" + uc[colName] + "'>"	
							
						}
												
					}
					str += "</td> ";					
				}							
				str += "</tr>";
			}
			$("#result_tb").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});



</script>
</html>