function doWatch(id){
	$.ajax({
		type: "get",
		url: "AddWatchServlet.do",
		async: true,
		data:{
			"id":id
		},
		success:function(obj){
			var data=JSON.parse(obj);
			$("#watchspan").html(data.watch);
			}
		})
}

function doAdd(pid,uid,address,number){
	$.ajax({
		type: "get",
		url: "InsertOrderServlet.do",
		async: true,
		data:{
			"pid":pid,
			"uid":uid,
			"address":address,
			"number":number
		},
		success:function(obj){
			if(obj=="true"){
				alert("添加成功，请到购物车查看商品！");
			}
			}
		})
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
				$("#hot1").append(str);
			}
		}
	});
}
