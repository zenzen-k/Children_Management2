package children;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class FamilyDao {
	private static FamilyDao fdao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private FamilyDao() {
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
	public static FamilyDao getInstance() {
		if(fdao == null)
			fdao = new FamilyDao();
		return fdao;
	}
	
	// 학생별 가족관계 불러오기
	public FamilyBean getFamilyBySno(String s_no) {
		FamilyBean fb = new FamilyBean();
		String sql = "select * from family where s_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				fb.setS_no(rs.getString("s_no"));
				fb.setF_relations(rs.getString("f_relations"));
				fb.setF_name(rs.getString("f_name"));
				fb.setF_birth(String.valueOf(rs.getDate("f_birth")));
				fb.setF_hp1(rs.getString("f_hp1"));
				fb.setF_hp2(rs.getString("f_hp2"));
				fb.setF_hp3(rs.getString("f_hp3"));
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
		return fb;
	}
	
	// 가족수정
	public int updateFamily(MultipartRequest mr) {
		int cnt = -1;
		String sql = "update family set f_relations=?, f_name=?, f_birth=?, f_hp1=?, f_hp2=?, f_hp3=? where s_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("f_relations"));
			ps.setString(2, mr.getParameter("f_name"));
			ps.setString(3, mr.getParameter("f_birth"));
			ps.setString(4, mr.getParameter("f_hp1"));
			ps.setString(5, mr.getParameter("f_hp2"));
			ps.setString(6, mr.getParameter("f_hp3"));
			ps.setString(7, mr.getParameter("s_no"));
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	//가족삽입
	public int insertFamily(MultipartRequest mr, String s_no) {
		int cnt = -1;
		String sql = "insert into family values(?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			ps.setString(2, mr.getParameter("f_relations"));
			ps.setString(3, mr.getParameter("f_name"));
			ps.setString(4, mr.getParameter("f_birth"));
			ps.setString(5, mr.getParameter("f_hp1"));
			ps.setString(6, mr.getParameter("f_hp2"));
			ps.setString(7, mr.getParameter("f_hp3"));
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
}
