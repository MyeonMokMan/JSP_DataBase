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
<!--MemberList.jsp���� id�� �޾��� / �����ͺ��̽����� �� ȸ���� ������ ������ / table �±׸� �̿��Ͽ� ȸ���� ������ ��� -->
	
		<%
			String id = request.getParameter("id");	//MemberList.jsp���� id�� �޾ƿ� 
		
			MemberDAO mdao = new MemberDAO();
			MemberBean mbean = mdao.oneSelectorMember(id);
		%>
	
	<center>
		<h2>ȸ�� ���� ����</h2>
		<table width="400" border="1">
		<form action="MemberUpdateProc.jsp" method="post">
			<tr height="50">
				<td align="center" width="150">���̵�</td>
				<td width="250"><%=mbean.getId() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">�̸���</td>
				<td width="250"><input type="email" name="email" value="<%=mbean.getEmail() %>" placeholder="<%=mbean.getEmail() %>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">��ȭ��ȣ</td>
				<td width="250"><input type="tel" name="tel" value="<%=mbean.getTel() %>" placeholder="<%=mbean.getTel() %>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">�н�����</td>
				<td width="250"><input type="password" name="pass1"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%=mbean.getId()%>"> <!-- ���̵� ���ܼ� �Ѿ��.(UpdateProc.jsp) -->
					<input type="submit" value="ȸ�� ����"></form>
					<button onclick="location.href='MemberList.jsp'">��Ϻ���</button>
				</td>
			</tr>
		</table>
		
	</center>
</body>
</html>