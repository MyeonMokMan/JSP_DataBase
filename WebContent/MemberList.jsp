<%@page import="Member.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 리스트</title>
</head>
<body>

	<!-- 1.데이터베이스에서 모든 회원 정보를 가져옴. 2.table 태그를 이용하여 회원 정보를 출력-->
	
	<%
		MemberDAO mdao = new MemberDAO();
		
		//회원들의 정보가 얼마나 저장되어있는지 모르기에 가변길이의 Vector를 이용하여 데이터를 저장.
		Vector<MemberBean> vec = mdao.allSelectMember();
		
	%>
	
	<center>
	<h2>모든 회원 보기</h2>
		<table width="600" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td align="center" width="250">이메일</td>
				<td align="center" width="200">전화번호</td>
				<td align="center" width="200">취미</td>
			</tr>
			<%
				for(int i=0; i<vec.size(); i++) {
					MemberBean bean = vec.get(i); //벡터에 담긴 빈 클래스를 하나씩 추출
			%>
			<tr height="50">
				<td align="center" width="150">
				<a href="MemberInfo.jsp?id=<%=bean.getId()%>">
				<%=bean.getId()%></td>
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