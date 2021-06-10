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
<!--MemberList.jsp에서 id를 받아줌 / 데이터베이스에서 한 회원의 정보를 가져옴 / table 태그를 이용하여 회원의 정보를 출력 -->
	
		<%
			String id = request.getParameter("id");	//MemberList.jsp에서 id를 받아옴 
		
			MemberDAO mdao = new MemberDAO();
			MemberBean mbean = mdao.oneSelectorMember(id);
		%>
	
	<center>
		<h2>회원 정보 보기</h2>
		<table width="400" border="1">
		<form action="MemberUpdateProc.jsp" method="post">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=mbean.getId() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250"><input type="email" name="email" value="<%=mbean.getEmail() %>" placeholder="<%=mbean.getEmail() %>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">전화번호</td>
				<td width="250"><input type="tel" name="tel" value="<%=mbean.getTel() %>" placeholder="<%=mbean.getTel() %>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250"><input type="password" name="pass1"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%=mbean.getId()%>"> <!-- 아이디가 숨겨서 넘어간다.(UpdateProc.jsp) -->
					<input type="submit" value="회원 수정"></form>
					<button onclick="location.href='MemberList.jsp'">목록보기</button>
				</td>
			</tr>
		</table>
		
	</center>
</body>
</html>