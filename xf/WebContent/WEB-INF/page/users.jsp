<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/assets/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
		<script type="text/javascript" src="${ctx}/assets/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
</head>

<style>	
  
  .trBg{
			background-color: gray;
		}
		
  .red1{
			background-color: red;
		}
	ul
	{
		float:left;
		width:100%;
		padding:0;
		margin:0;
		list-style-type:none;
	}	
	
	/* a
		{
			float:right;
			width:7em;
			text-decoration:none;
			color:white;
			background-color:purple;
			padding:0.2em 0.6em;
			border-right:1px solid white;
		}
	a:hover {background-color:#ff3300} */
	
	.loginOut  {
		float:right;
		height:30px;
		width:100px;
		border:2px solid;
		margin-right:50px
}

	.login {
		float:right;
		height:30px;
		width:100px;
		border:2px solid;
		margin-right:50px
}
	
  li {
  		 list-style:none
  	} 
  	
  tr th,td{
  	text-align:center;
  }
</style>

<script type="text/javascript">
		$(document).ready(function(){
		//$("table").find("tr").css({"color":"red","border":"2px solid red"});
		//$("table tr").css({"color":"red","border":"2px solid red"});
		var id;
		var line;
		$("table tr").not(":first").mouseover(function(){	
			$(this).addClass("trBg");
		});
		
		$("table tr").mouseout(function(){
			$(this).removeClass("trBg");
		});
		
		 $("table tr").not(":first").click(function(){
			$(this).addClass("red1").siblings().removeClass('red1');
		    id=$(this).attr("rel");
		    line=this;
		   // alert(line);
			//alert(id);
		});
		
		$(".loginOut").click(function(){
			if(confirm("是否注销")){
			       
			   }
			else
				{
					return false;
				}
		}); 
		
		
		 $(".delete").click(function()
			{
			//alert(id);
				$.ajax(
				{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
					url:"${ctx}/user/delete",  
		            data:{id:id},
		            error: function(request) 
		            {  
		                alert("Connection error");  
		            },  
		            success: function(data)
		            {	
		            	if(data==1)
		            		{
		            			alert("删除成功!");
		            			line.remove();
		            		}
		            }
	           }
			);
					
		});  
		 
		 $(".update").click(function()
				 {
			 		//alert(id);
			 		alert("${ctx}/user/toUpdate/"+id);
			 		location.href="${ctx}/user/toUpdate/"+id;
				 }
		);
		 
		 $(".ech").click(function()
				 {
			 		//alert(id);
			 		location.href="${ctx}/user/echarts";
				 }
		);
		 
		 $(".ech2").click(function()
				 {
			 		//alert(id);
			 		location.href="${ctx}/user/echarts2";
				 }
		);
	});
</script>	
<body>
<p style="background-color:#FFFFFF">欢迎你${sessionScope.currentUser.userName}</p>
<a href="${ctx}/user/toAdd" >新增</a>
<c:choose>
	      	<c:when test="${sessionScope.currentUser ne null }">
				<li class="loginOut"><a href="${ctx}/user/logout">退出登录</a></li>
	      	</c:when>
	    	<c:otherwise>
	   	 		<li class="login"><a href="${ctx}/f/login">登录</a></li>
	    	</c:otherwise>
      </c:choose>
<table class="table table-bordered" style="width:50%;margin:0 auto">
		<tr >
			<th>序号</th>
			<th>用户名</th>
			<th >密码</th>
			<th><button class="delete btn">删除</button></th>
			<th><button class="update btn">修改</button></th>
			<th><button class="ech btn">echarts</button></th>
			<th><button class="ech2 btn">echarts2</button></th>
		</tr>
	<c:forEach items="${userlist}" var="user"  varStatus="index">
			
		<tr rel="${user.intId}">
			<td>${index.index+1 }</td>
			<td>${user.userName}</td>
			<td>${user.passWord}</td>
		</tr>
	</c:forEach>
	</table>
	
	<ul>
		<li>Link one</li>
		<li><a href="#">Link two</a></li>
		<li><a href="#">Link three</a></li>
	    <li><a href="#">Link four</a></li>
	</ul>
	
	<p>带有下拉菜单的标签页</p>
	<ul class="nav nav-tabs">
	   <li class="active"><a href="#">Home</a></li>
	   <li><a href="#">SVN</a></li>
	   <li><a href="#">iOS</a></li>
	   <li><a href="#">VB.Net</a></li>
	   <li class="dropdown">
	      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	         Java <span class="caret"></span>
	      </a>
	      <ul class="dropdown-menu">	
	         <li><a href="#">Swing</a></li>
	         <li><a href="#">jMeter</a></li>
	         <li><a href="#">EJB</a></li>
	         <li class="divider"></li>
	         <li ><a href="#">分离的链接</a></li>
	      </ul>
	   </li>
	   <li class="dropdown">
	   	<a class="dropdown-toggle" data-toggle="dropdown" href="#">PHP<span class="caret"></span>
	   	</a>
	   	<ul class="dropdown-menu">
	         <li><a href="#">1</a></li>
	         <li><a href="#">2r</a></li>
	         <li><a href="#">3</a></li>
	         <li class="divider"></li>
	         <li ><a href="#">分离的链接</a></li>
	      </ul>
	   </li>
	</ul>
	
	


</body>
</html>