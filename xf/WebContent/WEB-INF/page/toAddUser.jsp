<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${ctx }/assets/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
	<script type="text/javascript" src="${ctx }/assets/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${ctx }/assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//获取一级菜单长度
	var select1_len = 3;
	var select2 = new Array(select1_len);
	//把一级菜单都设为数组
	for (i = 0; i < select1_len; i++) {
		select2[i] = new Array();
	}
	//定义基本选项
	select2[0][0] = new Option("请选择", " ");

	select2[0][1] = new Option("南京", " ");
	select2[0][2] = new Option("无锡", " ");
	select2[0][3] = new Option("常州", " ");
	select2[0][4] = new Option("其他", " ");

	select2[1][0] = new Option("请选择", " ");
	select2[1][1] = new Option("广州", " ");
	select2[1][2] = new Option("东莞", " ");
	select2[1][3] = new Option("其他", " ");

	//联动函数
	function setDetail(laiyuan) {
		$("select[name='fromDetail']").empty();
		var temp = document.getElementById("fromDetail1");
		for (i = 0; i < select2[laiyuan-1].length; i++) {
			select2[laiyuan-1][i].value=i;	
			temp.options[i] = new Option(select2[laiyuan-1][i].text,select2[laiyuan-1][i].value);
		}
		temp.options[0].selected = true;
	}
	
	$(document).ready(function(){
		$("input[name='userName']").blur(function()
			{
				var username=$("input[name='userName']").val();
				$.ajax(
						{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
							url:"${ctx}/user/checkExist",  
				            data:{username:username},
				            error: function(request) 
				            {  
				                alert("Connection error");  
				            },  
				            success: function(data)
				            {	
				            	if(data==1)
				            		{
				            			$("#error").html("用户名已存在，请重新输入");
				            			$("input[name='userName']").focus();
				            		}
				            	else
				            		{
				            			$("input[type='submit']").removeAttr("disabled");
				            		}
				            }
			           }
					);
			});
		
		$("input[name='userName']").click(function()
				{
					$("#error").html("");
				});
	})
	</script>
</head>
<body>
	 <form action="${ctx}/user/Add" method="post">
    	登录名:<input type="text" name="userName" /><span id="error" value=""></span><br/>
    	密码:<input type="password" name="passWord" /><br />
    	<p style="width: 50%; display:">
				<label style="display:">得分来源:</label> 
				<select name="scoreFrom" style="width: px; display:" onchange="setDetail(this.value)">
					<option value="">-----------请选择-----------</option>
					<option value='1'>江苏</option>
					<option value='2'>广东</option>
				</select>
			</p>
			<p style="width: 50%; display:">
				<label style="display:">来源细节:</label> 
				<select name="fromDetail" id="fromDetail1" style="width: px; display:">
					<option value="">-----------请选择-----------</option>
				</select>
			</p>
    	<input type="submit" disabled="disabled" value="提交" />
    </form>
</body>
</html>