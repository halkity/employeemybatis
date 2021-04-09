<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>社員マスタ</title>
</head>
<body>
	<h1>社員マスタ</h1>
	<hr />
	<h2>社員検索</h2>
	<f:form modelAttribute="employee" action="seachEmployee">
		<input type="hidden" value="${employee.hobbies}" />
		<f:hidden path="id" />
		<table>
			<tr>
				<td>名前：</td>
				<td><f:input path="name" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Email：</td>
				<td><f:input path="email" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>性別：</td>
				<td>
					<f:radiobutton path="gender" value="男" />男 
					<f:radiobutton path="gender" value="女" />女 
					<f:radiobutton path="gender" value="" />設定なし
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><input type="submit" value="検索" /></td>
			</tr>
		</table>
	</f:form>
	<c:if test="${listemployee.size() > 0}">
		<table border="1">
			<tr>
				<th>名前</th>
				<th>Email</th>
				<th>性別</th>
				<th>趣味</th>
				<th>国籍</th>
				<th>住所</th>
				<th colspan="2">編集</th>
			</tr>
			<c:forEach items="${listemployee}" var="e">

				<c:url var="deleteLink" value="/deleteEmployee">
					<c:param name="employeeId" value="${e.id}" />
				</c:url>

				<c:url var="updateLink" value="/editEmployee">
					<c:param name="employeeId" value="${e.id}" />
				</c:url>

				<tr>
					<td>&nbsp;${e.name}&nbsp;</td>
					<td>&nbsp;${e.email}&nbsp;</td>
					<td>&nbsp;${e.gender}&nbsp;</td>
					<td>&nbsp;${e.hobbies}&nbsp;</td>
					<td>&nbsp;${e.country}&nbsp;</td>
					<td>&nbsp;${e.address}&nbsp;</td>
					<td>&nbsp;<a href="${updateLink}">修正</a>&nbsp;
					</td>
					<td>&nbsp;<a href="${deleteLink}"
						onclick="if(!(confirm('本当に削除しますか?'))) return false;">削除</a>&nbsp;
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${listemployee.size() == 0}">
		<p>検索条件に一致するデータはありません</p>
	</c:if>
	<table>
		<tr>
			<td><button type="submit" onclick="location.href='formEmployee'">社員登録</button></td>
		</tr>
	</table>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$raidoCheckedItem = $("input[name=gender]:checked");
		if($raidoCheckedItem.length == 0){
			$("input[name=gender]:eq(2)").prop("checked", true);
		}
	</script>

</body>
</html>