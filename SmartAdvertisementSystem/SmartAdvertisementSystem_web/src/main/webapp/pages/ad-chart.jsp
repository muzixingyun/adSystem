<%--
  Created by IntelliJ IDEA.
  User: 李兴运
  Date: 2021/4/10
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <!-- 页面meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>数据 - AdminLTE2定制版</title>
        <meta name="description" content="AdminLTE2定制版">
        <meta name="keywords" content="AdminLTE2定制版">

        <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    </head>
    <body class="hold-transition skin-purple sidebar-mini">

        <div class="wrapper">

            <!-- 页面头部 -->
            <jsp:include page="header.jsp"></jsp:include>
            <!-- 页面头部 /-->

            <!-- 导航侧栏 -->
            <jsp:include page="aside.jsp"></jsp:include>
            <!-- 导航侧栏 /-->

            <!-- 内容区域 -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        ChartJS
                        <small>Preview sample</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#"><i class="fa fa-dashboard"></i> Home</a>
                        </li>
                        <li>
                            <a href="#">Charts</a>
                        </li>
                        <li class="active">ChartJS</li>
                    </ol>
                </section>

                <select class="form-control" id="adSelect" style="width: 20%" onchange="changeSelect()">
                    <option>请选择广告</option>
                    <c:forEach items="${adList}" var="advertisement">
                        <option value="${advertisement.id}+${advertisement.adName}">${advertisement.adName}</option>
                    </c:forEach>
                </select>
                <h2>${data.adName}的数据为</h2>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- 开头大段折线图-->
                        <div class="col-md-14">
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">本周与上周播放量比较</h3>

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                                class="fa fa-minus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                                class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="chart">
                                        <div id="weekLineChart" style="width: 1300px;height:500px;"></div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!--大段折线图结束-->
                        <!--年龄饼图开始-->
                        <div class="col-md-6">
                            <div class="box box-danger">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Donut Chart</h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                                class="fa fa-minus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                                class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div id="agePieChart" style="width: 600px;height:500px;"></div>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!--年龄饼图结束-->
                        <!--性别饼图-->
                        <div class="col-md-5">
                            <div class="box box-success">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Bar Chart</h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                                class="fa fa-minus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                                class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="chart">
                                        <div id="genderPieChart" style="width: 600px;height:400px;"></div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>
                        </div>
                        <!--性别饼图结束-->

                    </div>
                    <!-- /.row -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- page script -->
            <!-- 内容区域 /-->

            <!-- 底部导航 -->
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 1.0.8
                </div>
                <strong>Copyright &copy; 2014-2017 <a href="http://www.itcast.cn">研究院研发部</a>.</strong> All rights
                reserved.
            </footer>
            <!-- 底部导航 /-->

        </div>


        <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
        <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
        <script>
            $(document).ready(function () {
                // 选择框
                $(".select2").select2();

                // WYSIHTML5编辑器
                $(".textarea").wysihtml5({
                    locale: 'zh-CN'
                });
            });

            // 设置激活菜单
            function setSidebarActive(tagUri) {
                var liObj = $("#" + tagUri);
                if (liObj.length > 0) {
                    liObj.parent().parent().addClass("active");
                    liObj.addClass("active");
                }
            }

            //设置option改变查询
            function changeSelect() {
                var adValue = $("#adSelect").val();
                var arr= adValue.split("+");
                var adId = arr[0];
                var adName = arr[1];
                window.location.href = "${pageContext.request.contextPath}/advertisement/statisticData?adName=" + adName + "&adId=" + adId;
            }

            $(function () {
                /* ChartJS
                 * -------
                 * Here we will create a few charts using ChartJS
                 */


                //-------------
                //- 饼图 CHART -
                //--------------
                var agePieChart = document.getElementById('agePieChart');
                var myChart = echarts.init(agePieChart);
                var option;

                option = {
                    legend: {
                        top: 'bottom'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {
                                show: true
                            },
                            dataView: {
                                show: true,
                                readOnly: false
                            },
                            restore: {
                                show: true
                            },
                            saveAsImage: {
                                show: true
                            }
                        }
                    },
                    series: [{
                        name: '面积模式',
                        type: 'pie',
                        radius: [30, 160],
                        center: ['50%', '50%'],
                        roseType: 'area',
                        itemStyle: {
                            borderRadius: 8
                        },
                        data: [{
                            value: ${data.ageDataList[0]},
                            name: '0-5'
                        },
                            {
                                value: ${data.ageDataList[1]},
                                name: '6-12'
                            },
                            {
                                value: ${data.ageDataList[2]},
                                name: '13-18'
                            },
                            {
                                value: ${data.ageDataList[3]},
                                name: '19-25'
                            },
                            {
                                value: ${data.ageDataList[4]},
                                name: '26-35'
                            },
                            {
                                value: ${data.ageDataList[5]},
                                name: '36-50'
                            },
                            {
                                value: ${data.ageDataList[6]},
                                name: '51-70'
                            },
                            {
                                value: ${data.ageDataList[7]},
                                name: '71+'
                            }
                        ]
                    }]
                };

                myChart.setOption(option);

                //-------------
                //- 折线 CHART -
                //-------------
                // Get context with jQuery - using jQuery's .get() method.
                var weekLineChart = document.getElementById('weekLineChart');
                var myChart = echarts.init(weekLineChart);
                var option;

                option = {
                    title: {
                        text: '本周与上周播放量比较',
                        subtext: ''
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['本周', '上周'],
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataZoom: {
                                yAxisIndex: 'none'
                            },
                            dataView: {
                                readOnly: false
                            },
                            magicType: {
                                type: ['line', 'bar']
                            },
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                    },
                    yAxis: {
                        type: 'value',
                        axisLabel: {
                            formatter: '{value} 次'
                        }
                    },
                    series: [{
                        name: '最高次数',
                        type: 'line',
                        data: ${data.nowWeekDataList},
                        markPoint: {
                            data: [{
                                type: 'max',
                                name: '最大值'
                            },
                                {
                                    type: 'min',
                                    name: '最小值'
                                }
                            ]
                        },
                        markLine: {
                            data: [{
                                type: 'average',
                                name: '平均值'
                            }]
                        }
                    },
                        {
                            name: '最低次数',
                            type: 'line',
                            data: ${data.lastWeekDataList},
                            markPoint: {
                                data: [{
                                    name: '周最低',
                                    value: -2,
                                    xAxis: 1,
                                    yAxis: -1.5
                                }]
                            },
                            markLine: {
                                data: [{
                                    type: 'average',
                                    name: '平均值'
                                },
                                    [{
                                        symbol: 'none',
                                        x: '90%',
                                        yAxis: 'max'
                                    }, {
                                        symbol: 'circle',
                                        label: {
                                            position: 'start',
                                            formatter: '最大值'
                                        },
                                        type: 'max',
                                        name: '最高点'
                                    }]
                                ]
                            }
                        }
                    ]
                };

                myChart.setOption(option);

                //-------------
                //- BAR CHART -
                //-------------
                var genderPieChart = document.getElementById('genderPieChart');
                var myChart = echarts.init(genderPieChart);
                var option;

                option = {
                    title: {
                        text: '性别',
                        subtext: '',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                    },
                    series: [{
                        name: '性别占比',
                        type: 'pie',
                        radius: '50%',
                        data: [{
                            value: ${data.maleNum},
                            name: '男'
                        },

                            {
                                value: ${data.femaleNum},
                                name: '女'
                            }
                        ],
                        emphasis: {
                            itemStyle: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }]
                };

                myChart.setOption(option);
            })
            // 激活导航位置
            setSidebarActive("charts-chartjs");
        </script>
    </body>


</html>