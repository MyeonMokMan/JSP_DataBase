<%@page import="Member.MemberBean"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!--MemberList.jsp���� id�� �޾��� / �����ͺ��̽����� �� ȸ���� ������ ������ / table �±׸� �̿��Ͽ� ȸ���� ������ ��� -->
	
	<%
		String id = request.getParameter("id");	//MemberList.jsp���� id�� �޾ƿ� 
	
		MemberDAO mdao = new MemberDAO();
		MemberBean mbean = mdao.oneSelectorMember(id);
	%>
	
	<center>
		<h2>ȸ�� ���� ����</h2>
		<table width="400" border="1">
			<tr height="50">
				<td align="center" width="150">���̵�</td>
				<td width="250"><%=mbean.getId() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">�̸���</td>
				<td width="250"><%=mbean.getEmail() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">��ȭ��ȣ</td>
				<td width="250"><%=mbean.getTel() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">���</td>
				<td width="250"><%=mbean.getHobby() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">����</td>
				<td width="250"><%=mbean.getJob() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">����</td>
				<td width="250"><%=mbean.getAge() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">���</td>
				<td width="250"><%=mbean.getInfo()%></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<button onclick="location.href='MemberUpdateForm.jsp?id=<%=mbean.getId()%>'">����</button>
					<button onclick="location.href='MemberDeleteForm.jsp?id=<%=mbean.getId()%>'">����</button>
					<button onclick="location.href='MemberList.jsp'">���</button>
					<button onclick="location.href='MemberJoin.jsp'">ȸ������</button>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>