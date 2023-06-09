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

public class ClassroomDao {
	private static ClassroomDao cdao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private ClassroomDao() {
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
	public static ClassroomDao getInstance() {
		if(cdao == null)
			cdao = new ClassroomDao();
		return cdao;
	}
	
	//유치원별 전체 반 조회
	public ArrayList<ClassroomBean> getAllClassroom(int k_no){
		ArrayList<ClassroomBean> clist = new ArrayList<ClassroomBean>();
		String sql = "select * from classroom where k_no=? and c_age>0 order by c_age, c_name";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				ClassroomBean cb = new ClassroomBean();
				cb.setK_no(k_no);
				cb.setC_no(rs.getInt("c_no"));
				cb.setC_name(rs.getString("c_name"));
				cb.setC_age(rs.getInt("c_age"));
				
				clist.add(cb);
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
		return clist;
	}
	
	//개인 담당 반 조회
	public ClassroomBean getClassByCno(int c_no) {
		ClassroomBean cb = new ClassroomBean();
		String sql = "select * from classroom where c_no=" + c_no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cb.setK_no(rs.getInt("k_no"));
				cb.setC_no(rs.getInt("c_no"));
				cb.setC_name(rs.getString("c_name"));
				cb.setC_age(rs.getInt("c_age"));
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
		return cb;
	}
	
	// 교실등록하기
	public int insertCroom(ClassroomBean cb) {
		int cnt = -1;
		String sql = "insert into classroom values(?, c_seq.nextval, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cb.getK_no());
			ps.setString(2, cb.getC_name());
			ps.setInt(3, cb.getC_age());
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
	
	//교시ㅣㄹ삭제
	public int deleteCroom(int skno, String[] no) { // 2
		System.out.println("no.length : " + no.length);
		int cnt = 0;
		String sql = "delete classroom where k_no=? and (c_no=? ";
		for(int i=1; i<no.length; i++) {
			sql += "or c_no=? ";
		}
		sql += ")";
		System.out.println("sql : " + sql);
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, skno);
			int j=1;
			for(int i=0; i<no.length; i++) {
				ps.setString(++j, no[i]);
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
	
	//유치원생성시 0, 1자동생성하기
	public int insertKinderBasic(int k_no) {
		int cnt = 0;
		String sql = "insert into classroom values(?, 0, '총괄', 0)";
		String sql2 = "insert into classroom values(?, 1, '미정', 0)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			cnt += ps.executeUpdate();
			
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, k_no);
			cnt += ps.executeUpdate();
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
	
	public int updateCroom(ClassroomBean cb) {
		int cnt = -1;
		String sql = "update classroom set c_name=? , c_age=? where k_no=? and c_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cb.getC_name());
			ps.setInt(2, cb.getC_age());
			ps.setInt(3, cb.getK_no());
			ps.setInt(4, cb.getC_no());
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
