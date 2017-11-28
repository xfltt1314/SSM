function initright(currentPage,name,lowprice,highprice){
	$.ajax({
		type: "get",
		url: "LoadOrderServlet.do",
		async: true,
		data:{
			"currentPage":currentPage,
			"pageSize":8,
			"name":name,
			"lowprice":lowprice,
			"highprice":highprice
		},
		beforeSend:function(){
			$("#alt").html('<img id="load" class="center-block" src="assets/img/100207.gif" />');
		},
		success: function(obj) {
			$("#load").hide();
			var data=JSON.parse(obj);
			for (var i = 0; i < data.length; i++) {
				var str='<div id="li" class="col-md-3">';
				str+='<div id="wcd" class="thumbnail">';
				str+='<a href="ToWatchCardServlet.do?id='+data[i].id+'"><img id="wcp" src="'+data[i].img+'"></a>';
				str+='<div class="caption">';
				str+='<h3 class="text-danger">￥'+data[i].price+'</h3>';
				str+='<p><a id="name" href="ToWatchCardServlet.do.do?id='+data[i].id+'">'+data[i].name+'</a></p>';
				str+='<p>已获得<span class="text-primary"><b>'+data[i].watch+'</b></span>个关注</p>';
				str+=' </div></div></div>';
				$("#list").append(str);
			}
			$("#next").unbind();
			$("#next").click(function(){
				if(currentPage<((total%8)+1)){
					$("#list").empty();
					initright(currentPage+1,name,lowprice,highprice);
				}
			});
			$("#previous").unbind();
			$("#previous").click(function(){
				if(currentPage>1){
					$("#list").empty();
					initright(currentPage-1,name,lowprice,highprice);					
				}else{
					alert("已到第一页");
				}
			});
		}
	});
}

function doSearch(){
	$("#list").empty();
	name=$("#name").val();
	lowprice=$("#lowprice").val();
	highprice=$("#highprice").val();
	currentPage=1;
	initright(currentPage,name,lowprice,highprice);	
}

function inithot(){
	$.ajax({
		type: "get",
		url: "LoadHotServlet.do",
		async: true,
		success: function(obj) {
			var data=JSON.parse(obj);
			for (var i = 0; i < data.length; i++) {
				var str='<a href="ToWatchCardServlet.do?id='+data[i].id+'">';
				str+='<p>'+data[i].name+'</p></a>';
				$("#hot").append(str);
			}
		}
	});
}
