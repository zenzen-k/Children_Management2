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
		String sql = "select * from classroom where k_no=?";
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
}
