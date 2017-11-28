<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function search()
	{
		window.location.href='{ctx}/user/queryall';
	}
</script>
</head>
<body>
	${ctx}
	<a href="{ctx}/user/queryall" target="main" onclick="search();return false">查看用户</a>
</body>
</html>