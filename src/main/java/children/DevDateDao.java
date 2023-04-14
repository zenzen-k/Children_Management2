package children;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DevDateDao {
	private static DevDateDao ddao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private DevDateDao() {
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
	public static DevDateDao getInstance() {
		if(ddao == null)
			ddao = new DevDateDao();
		return ddao;
	}
	
	// 날짜 불러오기
	public DevDateBean getAllDevdate(int k_no) {
		DevDateBean db = new DevDateBean();
		String sql = "select * from devdate where k_no=" + k_no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				db.setK_no(k_no);
				db.setSdate(String.valueOf(rs.getDate("sdate")));
				db.setEdate(String.valueOf(rs.getDate("edate")));
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
		return db;
	}
	
	// 날짜 추가
	public int insertDevdate(DevDateBean db) {
		int cnt = -1;
		String sql = "insert into devdate values(?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, db.getK_no());
			ps.setString(2, db.getSdate());
			ps.setString(3, db.getEdate());
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
		return cnt;
	}
	
	// 날짜 수정
	public int updateDevdate(DevDateBean db) {
		int cnt = -1;
		String sql = "update devdate set sdate=?, edate=? where k_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, db.getSdate());
			ps.setString(2, db.getEdate());
			ps.setInt(3, db.getK_no());
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
		return cnt;
	}
	
	// 날짜데이터가 있는지 확인하기
	public boolean searchDevdate(int k_no) {
		boolean result = false;
		String sql = "select * from devdate where k_no=" + k_no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
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
		return result;
	}
}
