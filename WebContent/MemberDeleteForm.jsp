<%@page import="Member.MemberBean"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<center>
		<h2>회원 정보 보기</h2>
		<table width="400" border="1">
		<form action="MemberDeleteProc.jsp" method="post">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=request.getParameter("id")%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250"><input type="password" name="pass1"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%=request.getParameter("id")%>"> <!-- 아이디가 숨겨서 넘어간다.(UpdateProc.jsp) -->
					<input type="submit" value="회원 삭제"></form>
					<button onclick="location.href='MemberList.jsp'">목록보기</button>
				</td>
			</tr>
		</table>
		
	</center>
</body>
</html>