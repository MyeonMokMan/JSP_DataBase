<%@page import="Member.MemberBean"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=mbean.getId() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250"><%=mbean.getEmail() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">전화번호</td>
				<td width="250"><%=mbean.getTel() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">취미</td>
				<td width="250"><%=mbean.getHobby() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">직업</td>
				<td width="250"><%=mbean.getJob() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">나이</td>
				<td width="250"><%=mbean.getAge() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">비고</td>
				<td width="250"><%=mbean.getInfo()%></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<button onclick="location.href='MemberUpdateForm.jsp?id=<%=mbean.getId()%>'">수정</button>
					<button onclick="location.href='MemberDeleteForm.jsp?id=<%=mbean.getId()%>'">삭제</button>
					<button onclick="location.href='MemberList.jsp'">목록</button>
					<button onclick="location.href='MemberJoin.jsp'">회원가입</button>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>