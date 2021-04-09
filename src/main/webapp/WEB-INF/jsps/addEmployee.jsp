<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>社員マスタ登録</title>
<style type="text/css">
	.error {
		color: #ff0000;
	}
</style>
</head>
<body>
	<h1>社員マスタ 登録/編集</h1>
	<f:form modelAttribute="employee" action="saveProcess">

		<input type="hidden" value="${employee.hobbies}" id="hiddenTxt" />
		<f:hidden path="id" />

		<table>
			<tr>
				<td>社員名</td>
				<td><f:input path="name" /></td>
				<td><f:errors path="name" element="div" cssClass="error" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><f:input path="email" /></td>
				<td><f:errors path="email" element="div" cssClass="error" /></td>
			</tr>
			<tr>
				<td>性別</td>
				<td>
					<f:radiobutton path="gender" value="男" checked="checked" />男
					<f:radiobutton path="gender" value="女" />女
				</td>
				<td><f:errors path="gender" element="div" cssClass="error" /></td>
			</tr>
			<tr>
				<td>趣味</td>
				<td>
					<f:checkbox path="hobbies" value="スポーツ"/>スポーツ
					<f:checkbox path="hobbies" value="読書"/>読書
					<f:checkbox path="hobbies" value="ゴルフ"/>ゴルフ
				</td>
				<td><f:errors path="hobbies" element="div" cssClass="error" /></td>
			</tr>
			<tr>
				<td>国籍</td>
				<td><f:input path="country" /></td>
				<td><f:errors path="country" element="div" cssClass="error" /></td>
			</tr>
			<tr>
				<td>住所</td>
				<td><f:textarea path="address" /></td>
				<td><f:errors path="address" element="div" cssClass="error" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="登録" /></td>
			</tr>
		</table>
	</f:form>

</body>
</html>