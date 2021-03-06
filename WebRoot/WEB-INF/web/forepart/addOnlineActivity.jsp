<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>校江湖 - 活动</title>

<link rel="stylesheet" type="text/css" href="css/base-min.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/page-club.css" />

</head>

<body>

	<div class="container cf zoom">
		<jsp:include page="head.jsp" />

		<!-- 提示信息 -->
		<s:property value="message" />
		<form action="addOnlineActivity" method="post" enctype="multipart/form-data">
			<table class="applyClubTable shadow_l_5">
				<thead>
					<tr>
						<th colspan="2">发布线上活动</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class=""><label>活动名称：</label> </th>
						<td class=""><label><input type="text" name="onlineactivity.tittle"/></label> </td>
					</tr>
					<tr>
						<th><label>活动内容：</label></th>
						<td><textarea id="editor" name="onlineactivity.text" id="ncontent"></textarea></td>
					</tr>
					<tr>
						<th><label>宣传照片链接：</label></th>
						<td><label><input type="text" name="onlineactivity.titleImgPath" /></label></td>
					</tr>
					<tr>
						<th><label>相关视频链接：</label></th>
						<td><label><input type="text" name="onlineactivity.videoUrl" /></label></td>
					</tr>
					<tr>
						<th><label>宣传照片上传：</label></th>
						<td><input type="file" name="uploadImage" required /></td>
					</tr>
					<tr>
						<th><label>相关视频上传：</label></th>
						<td><input type="file" name="uploadVideo" required /></td>
					</tr>
					<tr>
						<th></th>
						<td>
							<s:hidden name="user.id" value="%{#session.user.id}" />
							<input type="submit" class="applyClubTable_submit shadow_l_5 hov" value="发布">
						</td>
					</tr>
					<tr></tr>
				</tbody>
			</table>
		</form>

	</div>

	<script type="text/javascript" src="<%=path%>/editor/kindeditor.js"></script>
	<script type="text/javascript" src="<%=path%>/editor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.8.1.min.js"></script>

	<!--文本编辑器-->
	<script>
	var editor;
	$(document).ready(function (){
		//渲染编辑器
		KindEditor.ready(function(K) {
			editor = K.create('#editor',{
				items:[
					'source','preview','fontname','fontsize','forecolor','hilitecolor','bold','italic','underline','strikethrough','justifyleft','justifycenter','justifyright','hr','image','emoticons','fullscreen','insertfile'
				],
				uploadJson : '<%=path%>
		/editorUploadJsp',
							afterChange : function() {
								$('#alreadyInput').html(this.count());
								$('#stillInput').html(2000 - this.count());
							}
						});
					});

				});
	</script>

</body>
</html>
