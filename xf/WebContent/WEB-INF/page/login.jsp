<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录界面</title>
	<link rel="stylesheet" href="${ctx }/assets/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
	<script type="text/javascript" src="${ctx }/assets/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${ctx }/assets/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
       		/*  $(".btn").click(function(){
                 $.ajax({
                     url:"user/dologin",
                     data:$('#loginForm').serialize(),
                     dataType:"json",
                     type:"post",
                    success:function(){
                       if(data==Fail){
                           alert("登陆失败！请重新输入")
                       }else{
                           alert("登陆成功！")
                       }
                    }
                  })
        }) */
   
        
		</script>
			
		<style>
			.panel{
				width:60%;
				height:400px;
				margin: 0 auto;
			}
			.panel-heading {
				 text-align:center;
				 font-size: 30px;
			}
			.panel-body{
				position: relative;
				width:100%;
				height:300px;
				margin: 0 auto;
			}
			.form-group{
				position: relative;
				width:100%;
				left:38%;	
			}
			.checkbox{
				position: relative;
				margin: 0 auto;
				width:10%;
			}
			.btn{
				margin: 0 auto;
			}	
			
		</style>
</head>
<body>
	
	<div class="panel panel-default">
    <div class="panel-heading">登陆界面</div>
    <div class="panel-body">
            <form role="form" action="${ctx}/user/dologinUser" method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="username" >用户名:</label>
                    <input id="username" type="text" name="userName" class="form-control" style="width:30%" placeholder="请输入邮箱">
                </div>
                <div class="form-group ">
                    <label for="password" >密码:</label>		
                    <input type="password" id="password" name="passWord" class="form-control " style="width:30%" placeholder="请输入密码">
                </div>
                <div class="checkbox ">
                    <label>
                        <input type="checkbox" id="checkbox" class="checkbox">记住密码
                    </label>
                </div>
                 <div class="form-group ">
                    <label for="username" >其他:</label>		
                    <input type="username"  name="other" class="form-control " style="width:30%" placeholder="其他">
                </div>
                <button type="submit" class="btn btn-block btn-primary" id="button" style="width:30%">
                    	登录系统	
                </button>
            </form>
      </div>
      <div style="text-align:center;font-size: 14px;color: RED;"> ${error}</div>
     

</div>

  
</html>