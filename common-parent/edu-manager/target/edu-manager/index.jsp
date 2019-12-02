<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>LOGIN</title>
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" title="" rel="stylesheet" />
		<link href="css/font-awesome.min.css" rel="stylesheet">

		<!-- Gritter -->
		<link href="css/jquery.gritter.css" rel="stylesheet">
		<!-- Animation CSS -->
		<link rel="stylesheet" href="css/login.css" />
		 <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-migrate-1.4.1.min.js"></script>
	</head>

	<body>
    <div id="page_end_html">
        <p id="back-top" style=""><a href="#top"><span></span></a></p>

        <script src="https://cdn.jsdelivr.net/npm/live2d-widget@3.0.4/lib/L2Dwidget.min.js"></script>
        <script type="text/javascript">
            L2Dwidget.init();
        </script>
    </div>

		<div class="row">
			<div id="login_page" class="row col-lg-12">
				<h1><strong>后台管理系统</strong></h1>
				<form action="" class="col-lg-2 col-md-4 form-horizontal">
					<input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名">
					<input style="margin:15px 0;" type="password" id="password" class="form-control" name="psd" placeholder="请输入密码" />
					<%--<input style="margin-bottom:15px;" type="checkbox" name="check" />记住密码
					<a style="color:#999 !important; margin-left:80px;" href="#">忘记密码</a><br>--%>
					<div class="col-lg-12">
						<button type="button" class="btn btn-primary" onclick="" id="log">登录</button>
						<%--<button type="button" class="btn btn-primary">注册</button>--%>
					</div>
				</form>
				<span>版权所有：某某有限公司    技术支持：鹏翔科技</span>
			</div>
		</div>
		<script>
    $("#log").click(function(){
        var username=document.getElementById("username").value;
        var password=document.getElementById("password").value;
        var admin={"username":username,"password":password};
        var url="${pageContext.request.contextPath}/user/login.do";
        $.post(
            url,
            {"data":JSON.stringify(admin)},
            function(data) {
                if (data=="success") {

                    location.href="${pageContext.request.contextPath}/user/admin.do";
                }else if(data=="error"){
                   alert("用户名或密码错误！");
                }
            });
    });
</script>
	</body>

</html>