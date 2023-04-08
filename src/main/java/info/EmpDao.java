package info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EmpDao {
	private static EmpDao edao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private EmpDao() {
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
	public static EmpDao getInstance() {
		if(edao == null)
			edao = new EmpDao();
		return edao;
	}
	
	//이름값
	public String getEnameByEnum(int e_no) {
		String ename = null;
		String sql = "select e_name from emp where e_no=" + e_no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				ename = rs.getString("e_name");
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
		return ename;
	}
	
	// 전체 직급 가져오기
	public ArrayList<EmpBean> getAllEmp() {
		ArrayList<EmpBean> elist = new ArrayList<EmpBean>();
		String sql = "select * from emp";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				EmpBean eb = new EmpBean();
				eb.setE_no(rs.getInt("e_no"));
				eb.setE_name(rs.getString("e_name"));
				elist.add(eb);
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
		return elist;
	}
	
	// 유치원 - 직급별 교사 수
	public ArrayList<EmpBean> getCountByEmp(int skno) {
		ArrayList<EmpBean> elist = new ArrayList<EmpBean>();
		String sql = "select e_name, cnt from "
				+ "(select e_no, count(u_name) as cnt from  "
				+ "(select e.e_no, u_name from "
				+ "(select e_no from emp group by e_no) e "
				+ "left outer join "
				+ "(select e_no, u_name from users where k_no=?) u "
				+ "on e.e_no = u.e_no) "
				+ "group by e_no order by e_no) "
				+ "natural join emp";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, skno);
			rs = ps.executeQuery();
			while(rs.next()) {
				EmpBean eb = new EmpBean();
				int cnt = rs.getInt("cnt");
				String ename = rs.getString("e_name");
				
				eb.setE_no(cnt);
				eb.setE_name(ename);
				
				elist.add(eb);
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
		return elist;
	}
	
}
