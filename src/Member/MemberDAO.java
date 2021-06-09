package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

//오라클 데이터베이스에 연결하고 select,delete,insert,update 작업을 실행하는 클래스.
public class MemberDAO {
	
	String id="오라클 아이디";
	String pass="오라클 비밀번호";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	//데이터베이스에 접근할 수 있도록 설정
	Connection con;
	
	//데이터베이스에서 쿼리를 실행시켜주는 객체
	PreparedStatement pstmt;
	
	//데이터베이스의 테이블의 결과를 리턴 받아 자바에 저장해주는 객체
	ResultSet rs;
	
	//데이터베이스에 접근할 수 있도록 도와주는 메소드
	public void getCon() {
		try {
			//해당 데이터베이스를 사용한다고 선언
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//해당 데이터베이스를 접속
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertMember(MemberBean mbean) {
		try{
			//위에 선언한 데이터베이스에 접근할 수 있도록 도와주는 메소드
			getCon();
			
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
		}
	}
	
	public Vector<MemberBean> allSelectMember() {
		
		Vector<MemberBean> vec = new Vector();
		
		try {
			//커넥션 연결
			getCon();
			
			//쿼리 준비
			String sql = "select * from member";
			
			//쿼리를 실행시켜주는 객체 선언
			pstmt = con.prepareStatement(sql);
			
			//쿼리를 실행 시킨 결과를 리턴해서 받아줌
			rs = pstmt.executeQuery();
			
			//반복문을 사용해서 rs에 저장된 데이터를 추출.
			while(rs.next()) {
				
				//컬럼으로 나뉘어진 데이터를 MemberBean 클래스에 저장
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				//패키징 된 MemberBean 클래스를 벡터에 저장
				vec.add(bean);
			}
			
			//자원 반납
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vec;
	}
	
	//한 사람에 대한 정보를 리턴하는 메소드 작성
	public MemberBean oneSelectorMember(String id) {
		
		//한 사람에 대한 정보만 리턴하기 때문에 MemberBean 클래스 객체 생성
		MemberBean bean = new MemberBean();
		
		try {
			//커넥션 연결
			getCon();
			
			//쿼리 작성
			String sql = "select * from member where id=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id); //위에 매개변수에 아이디를 넣는다.
			
			//쿼리 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //레코드가 있다면
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			
			//자원 반납
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
}
