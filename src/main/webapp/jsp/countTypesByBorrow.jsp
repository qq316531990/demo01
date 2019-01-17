<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();

%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<script src="<%=path%>/js/echarts.js"></script>
 <script type="text/javascript" src="<%=path%>/js/jquery-1.8.2.min.js"></script>

</head>
<body>
<div>
<div id="type" style="width: 600px;height:400px; position: absolute;" > </div>
<div id="secondType" style="width: 600px;height:420px;position:absolute;margin-left:600px" > </div>
<div id="lastMonthTypeChart" style="width: 600px;height:500px; position:absolute;margin-top: 450px" > </div>
<div id="lastMonthBookChart" style="width: 600px;height:500px;position:absolute;margin-left:600px;margin-top: 450px" ></div></div>
<script type="text/javascript">
  var myChart = echarts.init(document.getElementById('type'));
  var myChart1 = echarts.init(document.getElementById('secondType'));
  var option = {
    title : {
      text: '一级分类借阅统计',
      subtext: '前五',
      x:'center'
    },
    tooltip : {
      trigger: 'item',
      formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
      x: 'center',
      y : 'bottom',
      data:[]
    },
    toolbox: {
      show : true,
      feature : {
        mark : {show: true},
        magicType : {
          show: true,
          type: ['pie', 'funnel']
        },

      }
    },
    calculable : true,
    series : [
      {
        name:'面积模式',
        type:'pie',
        radius : [30, 110],
        center : ['50%', '50%'],
        roseType : 'area',
        data:[]
      }
    ]
  };

  myChart.setOption(option);
  myChart1.setOption(option);
  myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
  myChart1.showLoading();
  var names=[];    //类别数组（实际用来盛放X轴坐标值）
  var nums=[];    //销量数组（实际用来盛放Y坐标值）

  $.ajax({
      type : "post",
      async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
      url : "<%=path%>/type/listTypeStatistics",
      data : {},
      dataType : "json",        //返回数据形式为json
      success : function(result) {
          //请求成功时执行该函数内容，result即为服务器返回的json对象
          if (result) {
              for(var i=0;i<result.length;i++){
                  names.push(result[i].name);    //挨个取出类别并填入类别数组
              }
              for(var i=0;i<result.length;i++){
                 nums.push({value:result[i].sum,name:result[i].name});
                  }
              myChart.hideLoading();    //隐藏加载动画
              myChart.setOption({        //加载数据图表
                  legend: {
                      x: 'center',
                      y : 'bottom',
                      data:names
                  },
                  series : [
                      {
                          name:'面积模式',
                          type:'pie',
                          radius : [30, 110],
                          center : ['50%', '50%'],
                          roseType : 'area',
                          data:nums
                      }
                  ]
              });

          }

      }
  })

  var names1=[];    //类别数组（实际用来盛放X轴坐标值）
  var nums1=[];    //销量数组（实际用来盛放Y坐标值）

  $.ajax({
      type : "post",
      async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
      url : "<%=path%>/type/listSecondTypeStatistics",    //请求发送到TestServlet处
      data : {},
      dataType : "json",        //返回数据形式为json
      success : function(result) {
          //请求成功时执行该函数内容，result即为服务器返回的json对象
          if (result) {
              for(var i=0;i<result.length;i++){
                  names1.push(result[i].name);    //挨个取出类别并填入类别数组
              }
              for(var i=0;i<result.length;i++){
                  nums1.push({value:result[i].sum,name:result[i].name});
              }

              myChart1.hideLoading();    //隐藏加载动画
              myChart1.setOption({        //加载数据图表
                  title : {
                      text: '二级分类借阅统计',
                      subtext: '前十',
                      x:'center'
                  },
                  legend: {
                      x: 'center',
                      y : 'bottom',
                      data:names1
                  },
                  series : [
                      {
                          name:'面积模式',
                          type:'pie',
                          radius : [30, 110],
                          center : ['50%', '50%'],
                          roseType : 'area',
                          data:nums1
                      }
                  ]
              });

          }

      }

  })


  var lastMonthTypeChart = echarts.init(document.getElementById('lastMonthTypeChart'));
  var option1 = {
      title : {
          text: '上月分类借阅统计',
          subtext: '前十',
          x:'center'
      },
      color: ['#3398DB'],
      tooltip : {
          trigger: 'axis',
          axisPointer : {            // 坐标轴指示器，坐标轴触发有效
              type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
          }
      },
      grid: {
          left: '3%',
          right: '4%',
          bottom: '10%',
          containLabel: true
      },
      xAxis : [
          {
              type : 'category',
              data : [],
              axisTick: {
                  alignWithLabel: true
              }
          }
      ],
      yAxis : [
          {
              type : 'value'
          }
      ],
      series : [
          {
              name:'',
              type:'bar',
              barWidth: '60%',
              data:[]
          }
      ]
  };

  var typeNames=[];    //类别数组（实际用来盛放X轴坐标值）
  var nums2=[];    //借阅数数组（实际用来盛放Y坐标值）
  lastMonthTypeChart.setOption(option1);
  lastMonthTypeChart.showLoading();

  $.ajax({
      type : "post",
      async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
      url : "<%=path%>/type/listLastMonthSecondTypeStatistics",    //请求发送到TestServlet处
      data : {},
      dataType : "json",        //返回数据形式为json
      success : function(result) {
          //请求成功时执行该函数内容，result即为服务器返回的json对象
          if (result) {
              for(var i=0;i<result.length;i++){
                  typeNames.push(result[i].name);    //挨个取出类别并填入类别数组
              }
              for(var i=0;i<result.length;i++){
                  nums2.push(result[i].sum);
              }

              lastMonthTypeChart.hideLoading();    //隐藏加载动画
              lastMonthTypeChart.setOption({        //加载数据图表
                  xAxis : [
                      {
                          type : 'category',
                          data : typeNames,
                          axisTick: {
                              alignWithLabel: true
                          }
                      }
                  ],
                  series : [
                      {
                          name:'借阅次数',
                          type:'bar',
                          barWidth: '10%',
                          data:nums2
                      }]
              });

          }

      }

  })

  var lastMonthBookChart = echarts.init(document.getElementById('lastMonthBookChart'));
  var bookNames=[];    //类别数组（实际用来盛放X轴坐标值）
  var nums3=[];    //借阅数数组（实际用来盛放Y坐标值）
  lastMonthBookChart.setOption(option1);
  lastMonthBookChart.showLoading();

  $.ajax({
      type : "post",
      async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
      url : "<%=path%>/type/listLastMonthBorrowStatistics",    //请求发送到TestServlet处
      data : {},
      dataType : "json",        //返回数据形式为json
      success : function(result) {
          //请求成功时执行该函数内容，result即为服务器返回的json对象
          if (result) {
              for(var i=0;i<result.length;i++){
                  bookNames.push(result[i].name);    //挨个取出类别并填入类别数组
              }
              for(var i=0;i<result.length;i++){
                  nums3.push(result[i].sum);
              }

              lastMonthBookChart.hideLoading();    //隐藏加载动画
              lastMonthBookChart.setOption({        //加载数据图表
                  title : {
                      text: '上月热门书籍榜',
                      subtext: '前十',
                      x:'center'
                  },
                  xAxis : [
                      {
                          type : 'category',
                          data : bookNames,
                          axisTick: {
                              alignWithLabel: true
                          }
                      }
                  ],
                  series : [
                      {
                          name:'借阅次数',
                          type:'bar',
                          barWidth: '10%',
                          data:nums3
                      }]
              });

          }

      }

  })
</script>



</body></html>