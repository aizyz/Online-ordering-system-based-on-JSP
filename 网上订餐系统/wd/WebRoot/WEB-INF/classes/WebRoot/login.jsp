<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
            *{
	margin: 0;
	padding: 0;
	list-style: none;
	text-decoration: none;
}
body,html{
	width: 100%;
	height: 100%;
	font-size: 14px;
	font-family: "寰蒋闆呴粦";
	background: url(img/bg.jpg);
	background-size: cover;
	overflow: hidden;
}

.container{
	position:relative;

}
.login_btn{
	width: 150px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: #324057;
	border-radius: 5px;
	color: #fff;
	font-size: 15px;
	margin: 20px 39px;
	cursor: pointer;
}

/*鏄熸槦*/
.stars {
	width: 100%;
	height: 100%;
	position: absolute;
	z-index: 99;
}
.stars > li {
	position: absolute;
	width: 30px;
	height: 31px;
	background-image: url(../images/stars.png);
	-webkit-animation-name: flash;
	-webkit-animation-timing-function: ease-in-out;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-direction: alternate;
	-moz-animation-name: flash;
	-moz-animation-timing-function: ease-in-out;
	-moz-animation-iteration-count: infinite;
	-moz-animation-direction: alternate;
}
.stars1 {
	top: 20%;
	left: 30%;
	-webkit-animation-duration: 5s;
	-moz-animation-duration: 5s;
}
.stars2 {
	top: 40%;
	left: 13%;
	-webkit-animation-duration: 20s;
	-moz-animation-duration: 20s;
}
.stars3 {
	top: 10%;
	left: 85%;
	-webkit-animation-duration: 15s;
	-moz-animation-duration: 15s;
}
.stars4 {
	top: 30%;
	left: 70%;
	-webkit-animation-duration: 25s;
	-moz-animation-duration: 25s;
}
.stars5 {
	top: 56%;
    left: 21%;
	-webkit-animation-duration: 30s;
	-moz-animation-duration: 30s;
}
.stars6 {
	top: 66%;
    left: 79%;
	-webkit-animation-duration: 10s;
	-moz-animation-duration: 10s;
}
@-webkit-keyframes flash {
	0%, 50%, 100% {opacity: 1;}
	25%,75% {opacity: 0;}
}

@-moz-keyframes flash {
	0%, 50%, 100% {opacity: 1;}
	25%,75% {opacity: 0;}
}
/*鑺�*/
#snowflake {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	overflow: hidden;
}
.snowRoll {
	position: absolute;
	opacity: 0;
	-webkit-animation-name: mysnow;
	-webkit-animation-duration: 20s;
	-moz-animation-name: mysnow;
	-moz-animation-duration: 20s;
	height: 80px;
}
@-webkit-keyframes mysnow {
	0% {bottom: 100%;}
	50% {-webkit-transform: rotate(1080deg);}
	100% {-webkit-transform: rotate(0deg) translate3d(50px, 50px, 50px);}
}
        </style>
		
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        

	</head>

	<body>
		<div id="Layer1" style="position:absolute; left:300px; top:200px; width:600px; height:131px; z-index:1000">
			<form action="" name="ThisForm" method="post">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100%" colspan="2" align="left">
							<font style="font-size: 40px;color: #222;font-weight: bolder;display: block;text-align: left">
							    &nbsp;&nbsp;&nbsp; &nbsp; 网上订餐系统
				            </font>
						</td>
					</tr>
					<tr>
						<td width="100%" colspan="2" height="20">
							
						</td>
					</tr>
					<tr>
						<td width="15%" height="22" style="text-align:center; height: 40px;line-height: 50px">
							<span style="font-size: 18px;">账号:</span>
						</td>
						<td width="85%" height="22">
							<input name="userName" type="text" size="20" style="height:30px; width: 250px; border: none;border-bottom:solid 1px #bbbbbb;background: transparent;">
						</td>
					</tr>
					<tr>
						<td width="15%" height="22" style="text-align:center; height: 40px;line-height: 50px">
							<span style="font-size: 18px;">密码:</span>
						</td>
						<td width="85%" height="22">
							<input name="userPw" type="password" size="20" style="height:30px; width: 250px; border: none;border-bottom:solid 1px #bbbbbb;background: transparent;">
						</td>
					</tr>
					<tr>
						<td width="15%" height="22">
						</td>
						<td width="85%" height="22">
							<div class="login_btn" onClick="check1()">登录</div>	
                            <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 星星 -->
    <ul class="stars">         
    	<li class="stars1"></li>
        <li class="stars2"></li>
        <li class="stars3"></li>
        <li class="stars4"></li>
        <li class="stars5"></li>
        <li class="stars6"></li>
    </ul>
    <!-- 飘花 -->
    <div id="snowflake"></div>
    
    
    
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$(function(){ 
	    $(window).resize();
	    snowflake();
	});

	$(window).resize(function(){ 
	    $(".login").css({ 
	        position: "absolute", 
	        left: ($(window).width() - $(".login").outerWidth())/2, 
	        top: ($(window).height() - $(".login").outerHeight())/2 
	    });        
	});

	function snowflake() {

		var container = $(document);
	    visualWidth = container.width();
	    visualHeight = container.height();

		var snowflakeURl = [
			'img/snowflake1.png',
			'img/snowflake2.png',
			'img/snowflake3.png',
			'img/snowflake4.png',
			'img/snowflake5.png',
			'img/snowflake6.png',
		]
        // 雪花容器
        var $flakeContainer = $('#snowflake');

        // 随机六张图
        function getImagesName() {
            return snowflakeURl[[Math.floor(Math.random() * 6)]];
        }
        // 创建一个雪花元素
        function createSnowBox() {
        	var url = getImagesName();
        	return $('<div class="snowbox" />').css({
        		'width': 41,
        		'height': 41,
        		'position': 'absolute',
        		'backgroundSize': 'cover',
        		'zIndex': 100,
        		'top': '-41px',
        		'backgroundImage': 'url(' + url + ')'
        	}).addClass('snowRoll');
        }
        // 开始飘花
        setInterval(function() {
            // 运动的轨迹
            var startPositionLeft = Math.random() * visualWidth - 100,
                startOpacity    = 1,
                endPositionTop  = visualHeight - 40,
                endPositionLeft = startPositionLeft - 100 + Math.random() * 500,
                duration        = visualHeight * 10 + Math.random() * 5000;

            // 随机透明度，不小于0.5
            var randomStart = Math.random();
            randomStart = randomStart < 0.5 ? startOpacity : randomStart;

            // 创建一个雪花
            var $flake = createSnowBox();

            // 设计起点位置
            $flake.css({
                left: startPositionLeft,
                opacity : randomStart
            });

            // 加入到容器
            $flakeContainer.append($flake);

            // 开始执行动画
            $flake.animate({
            	top: endPositionTop,
            	left: endPositionLeft,
            	opacity: 0.7
            }, 8000, function() {
                $(this).remove() //结束后删除
            });

        }, 200);
    }
    </script>
	</body>
</html>
