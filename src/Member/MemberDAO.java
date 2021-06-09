package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

//����Ŭ �����ͺ��̽��� �����ϰ� select,delete,insert,update �۾��� �����ϴ� Ŭ����.
public class MemberDAO {
	
	String id="����Ŭ ���̵�";
	String pass="����Ŭ ��й�ȣ";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	//�����ͺ��̽��� ������ �� �ֵ��� ����
	Connection con;
	
	//�����ͺ��̽����� ������ ��������ִ� ��ü
	PreparedStatement pstmt;
	
	//�����ͺ��̽��� ���̺��� ����� ���� �޾� �ڹٿ� �������ִ� ��ü
	ResultSet rs;
	
	//�����ͺ��̽��� ������ �� �ֵ��� �����ִ� �޼ҵ�
	public void getCon() {
		try {
			//�ش� �����ͺ��̽��� ����Ѵٰ� ����
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//�ش� �����ͺ��̽��� ����
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertMember(MemberBean mbean) {
		try{
			//���� ������ �����ͺ��̽��� ������ �� �ֵ��� �����ִ� �޼ҵ�
			getCon();
			
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
		}
	}
	
	public Vector<MemberBean> allSelectMember() {
		
		Vector<MemberBean> vec = new Vector();
		
		try {
			//Ŀ�ؼ� ����
			getCon();
			
			//���� �غ�
			String sql = "select * from member";
			
			//������ ��������ִ� ��ü ����
			pstmt = con.prepareStatement(sql);
			
			//������ ���� ��Ų ����� �����ؼ� �޾���
			rs = pstmt.executeQuery();
			
			//�ݺ����� ����ؼ� rs�� ����� �����͸� ����.
			while(rs.next()) {
				
				//�÷����� �������� �����͸� MemberBean Ŭ������ ����
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				//��Ű¡ �� MemberBean Ŭ������ ���Ϳ� ����
				vec.add(bean);
			}
			
			//�ڿ� �ݳ�
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vec;
	}
	
	//�� ����� ���� ������ �����ϴ� �޼ҵ� �ۼ�
	public MemberBean oneSelectorMember(String id) {
		
		//�� ����� ���� ������ �����ϱ� ������ MemberBean Ŭ���� ��ü ����
		MemberBean bean = new MemberBean();
		
		try {
			//Ŀ�ؼ� ����
			getCon();
			
			//���� �ۼ�
			String sql = "select * from member where id=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id); //���� �Ű������� ���̵� �ִ´�.
			
			//���� ����
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //���ڵ尡 �ִٸ�
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			
			//�ڿ� �ݳ�
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
}
