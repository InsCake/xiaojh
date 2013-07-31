<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="wst" uri="/webSupportTag"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'searchUserToAdd.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<form action="searchUserToManage" method="post">
		<s:textfield name="text" value="%{text}" />
		<input type="submit" value="搜索">
	</form>

	<table>
		<tr>
			<td>用户名</td>
			<td>身份</td>
			<td>操作</td>
		</tr>

		<s:iterator value="#request.users.userList">
			<tr>
				<td><s:property value="name" />
				</td>
				<td><s:if test="#request.clubMembers[id] != null">
						<s:property value="#request.clubMembers[id].role.name" />
						<s:if test="#request.clubMembers[id].status.name() == 'NO_CHECK'">(<s:property
								value="#request.clubMembers[id].status.name" />)</s:if>
					</s:if> <s:else>
						非社员
					</s:else>
				</td>
				<td><s:if test="#session.clubMember.role.name() == 'NORMAL'">
						无
					</s:if> <s:else>
						<s:if test="#request.clubMembers[id] == null">
							<s:a href="clubAddUser?user.id=%{id}&text=%{text}">添加</s:a>
						</s:if>
						<s:elseif test="#request.clubMembers[id].role.name() == 'NORMAL'">
							<s:if test="#request.clubMembers[id].status.name() == 'NO_CHECK'">
								<s:if
									test="#request.clubMembers[id].source.name() == 'CLUB_TO_USER'">
									已发出邀请
								</s:if>
								<s:else>
									<s:a href="clubAcceptInvited?user.id=%{id}">接受申请</s:a>
									<s:a href="clubRefuseInvited?user.id=%{id}">拒绝</s:a>
								</s:else>
							</s:if>
							<s:else>
								<s:if test="#session.clubMember.role.name() == 'PROPRIETER'">
									<s:a href="updateMemberToManager?user.id=%{id}">变为管理员</s:a>
								</s:if>
								<s:a href="fireClubMember?user.id=%{id}">开除</s:a>
							</s:else>
						</s:elseif>
						<s:else>
							<s:if test="#session.clubMember.role.name() != 'PROPRIETER'">
								无
							</s:if>
							<s:else>
								<s:if
									test="#request.clubMembers[id].role.name() == 'PROPRIETER'">
									<a href="changeProprieterInput">换社长</a>
								</s:if>
								<s:else>
									<s:a href="updateMemberToNormal?user.id=%{id}">取消管理权限</s:a>
									<s:a href="fireClubMember?user.id=%{id}">开除</s:a>
								</s:else>
							</s:else>
						</s:else>
					</s:else>
				</td>
			</tr>
		</s:iterator>
	</table>

	<wst:page url="searchUserToManage?text=%{text}"
		value="#request.users.page" />
</body>
</html>