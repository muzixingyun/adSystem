<%--
  Created by IntelliJ IDEA.
  User: 李兴运
  Date: 2021/4/11
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
                        上传广告
                        <small>表单</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> 后台管理</a></li>
                        <li><a href="#">数据管理</a></li>
                        <li class="active">广告上传</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-6">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">上传</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form role="form" method="post" enctype="multipart/form-data"
                                      action="${pageContext.request.contextPath}/advertisement/adUpload">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">广告名称</label>
                                            <input type="text" class="form-control" id="exampleInputEmail1"
                                                   placeholder="输入广告的名称" name="adName">
                                        </div>
                                        <div class="form-group">
                                            <label>应用场景选择</label>
                                            <div class="form-group">
                                                <label>性别：</label>
                                                <%--<select class="form-control select2" name="genderSuit" multiple="multiple"--%>
                                                <%--data-placeholder="请选择[可选择多个]" style="width: 100%;">--%>
                                                <input type="checkbox" name="genderSuit" value="男">男</input>
                                                <input type="checkbox" name="genderSuit" value="女">女</input>
                                                <input type="checkbox" name="genderSuit" value="all">均适用</input>
                                                <%--</select>--%>
                                            </div>
                                            <div class="form-group">
                                                <label>眼镜：</label>
                                                <%--<select class="form-control select2" name="glassesSuit"--%>
                                                        <%--multiple="multiple"--%>
                                                        <%--data-placeholder="请选择[可选择多个]" style="width: 100%;">--%>
                                                    <input type="checkbox" name="glassesSuit" value="无眼镜">无眼镜</input>
                                                    <input type="checkbox" name="glassesSuit" value="近视眼镜">近视眼镜</input>
                                                    <input type="checkbox" name="glassesSuit" value="太阳镜">太阳镜</input>
                                                    <input type="checkbox" name="glassesSuit" value="all">均适用</input>
                                                <%--</select>--%>
                                            </div>
                                            <%--angry:愤怒 disgust:厌恶 fear:恐惧 happy:高兴 sad:伤心 surprise:惊讶 neutral:无情绪--%>

                                            <div class="form-group">
                                                <label>情绪：</label>
                                                <%--<select class="form-control select2" name="emotionSuit"--%>
                                                        <%--multiple="multiple"--%>
                                                        <%--data-placeholder="请选择[可选择多个]" style="width: 100%;">--%>
                                                    <input type="checkbox" name="emotionSuit" value="无情绪">无情绪</input>
                                                    <input type="checkbox" name="emotionSuit" value="愤怒">愤怒</input>
                                                    <input type="checkbox" name="emotionSuit" value="厌恶">厌恶</input>
                                                    <input type="checkbox" name="emotionSuit" value="恐惧">恐惧</input>
                                                    <input type="checkbox" name="emotionSuit" value="高兴">高兴</input>
                                                    <input type="checkbox" name="emotionSuit" value="伤心">伤心</input>
                                                    <input type="checkbox" name="emotionSuit" value="惊讶">惊讶</input>
                                                    <input type="checkbox" name="emotionSuit" value="all">均适用</input>
                                                <%--</select>--%>
                                            </div>
                                            <%--0-5,5-12,12-18,18-25,25-35,35-50,50-70,70---%>

                                            <div class="form-group">
                                                <label>年龄段：</label>
                                                <%--<select class="form-control select2" multiple="multiple"--%>
                                                        <%--data-placeholder="请选择[可选择多个]" style="width: 100%;">--%>
                                                    <input type="checkbox" name="ageSuit" value="0-5">0-5</input>
                                                    <input type="checkbox" name="ageSuit" value="5-12<">5-12</input>
                                                    <input type="checkbox" name="ageSuit" value="12-18">12-18</input>
                                                    <input type="checkbox" name="ageSuit" value="18-25">18-25</input>
                                                    <input type="checkbox" name="ageSuit" value="25-35">25-35</input>
                                                    <input type="checkbox" name="ageSuit" value="35-50">35-50</input>
                                                    <input type="checkbox" name="ageSuit" value="50-70">50-70</input>
                                                    <input type="checkbox" name="ageSuit" value="70+">70+</input>
                                                    <input type="checkbox" name="ageSuit" value="all">均适用</input>
                                                <%--</select>--%>
                                            </div>
                                            <%--0-25,25-50,50-75,75+--%>

                                            <div class="form-group">
                                                <label>颜值：</label>
                                                <%--<select class="form-control select2" multiple="multiple"--%>
                                                        <%--data-placeholder="请选择[可选择多个]" style="width: 100%;">--%>
                                                    <input type="checkbox" name="beautySuit" value="0-25">0-25</input>
                                                    <input type="checkbox" name="beautySuit" value="25-50">25-50</input>
                                                    <input type="checkbox" name="beautySuit" value="50-75">50-75</input>
                                                    <input type="checkbox" name="beautySuit" value="75+">75+</input>
                                                    <input type="checkbox" name="beautySuit" value="all">均适用</input>
                                                <%--</select>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">上传广告文件</label>
                                            <input type="file" id="exampleInputFile" name="upload">
                                        </div>
                                    </div>
                                    <!-- /.box-body -->

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">上传</button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.box -->
                        </div>
                        <!--/.col (left) -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
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


            // 激活导航位置
            setSidebarActive("form-general");
        </script>
    </body>

</html>
