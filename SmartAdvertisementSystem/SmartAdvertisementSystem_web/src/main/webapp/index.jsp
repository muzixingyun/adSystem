<%--
  Created by IntelliJ IDEA.
  User: 李兴运
  Date: 2021/3/29
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>智能广告系统</title>
    </head>

    <body>
        <video id="video"></video>
        <button id="paizhao" name="paizhao" value="拍照">拍照</button>
        <a href="${pageContext.request.contextPath}/pages/login.jsp">进入后台管理系统</a>
        <video id="advertisementVideo" src="videos/pinduoduo.mp4" autoplay="true" width="200px" height="300px"></video>
        <canvas id="myCanvas" width="1000" height="500"></canvas>

    </body>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script>
        /**
         * 以下为获取摄像头
         */
            // 想要获取一个最接近 1000*500 的相机分辨率
        var constraints = {
                video: {
                    width: 500,
                    height: 250
                }
            };

        navigator.mediaDevices
            .getUserMedia(constraints)
            .then(function (mediaStream) {
                var video = document.querySelector("video");
                video.srcObject = mediaStream;
                video.onloadedmetadata = function (e) {
                    video.play();
                };
            })
            .catch(function (err) {
                console.log(err.name + ": " + err.message);
            }); // 总是在最后检查错误

        /**
         * 实现拍照功能
         */
        document.getElementById("paizhao").addEventListener("click", function () {
            var canvas = document.getElementById("myCanvas");
            var video = document.getElementById("video");
            var context = canvas.getContext("2d");
            context.drawImage(video, 0, 0, 500, 250);
            var newData = canvas.toDataURL('image/png');
            $.ajax({
                type: "POST",
                async: false,
                url: "${pageContext.request.contextPath}/adControl/pictureToAd",
                data: {"pictureBase64Url": newData},
                success: function () {
                }
            });
        });
        /**
         * 定时拍照
         */
        setInterval(function () {
            $("#paizhao").click();
        },3000);
    </script>

</html>
