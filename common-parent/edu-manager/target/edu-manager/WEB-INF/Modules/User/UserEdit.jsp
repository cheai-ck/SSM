<!DOCTYPE html>
<html>
<head>
<title></title>
	<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-migrate-1.4.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
	<script type="text/javascript">
	function userSave(){
		$("#userForm").attr("action","");
		$("#userForm").submit();
	}
	</script>
</head>
<body>
	<form method="post" id="userForm" action="${pageContext.request.contextPath}/user/save.do">
		<div class="specificPageEdit" style="*position: static;">
			<div class="form">
				<div class="specificPage_header fix">
					<h4 class="specificPage_title l">
						<span id="MainContent_lbTitle">编辑</span>
					</h4>
					<span class="closePage r" onclick="Common.closePage();">关闭</span>
				</div>
				<div id="MainContent_divTitleTab" class="activeEdite_tab_list"
					style="margin-bottom: 3px;">
					<p>
						<span class="tab_list_current" data-tab="tab_1" onclick="Common.switchTab(this);">添加用户</span>
					</p>
				</div>

				<div class="hide_tab fix" data-tab="tab_1" id="tab_1">
					<div id="MainContent_UpdatePanel1">
					<%--	<table border="0" cellpadding="0" cellspacing="6" style="width: 100%">
							<tr>
								<td class="input_text tar">用户名：</td>
								<td>
									<p>
										<input name="username" type="text" value="" id="username"  style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">密码：</td>
								<td>
									<p>
										<input name="password" type="text" value="" id="password"  style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">手机号码：</td>
								<td>
									<p>
										<input name="telephone" type="text" value="" id="telephone" style="width: 150px;" />
									</p>
								</td>
							</tr>
							<tr>
								<td class="input_text tar">QQ：</td>
								<td>
									<p>
										<input name="qq" type="text" value="" id="qq" style="width: 150px;" /> 
									</p>
								</td>
								<td class="input_text tar">email：</td>
								<td>
									<p>
										<input name="email" type="text" value="" id="email" style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">总收入:</td>
								<td>
									<p>
										<input name="amount" type="text" value="" id="amount"  style="width: 150px;" />
									</p>
								</td>
							</tr>
							<tr>
								&lt;%&ndash;<td class="input_text tar">支付方式：</td>
								<td>
									<p>
									  <select name="payType" id="payType" >
										<option value="">请选支付方式</option>
									</select>
									</p>
								</td>&ndash;%&gt;
								<td class="input_text tar">支付宝：</td>
								<td>
									<p>
										<input name="Alipay" type="text" value="" id="Alipay" style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">姓名：</td>
								<td>
									<p>
										<input name="name" type="text" value="" id="name" style="width: 150px;" />
									</p>
								</td>
							</tr>

							&lt;%&ndash;<tr><td colspan="6" style="margin-top: 116px;"><h5>添加设备</h5></td></tr>
							<tr>
								<td class="input_text tar">设备类型：</td>
								<td>
									<p>
									  <select name="deviceType" id="deviceType" >
										<option value="">请选设备类型</option>
									</select>
									</p>
								</td>
								<td class="input_text tar">设备ID：</td>
								<td>
									<p>
										<input name="deviceId" type="text" value="" id="deviceId" style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">设备机型：</td>
								<td>
									<p>
										<input name="deviceDetail" type="text" value="" id="deviceDetail" style="width: 150px;" />
									</p>
								</td>
							</tr>&ndash;%&gt;
						</table>--%>
						<table border="0" cellpadding="0" cellspacing="6" style="width: 100%">
							<tr>
								<td class="input_text tar">用户名：</td>
								<td>
									<p>
										<input name="userId" type="hidden" value="${user.id}" id="userId"/>
										<input name="username" type="text" value="${user.username}" id="username"
											   style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">邮箱：</td>
								<td>
									<p>
										<input name="email" type="text" value="${user.email}" id="email"  style="width: 150px;"/>
									</p>
								</td>
								<td class="input_text tar">QQ：</td>
								<td>
									<p>
										<input name="qq" type="text" value="${user.qq}" id="qq" style="width: 150px;" />
									</p>
								</td>
							</tr>
							<tr>
								<td class="input_text tar">电话：</td>
								<td>
									<p>
										<input name="tel" type="text" value="${user.telephone}" id="tel" style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">支付宝：</td>
								<td>
									<p>
										<input name="alipay" type="text" value="${user.alipay}" id="alipay" style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">姓名：</td>
								<td>
									<p>
										<input name="name" type="text" value="${user.name}" id="name"  style="width: 150px;" />
									</p>
								</td>
							</tr>
							<tr>
								<td class="input_text tar">总收入：</td>
								<td>
									<p>
										<%-- <select name="payType" id="payType" >
                                           <option value="">请选支付方式</option>
                                       </select>--%>
										<input name="amount" type="text" value="${user.amount}" id="amount"  style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">余额：</td>
								<td>
									<p>
										<input name="balance" type="text" value="${user.balance}" id="balance" style="width: 150px;" />
									</p>
								</td>
								<td class="input_text tar">注册日期：</td>
								<td>
									<p>
										<input name="recordDate" type="text" value="${user.recordDate}" id="recordDate" style="width: 150px;" />
									</p>
								</td>
							</tr>
						</table>
					</div>
				</div>
				 <div class="form_btn form_btn_static">
                    <ul>
                        <li><input type="button" value="保存" id="save"/></li>
                        <li><input type="button" value="关闭" onclick="Common.closePage();" /></li>
                    </ul>
                </div>
			</div>
		</div>
	</form>

	<script>
		$("#save").click(function(){


			var username=document.getElementById("username").value;
			var email=document.getElementById("email").value;
			var qq=document.getElementById("qq").value;
			var telephone=document.getElementById("tel").value;
			var alipay=document.getElementById("alipay").value;
			var name=document.getElementById("name").value;
			var amount=document.getElementById("amount").value;
			var balance=document.getElementById("balance").value;
			var recordDate=document.getElementById("recordDate").value;
			var user={"username":username,"email":email,
				"qq":qq,"telephone":telephone,"alipay":alipay,
				"name":name,"amount":amount,"balance":balance,"recordDate":recordDate};

			var url="${pageContext.request.contextPath}/user/save.do";

			$.post(
					url,
					{"data":JSON.stringify(user)},
					function(data) {
						if(data=="success") {
							alert("信息已录入！");
							location.href="${pageContext.request.contextPath}/user/findAll.do"
						}
					});
		});

	</script>
</body>
</html>
