<%@page import="Member.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����Ʈ</title>
</head>
<body>
	<!-- 1.�����ͺ��̽����� ��� ȸ�� ������ ������. 2.table �±׸� �̿��Ͽ� ȸ�� ������ ���-->
	
	<%
		MemberDAO mdao = new MemberDAO();
		
		//ȸ������ ������ �󸶳� ����Ǿ��ִ��� �𸣱⿡ ���������� Vector�� �̿��Ͽ� �����͸� ����.
		Vector<MemberBean> vec = mdao.allSelectMember();
		
	%>
	
	<center>
	<h2>��� ȸ�� ����</h2>
		<table width="600" border="1">
			<tr height="50">
				<td align="center" width="150">���̵�</td>
				<td align="center" width="250">�̸���</td>
				<td align="center" width="200">��ȭ��ȣ</td>
				<td align="center" width="200">���</td>
			</tr>
			<%
				for(int i=0; i<vec.size(); i++) {
					MemberBean bean = vec.get(i); //���Ϳ� ��� �� Ŭ������ �ϳ��� ����
			%>
			<tr height="50">
				<td align="center" width="150">
				<a href="MemberInfo.jsp?id=<%=bean.getId()%>">
				<%=bean.getId() %></td>
				<td align="center" width="250"><%=bean.getEmail() %></td>
				<td align="center" width="200"><%=bean.getTel() %></td>
				<td align="center" width="200"><%=bean.getHobby() %></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
</body>
</html>