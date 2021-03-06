<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>尚硅谷会员注册页面</title>
<link type="text/css" rel="stylesheet" href="../../static/css/style.css" >
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
	
</style>
	<script type="text/javascript" src="../../static/js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function () {
			// 注册按钮绑定单击事件
			$("#sub_btn").click(function () {
				// 1.验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
				var pattern = /^\w{5,12}$/;
				if (!pattern.test($("#username").val())) {
					$("span.errorMsg").text("用户名不合法！");
					// return false之后不进行提交，也就不会进行页面的跳转
					return false;
				}

				var passwordVar = $("#password").val();
				// 2.验证密码：必须由字母，数字下划线组成，并且长度为5到12位
				if (!pattern.test(passwordVar)) {
					$("span.errorMsg").text("密码不合法！");
					// return false之后不进行提交，也就不会进行页面的跳转
					return false;
				}

				// 3.验证密码和确认密码相同
				if (passwordVar !== $("#repwd").val()) {
					$("span.errorMsg").text("密码与确认密码不一致！");
					// return false之后不进行提交，也就不会进行页面的跳转
					return false;
				}

				//4.邮箱验证 xxxx@xxx.com
				var emailPattern = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				if (!emailPattern.test($("#email").val())) {
					$("span.errorMsg").text("邮箱不合法！");
					// return false之后不进行提交，也就不会进行页面的跳转
					return false;
				}

				// trim去掉字符串前后空格
				var codeVal = $.trim($("#code").val());
				//5.验证码，这里只验证了验证码是否为空
				if (codeVal === null || codeVal === "") {
					$("span.errorMsg").text("验证码为空！");
					// return false之后不进行提交，也就不会进行页面的跳转
					return false;
				}
			});
		})

		// 可以提交之后把错误信息在页面中去掉
		$("span, .errorMsg").text("");
	</script>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="../../static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册尚硅谷会员</h1>
								<span class="errorMsg"></span>
							</div>
							<div class="form">
								<form action="http://localhost:8080/userServlet" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username" />
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>电子邮件：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址" autocomplete="off" tabindex="1" name="email" id="email" />
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" style="width: 150px;" id="code" name="code"/>
									<img alt="" src="../../static/img/code.bmp" style="float: right; margin-right: 40px">									
									<br />
									<br />
									<input type="submit" value="注册" id="sub_btn" />
									
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		<%@ include file="/pages/common/footer.jsp"%>
</body>
</html>