<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("euc-kr");
	%>
	
	<jsp:useBean id="mbean" class="Member.MemberBean">
		<jsp:setProperty name="mbean" property="*" /> <!-- 4���� �ְ� �������� null������ �ٸ� ���� ������ ����. -->
	</jsp:useBean>
	
	<%
	
		MemberDAO mdao = new MemberDAO();
		//��Ʈ�� Ÿ������ ����Ǿ� �ִ� �н����带 ������.
		
		String pass = mdao.getPass(mbean.getId());
		
		//�����ϱ� ���� �ۼ��� �н����� ���� �����ͺ��̽����� ������ �н����� ���� ��
		if(mbean.getPass1().equals(pass)) {
			//MemberDaoŬ������ ȸ������ �޼ҵ� ȣ��
			mdao.updateMember(mbean);
			response.sendRedirect("MemberList.jsp");
			
		} else {	
	%>
			<script type="text/javascript">
				alert("�н����尡 ���� �ʽ��ϴ�.")
				history.go(-1);
			</script>
	<%
		}
	%>
</body>
</html>