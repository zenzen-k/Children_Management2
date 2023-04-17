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

public class DevContentDao {
	private static DevContentDao dcdao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private DevContentDao() {
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
	public static DevContentDao getInstance() {
		if(dcdao == null)
			dcdao = new DevContentDao();
		return dcdao;
	}
	
	//내용 삽입
	public int insertDev(DevContentBean dcb) {
		int cnt = -1;
		String sql = "insert into devContent values(?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dcb.getD_no());
			ps.setString(2, dcb.getScope());
			ps.setString(3, dcb.getD_content());
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
	
	// d_no 가져오기
	public ArrayList<DevContentBean> getDevByDno(String d_no) {
		ArrayList<DevContentBean> dclist = new ArrayList<DevContentBean>();
		String sql = "select * from devContent where d_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, d_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				DevContentBean dcb = new DevContentBean();
				dcb.setD_no(rs.getInt("d_no"));
				dcb.setScope(rs.getString("scope"));
				dcb.setD_content(rs.getString("d_content"));
				dclist.add(dcb);
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
		return dclist;
	}
	
	//dev 삭제
	public int delDev(String d_no) {
		int cnt = -1;
		String sql = "delete devContent where d_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, d_no);
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
}
