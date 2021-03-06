<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="wst" uri="/webSupportTag"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'merchantNews.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<a href="addMerchantNewsInput">发布新闻</a>
	<table>
		<tr>
			<td>序号</td>
			<td>标题</td>
			<td>时间</td>
			<td>操作</td>
		</tr>
		<s:iterator value="#request.merchantNews" status="status">
			<tr>
				<td><s:property
						value="(page.currentPage - 1) * page.eachPageNumber + #status.count" />
				</td>
				<td><s:a href="merchantNewsDetails?merchantNews.id=%{id}">
						<s:property value="tittle" />
					</s:a>
				</td>
				<td><s:date name="datetime" format="yyyy-MM-dd hh:mm:ss" /></td>
				<td><s:a href="deleteMerchantNews?merchantNews.id=%{id}">删除</s:a>
				</td>
			</tr>
		</s:iterator>
	</table>
	<wst:page url="merchantNews" />
</body>
</html>
