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
		DevDateBean db = null;
		String sql = "select * from devdate where k_no=" + k_no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				db = new DevDateBean();
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
	
	// 날짜데이터가 있는지 확인후 있으면 update, 없으면 insert
	public int searchDevdateInUp(DevDateBean deb) {
		int cnt = -1;
		String sql = "select * from devdate where k_no=" + deb.getK_no();
		String sqlUp = "update devdate set sdate=? , edate=? where k_no=?";
		String sqlIn = "insert into devdate values(?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) { // update
				ps = conn.prepareStatement(sqlUp);
				ps.setString(1, deb.getSdate());
				ps.setString(2, deb.getEdate());
				ps.setInt(3, deb.getK_no());
				cnt = ps.executeUpdate();
			}else { //insert
				ps = conn.prepareStatement(sqlIn);
				ps.setInt(1, deb.getK_no());
				ps.setString(2, deb.getSdate());
				ps.setString(3, deb.getEdate());
				cnt = ps.executeUpdate();
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
		return cnt;
	}
}
