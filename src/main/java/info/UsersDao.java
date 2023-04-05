package info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UsersDao {
	private static UsersDao udao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private UsersDao() {
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
	public static UsersDao getInstance() {
		if(udao == null)
			udao = new UsersDao();
		return udao;
	}
	
	// 회원가입 기능
	public int insertUsers(UsersBean ub) {
		int cnt = -1;
		String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ub.getId());
			ps.setString(2, ub.getPw());
			ps.setInt(3, ub.getC_no());
			ps.setInt(4, ub.getK_no());
			ps.setInt(5, ub.getE_no());
			ps.setString(6, ub.getU_name());
			ps.setInt(7, ub.getU_hp1());
			ps.setInt(8, ub.getU_hp2());
			ps.setInt(9, ub.getU_hp3());
			ps.setInt(10, ub.getU_rrn1());
			ps.setInt(11, ub.getU_rrn2());
			ps.setString(12, ub.getEmail());
			ps.setString(13, ub.getApproval());
			ps.setString(14, ub.getTerms());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 아이디 검사
	public boolean searchId(String id) {
		boolean result = false;
		String sql = "select id from users where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
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
		return result;
	}
	
	// 회원정보 가져오기
	public UsersBean getUserInfo(String id, String pw) {
		UsersBean ub = null;
		String sql = "select * from users where id=? and pw=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if(rs.next()) {
				ub = new UsersBean();
				ub.setId(rs.getString("id"));
				ub.setPw(rs.getString("pw"));
				ub.setC_no(rs.getInt("c_no"));
				ub.setK_no(rs.getInt("k_no"));
				ub.setE_no(rs.getInt("e_no"));
				ub.setU_name(rs.getString("u_name"));
				ub.setU_hp1(rs.getInt("u_hp1"));
				ub.setU_hp2(rs.getInt("u_hp2"));
				ub.setU_hp3(rs.getInt("u_hp3"));
				ub.setU_rrn1(rs.getInt("u_rrn1"));
				ub.setU_rrn2(rs.getInt("u_rrn2"));
				ub.setEmail(rs.getString("email"));
				ub.setApproval(rs.getString("approval"));
				ub.setTerms(rs.getString("terms"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ub;
	}
}
