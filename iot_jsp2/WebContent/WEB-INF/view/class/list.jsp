<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
#posi {
	position: relative; 
    left: 45%;
    
}
</style>
<body   class="moon">
<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	<br>
	 <h1 class="h1c">Class List</h1>
	  <div class="tbl-header">
	    <table class="tbc" cellpadding="0" cellspacing="0" border="0" id="grid1" data-key="ciNo">
	      <thead>
	        <tr>
	          <th class="thc" data-field="ciNo,ro"  >번호</th>
	          <th class="thc" data-field="ciName,txt" >반이름</th>
	          <th class="thc" data-field="ciDesc,txt" >상세정보</th>	                
	          <th class="thc" data-field="BTN" >버튼</th>
	        </tr>
	      </thead>
	    </table>
	  </div>
	  <div class="tbl-content">
	    <table class="tbc" cellpadding="0" cellspacing="0" border="0">
	      <tbody id="result_tb">
		</table>
	</div>	
	<br>	
	<a class='btn btn-default' href="<%=rootPath%>/view/class/insert" id="posi"><em class='glyphicon glyphicon-floppy-open'></em></a>
</body>

<script>
//"uiName,uiAge,uiId,uiPwd,ciNo,address"













function deleteClass(ciNo){
	
	var isDelete = confirm("정말로 삭제하겠습니까?");
	
	var param = "ciNo=" + ciNo;
	if(isDelete){
		$.ajax({
			url : '/class/delete',			
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


function updateClass(ciNo){
	
	var ciName = $("#ciName" + ciNo).val().trim();
	var ciDesc = $("#ciDesc" + ciNo).val().trim();
	
	
	var param = {
			ciNo : ciNo,
			ciName : ciName,
			ciDesc : ciDesc					
	}
	
	param = "param=" + JSON.stringify(param);
	
	
	
	$.ajax({
		url : '/class/update',			
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


var colsInfo = [];

$(document).ready(function(){
	var colList = $("#grid1 th[data-field]");
	for(var i=0; i<colList.length; i++){		
		//colsInfo[colsInfo.length]
		colsInfo.push(colList[i].getAttribute("data-field"));		
	}
	
	var keyCol =$("#grid1").attr("data-key");
	

	$.ajax({
		url : '/class/list',
		type : 'get',
		success:function(res){
			var classList = JSON.parse(res);
			var str ="";
			for(var cc of classList){
				var key = cc[keyCol]				
				str += "<tr>";
				for(var field of colsInfo){
					str += "<td class='tdtd'>";
					if(field=="BTN"){						
						str += "<a class='btn btn-default' onclick='updateClass("+ key +")'><em class='glyphicon glyphicon-refresh'></em></a>";
						str += "<a class='btn btn-danger' onclick='deleteClass("+ key +")'><em class='glyphicon glyphicon-trash'></em></a>";									
					}else{
						var colName = field.split(",")[0];
						var colType = field.split(",")[1];
						if(colType == "ro"){							
							str += cc[colName];
						}else{
							str += "<input type='text' style='color : black'  id='"+ colName + key + "'  value='" + cc[colName] + "'>"	
							
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