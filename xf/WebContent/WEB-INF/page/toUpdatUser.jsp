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
	$(document).ready(function()
			{
				var va = $("select[name='scoreFrom']").val();
				var va2 = $("#fromDetail2").val();
			    $("select[name='fromDetail2']").empty();
				var temp = document.getElementById("fromDetail2");
				if(va==1)
					{
						for (i = 0; i < select2[0].length; i++) {
							select2[0][i].value=i;	
							temp.options[i] = new Option(select2[0][i].text,select2[0][i].value);
						}
						temp.options[va2].selected = true;
					}
				else if(va==2)
					{					
						for (i = 0; i < select2[1].length; i++) {
							select2[1][i].value=i;	
							temp.options[i] = new Option(select2[1][i].text,select2[1][i].value);
					}
						temp.options[va2].selected = true;
					} 
			});
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
		var temp = document.getElementById("fromDetail2");
		for (i = 0; i < select2[laiyuan-1].length; i++) {
			select2[laiyuan-1][i].value=i;	
			temp.options[i] = new Option(select2[laiyuan-1][i].text,select2[laiyuan-1][i].value);
		}
		temp.options[0].selected = true;
	}
	</script>
</head>
<body>
	 <form action="${ctx}/user/update" method="post">
	 	<input type="hidden" name="intId" value="${user.intId }" />
    	登录名:<input type="text" name="userName" value="${user.userName }" /><br/>
    	密码:<input type="text" name="passWord" value="${user.passWord }"/><br />
    	<p style="width: 50%; display:">
				<label style="display:">得分来源:</label> 
				<select name="scoreFrom" style="width: px; display:" value="${user.scoreFrom}" onchange="setDetail(this.value)">
					<option value="">-----------请选择-----------</option>
					<option value='1' ${user.scoreFrom eq '1' ? 'selected':''} >江苏</option>
					<option value='2' ${user.scoreFrom eq '2' ? "selected":""}>广东</option>
				</select>
			</p>
			<p style="width: 50%; display:">
				<label style="display:">来源细节:</label> 
				<select name="fromDetail" id="fromDetail2" style="width: px; display:" value="${user.fromDetail}">
					<option value="${user.fromDetail}">${user.fromDetail}</option>
				</select>
			</p>
    	<input type="submit" value="提交" />
    </form>
</body>
</html>