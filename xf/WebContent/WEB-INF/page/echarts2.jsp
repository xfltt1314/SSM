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
	<script type="text/javascript" src="${ctx }/echarts/echarts.js"></script>
	<script type="text/javascript" src="${ctx }/echarts/esl.js"></script>
</head>

<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));


        option = {
        	    backgroundColor: '#2c343c',

        	    title: {
        	        text: '销量',
        	        left: 'center',
        	        top: 20,
        	        textStyle: {
        	            color: '#ccc'
        	        }
        	    },

        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    }, 
        	    visualMap: {
        	        show: false,
        	        min: 80,
        	        max: 600,
        	        inRange: {
        	            colorLightness: [0, 1]
        	        }
        	    },
        	    series : [
        	        {
        	            name:'销量',
        	            type:'pie',
        	            radius : '55%',
        	            center: ['50%', '50%'],
        	            data:[],
        	            roseType: 'angle',
        	            label: {
        	                normal: {
        	                    textStyle: {
        	                        color: 'rgba(255, 255, 255, 0.3)'
        	                    }
        	                }
        	            },
        	            labelLine: {
        	                normal: {
        	                    lineStyle: {
        	                        color: 'rgba(255, 255, 255, 0.3)'
        	                    },
        	                    smooth: 0.2,
        	                    length: 10,
        	                    length2: 20
        	                }
        	            },
        	            itemStyle: {
        	                normal: {
        	                    color: '#c23531',
        	                    shadowBlur: 200,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            },

        	            animationType: 'scale',
        	            animationEasing: 'elasticOut',
        	            animationDelay: function (idx) {
        	                return Math.random() * 200;
        	            }
        	        }
        	    ],
        	    
        	};
                
               	 myChart.showLoading();   			
              	 $.ajax({
                     type : "post",
                     async : true,            
                     url : "${ctx}/user/getData",    
                     data : {},
                     success : function(json) {
                    	// alert(json);
                    	 var result = $.parseJSON(json);
                    	 var array = [];
                         if (result) {                     	 
                        	 for(i = 0 ;i<getJsonObjLength(result);i++ ){
                        		//alert(str.name[i]+"===========》"+str.id[i]);
                        		var map ={};
                        		map.name = result[i].userName;
                        		map.value = result[i].passWord;
                        		array[i]=map;
                        		}
                                myChart.hideLoading();    //隐藏加载动画
                                myChart.setOption({
                                    legend: {
                                        data: result.userName
                                        },
                                    series:[{                                        
                                        data:  array
                                                                                    
                                    }]
                                })
                         }
                     
                    },
                     error : function(errorMsg) {

                     alert("图表请求数据失败!");
                     myChart.hideLoading();
                     }
                });
                   
                    myChart.setOption(option);
                    
                    function getJsonObjLength(jsonObj) {
                        var Length = 0;
                        for (var item in jsonObj) {
                            Length++;
                        }
                        return Length;
                }   
                </script>
            </body>
</html>