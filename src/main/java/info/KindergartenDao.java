package info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class KindergartenDao {
	private static KindergartenDao kdao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private KindergartenDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 객체생성
	public static KindergartenDao getInstance() {
		if(kdao == null)
			kdao = new KindergartenDao();
		return kdao;
	}
	
	// 유치원 이름찾기
	public boolean searchKinder(String userKinder) {
		boolean result = false;
		String sql = "select * from kindergarten where k_name = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userKinder);
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
		System.out.println("result : " + result);
		return result;
	}
	
	//유치원 등록
	public int insertKinder(KindergartenBean kb) {
		int cnt = -1;
		String sql = "insert into kindergarten values(k_seq.nextval, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, kb.getK_name());
			ps.setString(2, kb.getK_addr1());
			ps.setString(3, kb.getK_addr2());
			ps.setString(4, kb.getK_addr3());
			
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
	
	// 유치원번호 조회하기
	public int getKinderByKnum(String k_name) {
		int result = 0;
		String sql = "select k_no from kindergarten where k_name=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, k_name);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt("k_no");
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
}
