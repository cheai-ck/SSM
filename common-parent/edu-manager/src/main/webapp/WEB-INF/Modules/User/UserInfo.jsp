﻿<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title>用户信息</title>
	<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/Styles/bridging.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-migrate-1.4.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/common.js"></script>
<script type="text/javascript">
	 function search() {
		 /* $("#searchUserForm1").attr("action","");
		  $("#searchUserForm1").submit();
		  }*/

		 $(document).ready(function () {

			 $("#birthday").datepicker({
				 dateFormat: 'yy-mm-dd',
			 });

		 });
	 }

	 function changeIndex() {
         var page = document.getElementById("page").value;
         location.href="${pageContext.request.contextPath}/page/index.do?index="+page;
     }
     function findLike() {

		 var yhm = document.getElementById("yhm").value;
		 if(yhm==""){
		 	alert("请输入关键字！");
		 	return;
		 }
		 location.href="${pageContext.request.contextPath}/user/like.do?user="+yhm;
	 }
</script>
</head>
<body>
	<form id="searchUserForm1" action="" method="post">
		<div class="condition_search">
			<div class="search_title">
				<h3 class="total_title">条件查询</h3>
				<span class="clickToReflesh" onclick="window.location.href = window.location.href;">点击刷新</span>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="MainContent_labAllTotal"></span></div>
			</div>

			<div class="search_detail" style="height: 80px;">
				<div class="search_table">
					<table cellpadding="0" cellspacing="0" style="width: 900px">
						<tr>
							<td class="input_text tar">用户名：</td>
							<td>
								<p><input type="text" id="yhm" name="yhm" style="width: 120px;"></p>
							</td>

					</table>
				</div>
				<input type="button" onclick="findLike()" class="search_btn" />
			</div>
			<div class="edit">
				<h3 class="total_title">查询结果</h3>
				<ul>
					<li><input type="button" value="新增" class="addition"
						data-url="${pageContext.request.contextPath}/user/add.do"
						onclick="Common.showPage(this);" /></li>
				</ul>
			</div>
		</div>
		
		<!--这里是表格数据-->
		<div class="total_table rel">
			<table border="0" cellspacing="0" cellpadding="0"
				style="width: 100%;">
				<thead>
					<tr>
						<td style="width: 80px; text-align: center;"><p>用户名</p></td>
						<td style="width: 100px"><p>邮箱</p></td>
						<td style="width: 80px"><p>QQ</p></td>
						<td style="width: 80px"><p>手机号码</p></td>
						<td style="width: 100px"><p>支付宝</p></td>
						<td style="width: 80px"><p>姓名</p></td>
						<td style="width: 80px"><p>总收入</p></td>
						<td style="width: 80px"><p>余额</p></td>
						<td style="width: 100px"><p>注册日期</p></td>
						<td class="total_table_contral" style="width: 210px"><p>操作</p></td>
					</tr>
				</thead>
			</table>
			<div style="height: 200px; overflow-y: auto; overflow-x: hidden;">
				<table cellpadding="0" cellspacing="0"
					style="width: 100%; background-color: #FFF;">

					<tbody>
					<c:forEach items="${userList}" var="user">
							<tr onclick="Common.switchLine(this,event);">
								<td style="width: 80px; text-align: center;"><p><span >${user.username}</span></p></td>
								<td style="width: 100px; text-align: center;"><p style="font-size: 4px;"><span >${user.email}</span></p></td>
								<td style="width: 80px; text-align: center;"><p><span >${user.qq}</span></p></td>
								<td style="width: 80px; text-align: center;"><p style="font-size: 5px;"><span >${user.telephone}</span></p></td>
								<td style="width: 100px; text-align: center;"><p style="font-size: 4px;"><span >${user.alipay}</span></p></td>
								<td style="width: 80px; text-align: center;"><p><span >${user.name}</span></p></td>
								<td style="width: 80px; text-align: center;"><p><span >${user.amount}</span></p></td>
								<td style="width: 80px; text-align: center;"><p><span >${user.balance}</span></p></td>
								<td style="width: 80px; text-align: center;"><p><span >${user.recordDate}</span></p></td>

								<td class="delete" style="width: 210px; text-align: center;">
									<%--<a href="${pageContext.request.contextPath}/user/update.do?user.id=${user.id}">edit</a>--%>
									<p><input type="button" onclick="Common.showPage(this);" value="编辑" 
									data-url="${pageContext.request.contextPath}/user/change.do?id=${user.id}" />
									<input type="button" onclick="Common.showPage(this);" value="删除"
									data-url="${pageContext.request.contextPath}/user/delete.do?id=${user.id}" />
								</td>
							</tr>

					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 分页查询 -->
		<div class="page">
			<p class="page_number">

                <a href="javascript:void(0)" onclick="this.href='${pageContext.request.contextPath}/page/index.do?index=1'">[第一页]</a>

                <c:if test="${pageBean.index==1}">

                </c:if>
                <c:if test="${pageBean.index>1}">
                    <a href="javascript:void(0)" onclick="this.href='${pageContext.request.contextPath}/page/index.do?index=${pageBean.index-1}'">[上一页]</a>
                </c:if>
                <c:if test="${pageBean.index<pageBean.totalPageCount}">
                    <a href="javascript:void(0)" onclick="this.href='${pageContext.request.contextPath}/page/index.do?index=${pageBean.index+1}'">[下一页]</a>
                </c:if>
                <c:if test="${pageBean.index!=null}">
                    <a href="javascript:void(0)" onclick="this.href='${pageContext.request.contextPath}/page/index.do?index=${pageBean.totalPageCount}'">[最后一页]</a>
                </c:if>

                <span><input type="text" style="width: 40px;" id="page">页</span>
                <span><input type="button" onclick="changeIndex()" value="确定"></span>
				<span>${pageBean.index}/${pageBean.totalPageCount}</span>
				<span>每页显示</span> ${pageBean.size}条记录 共${pageBean.totalCount}条记录
			</p>
		</div>
		
		<div class="specific_page tal dn" id="popupLayer">
        <!--这里删除了style属性-->
        <iframe id="childform" frameborder="0" border="0" class="iframe_layer" name="layer_iframe"></iframe>
    </div>
	</form>
</body>
</html>
