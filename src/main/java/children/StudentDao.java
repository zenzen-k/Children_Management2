package children;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class StudentDao {
	private static StudentDao sdao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private StudentDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
			conn = ds.getConnection();
			System.out.println("conn : " + conn);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 객체생성
	public static StudentDao getInstance() {
		if(sdao == null)
			sdao = new StudentDao();
		return sdao;
	}
	
	//전체유아테이브ㅡㄹ조회
	public ArrayList<StudentBean> getAllStudent(int k_no) {
		ArrayList<StudentBean> slist = new ArrayList<StudentBean>();
		String sql = "select * from student where k_no = " + k_no  + "order by c_age, c_no, s_name";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				StudentBean sb = new StudentBean();
				sb.setK_no(rs.getInt(k_no));
				sb.setS_no(rs.getString("s_no"));
				sb.setS_name(rs.getString("s_name"));
				sb.setS_birth(String.valueOf(rs.getDate("s_birth")));
				sb.setGender(rs.getString("gender"));
				sb.setEntran(String.valueOf(rs.getDate("entran")));
				sb.setAddr1(rs.getString("addr1"));
				sb.setAddr2(rs.getString("addr2"));
				sb.setAddr3(rs.getString("addr3"));
				sb.setC_no(rs.getInt("c_no"));
				sb.setC_age(rs.getInt("c_age"));
				sb.setNote(rs.getString("note"));
				sb.setAfter(rs.getString("after"));
				sb.setImgname(rs.getString("imgname"));
				
				slist.add(sb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return slist;
	}
	
	// 반선택조회
	public ArrayList<StudentBean> getAllStudentByCno(int k_no, String searchC_no) {
		ArrayList<StudentBean> slist = new ArrayList<StudentBean>();
		String sql = "select * from student where k_no = " + k_no  + " and c_no = " + searchC_no + " order by c_age, c_no, s_name";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				StudentBean sb = new StudentBean();
				sb.setK_no(rs.getInt(k_no));
				sb.setS_no(rs.getString("s_no"));
				sb.setS_name(rs.getString("s_name"));
				sb.setS_birth(String.valueOf(rs.getDate("s_birth")));
				sb.setGender(rs.getString("gender"));
				sb.setEntran(String.valueOf(rs.getDate("entran")));
				sb.setAddr1(rs.getString("addr1"));
				sb.setAddr2(rs.getString("addr2"));
				sb.setAddr3(rs.getString("addr3"));
				sb.setC_no(rs.getInt("c_no"));
				sb.setC_age(rs.getInt("c_age"));
				sb.setNote(rs.getString("note"));
				sb.setAfter(rs.getString("after"));
				sb.setImgname(rs.getString("imgname"));
				
				slist.add(sb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return slist;
	}
	
	// 선택한 학생 정보 가져오기
	public StudentBean getStudentBySno(String s_no) {
		StudentBean sb = new StudentBean();
		String sql = "select * from student where s_no = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				sb.setK_no(rs.getInt("k_no"));
				sb.setS_no(rs.getString("s_no"));
				sb.setS_name(rs.getString("s_name"));
				sb.setS_birth(String.valueOf(rs.getDate("s_birth")));
				sb.setGender(rs.getString("gender"));
				sb.setEntran(String.valueOf(rs.getDate("entran")));
				sb.setAddr1(rs.getString("addr1"));
				sb.setAddr2(rs.getString("addr2"));
				sb.setAddr3(rs.getString("addr3"));
				sb.setC_no(rs.getInt("c_no"));
				sb.setC_age(rs.getInt("c_age"));
				sb.setNote(rs.getString("note"));
				sb.setAfter(rs.getString("after"));
				sb.setImgname(rs.getString("imgname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb;
	}
	
	// 유아 정보 수정
	public int updateStudent(MultipartRequest mr, String img, int c_age) {
		int cnt = -1;
		String sql = "update student set imgname=?, c_no=?, c_age=?, after=?, addr1=?, addr2=?, addr3=?, note=? where s_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, img);
			ps.setInt(2, Integer.parseInt(mr.getParameter("c_no")));
			ps.setInt(3, c_age);
			ps.setString(4, mr.getParameter("after"));
			ps.setString(5, mr.getParameter("addr1"));
			ps.setString(6, mr.getParameter("addr2"));
			ps.setString(7, mr.getParameter("addr3"));
			ps.setString(8, mr.getParameter("note"));
			ps.setString(9, mr.getParameter("s_no"));
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("cnt : " + cnt);
		return cnt;
	}
	
	// 선택 학생 삭제
	public int deleteCheck(String[] s_no) {
		int cnt = 0;
		String sql = "delete student where s_no=? ";
		for(int i=1; i<s_no.length; i++) {
			sql += "or s_no=? ";
		}
		System.out.println("sql : " + sql);
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0; i<s_no.length; i++) {
				ps.setString(i+1, s_no[i]);
			}
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	// 학번부여
	public String insertSno(String entran) {
		String s_no = null;
		String sql = "select stunum(?, p_seq.nextval) as sno from dual";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, entran);
			rs = ps.executeQuery();
			if(rs.next()) {
				s_no = rs.getString("sno");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return s_no;
	}
	
	
	// 값 삽입
	public int insertStudent(MultipartRequest mr, int k_no, String s_no) {
		int cnt = -1;
		String c = mr.getParameter("c_no");
		String[] c2 = c.split(" ");
		
		System.out.println("c : " + c);
		System.out.println("c2 : " + c2[0] + ", " + c2[1]);
		
		String sql = "insert into student values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			ps.setString(2, s_no);
			ps.setString(3, mr.getParameter("s_name"));
			ps.setString(4, mr.getParameter("s_birth"));
			ps.setString(5, mr.getParameter("gender"));
			ps.setString(6, mr.getParameter("entran"));
			ps.setString(7, mr.getParameter("k_addr1"));
			ps.setString(8, mr.getParameter("k_addr2"));
			ps.setString(9, mr.getParameter("k_addr3"));
			ps.setString(10, c2[0]);
			ps.setString(11, c2[1]);
			ps.setString(12, mr.getParameter("note"));
			ps.setString(13, mr.getParameter("after"));
			ps.setString(14, mr.getFilesystemName("imgname"));
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//System.out.println("cnt : " + cnt);
		return cnt;
	}
}
