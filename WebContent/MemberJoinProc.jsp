<%@page import="Member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		
		//��� �κ��� ������ �о��� MemberBean Ŭ������ ����
		String[] hobby = request.getParameterValues("hobby");
		
		//�迭�� �ִ� ��̵��� �ϳ��� ��Ʈ������ ���� �̰��� for������ �����ؾ��Ѵ�.
		String textHobby = "";
		
		for(int i=0; i<hobby.length; i++) {
			textHobby += hobby[i]+" ";
		}
	%>
	
	<!-- useBean�� �̿��Ͽ� MemberBean Ŭ������ �����͸� �Ѳ����� �޾ƿ� -->
	<jsp:useBean id="mbean" class="Member.MemberBean">
		<jsp:setProperty name="mbean" property="*"/> <!-- ���� -->
	</jsp:useBean>
	
	<%
		mbean.setHobby(textHobby); //���� hobby���� �ּҰ� ����ֱ� ������ textHobby�� ��̵��� �־��ش�.
		
		/* //����Ŭ�� �����ϴ� �ҽ� �ۼ�.
		String id="����Ŭ ���̵�";
		String pass="����Ŭ ��й�ȣ";
		String url="jdbc:oracle:thin:@localhost:1521:XE";
		
		try{
			//�ش� �����ͺ��̽��� ����Ѵٰ� ����
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//�ش� �����ͺ��̽��� ����
			Connection con = DriverManager.getConnection(url, id, pass);
			
			//���� �� ���� �غ�
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			
			//������ ����ϵ��� ����
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			//?�� �°� �����͸� ����
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			
			//����Ŭ���� ������ �����ϴ� �ڵ�
			pstmt.executeUpdate(); //insert, update, delete ����ϴ� �ڵ�
			
			//�ڿ� �ݳ�
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		} */
		
		//�����ͺ��̽� Ŭ���� ��ü ����
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);
		
		//ȸ�������� �Ϸ� �Ǿ����� ȸ�� ������ �����ִ� �������� �̵�
		response.sendRedirect("MemberList.jsp");
	%>
	
	
	
</body>
</html>