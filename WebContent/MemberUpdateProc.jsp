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
		<jsp:setProperty name="mbean" property="*" /> <!-- 4개만 넣고 나머지는 null이지만 다른 것은 영향이 없다. -->
	</jsp:useBean>
	
	<%
	
		MemberDAO mdao = new MemberDAO();
		//스트링 타입으로 저장되어 있는 패스워드를 가져옴.
		
		String pass = mdao.getPass(mbean.getId());
		
		//수정하기 위해 작성된 패스워드 값과 데이터베이스에서 가져온 패스워드 값을 비교
		if(mbean.getPass1().equals(pass)) {
			//MemberDao클래스의 회원수정 메소드 호출
			mdao.updateMember(mbean);
			response.sendRedirect("MemberList.jsp");
			
		} else {	
	%>
			<script type="text/javascript">
				alert("패스워드가 맞지 않습니다.")
				history.go(-1);
			</script>
	<%
		}
	%>
</body>
</html>