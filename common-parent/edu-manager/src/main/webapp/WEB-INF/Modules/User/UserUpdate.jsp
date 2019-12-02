<!DOCTYPE html>
<html>
<head>
<title></title>

	<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-migrate-1.4.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){

});
</script>
</head>
<body>

	<form method="post" id="userForm" action="">
		<div class="specificPageEdit" style="*position: static;">
			<div class="form">
				<div class="specificPage_header fix">
					<h4 class="specificPage_title l">
						<span id="MainContent_lbTitle">修改</span>
					</h4>
					<span class="closePage r" onclick="Common.closePage();">关闭</span>
				</div>
				<div id="MainContent_divTitleTab" class="activeEdite_tab_list"
					style="margin-bottom: 3px;">
					<p>
						<span class="tab_list_current" data-tab="tab_1" onclick="Common.switchTab(this);">修改用户信息</span>
					</p>
				</div>

				<div class="hide_tab fix" data-tab="tab_1" id="tab_1">
					<div id="MainContent_UpdatePanel1">
						<table border="0" cellpadding="0" cellspacing="6" style="width: 100%">
							<tr>
								<td class="input_text tar">用户名：</td>
								<td>
									<p>
										<input name="userId" type="hidden" value="${user.id}" id="userId"/>
										<input name="username" type="text" value="${user.username}" id="username"
										style="width: 150px;" readonly="readonly"/> 
									</p>
								</td>
								<td class="input_text tar">邮箱：</td>
								<td>
									<p>
										<input name="email" type="text" value="${user.email}" id="email"  style="width: 150px;" readonly="readonly"/>
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
                        <li><input type="button" value="保存" id="submitSave" onclick=""/></li>
                        <li><input type="button" value="关闭" onclick="Common.closePage();" /></li>
                    </ul>
                </div>
			</div>
		</div>
	</form>

    <script>
        $("#submitSave").click(function(){

			var id=document.getElementById("userId").value;
            var username=document.getElementById("username").value;
            var email=document.getElementById("email").value;
            var qq=document.getElementById("qq").value;
            var telephone=document.getElementById("tel").value;
            var alipay=document.getElementById("alipay").value;
            var name=document.getElementById("name").value;
            var amount=document.getElementById("amount").value;
            var balance=document.getElementById("balance").value;
            var recordDate=document.getElementById("recordDate").value;
            var user={"id":id,"username":username,"email":email,
                "qq":qq,"telephone":telephone,"alipay":alipay,
                "name":name,"amount":amount,"balance":balance,"recordDate":recordDate};

            var url="${pageContext.request.contextPath}/user/update.do";

            $.post(
                url,
                {"data":JSON.stringify(user)},
                function(data) {
                	alert("信息已录入！");
					location.href="${pageContext.request.contextPath}/user/findAll.do";
                });
        });

    </script>
</body>
</html>
