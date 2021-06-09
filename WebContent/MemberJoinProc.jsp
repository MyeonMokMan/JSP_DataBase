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
		
		//취미 부분은 별도로 읽어드려 MemberBean 클래스에 저장
		String[] hobby = request.getParameterValues("hobby");
		
		//배열에 있는 취미들을 하나의 스트링으로 저장 이것은 for문으로 추출해야한다.
		String textHobby = "";
		
		for(int i=0; i<hobby.length; i++) {
			textHobby += hobby[i]+" ";
		}
	%>
	
	<!-- useBean을 이용하여 MemberBean 클래스의 데이터를 한꺼번에 받아옴 -->
	<jsp:useBean id="mbean" class="Member.MemberBean">
		<jsp:setProperty name="mbean" property="*"/> <!-- 맵핑 -->
	</jsp:useBean>
	
	<%
		mbean.setHobby(textHobby); //기존 hobby에는 주소가 들어있기 때문에 textHobby의 취미들을 넣어준다.
		
		/* //오라클에 접속하는 소스 작성.
		String id="오라클 아이디";
		String pass="오라클 비밀번호";
		String url="jdbc:oracle:thin:@localhost:1521:XE";
		
		try{
			//해당 데이터베이스를 사용한다고 선언
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//해당 데이터베이스를 접속
			Connection con = DriverManager.getConnection(url, id, pass);
			
			//접속 후 쿼리 준비
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			
			//쿼리를 사용하도록 설정
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			//?에 맞게 데이터를 맵핑
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			
			//오라클에서 쿼리를 실행하는 코드
			pstmt.executeUpdate(); //insert, update, delete 사용하는 코드
			
			//자원 반납
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		} */
		
		//데이터베이스 클래스 객체 생성
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);
		
		//회원가입이 완료 되었으면 회원 정보를 보여주는 페이지로 이동
		response.sendRedirect("MemberList.jsp");
	%>
	
	
	
</body>
</html>