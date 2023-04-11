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

public class PhysicalDevDao {
	private static PhysicalDevDao pdao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private PhysicalDevDao() {
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
	public static PhysicalDevDao getInstance() {
		if(pdao == null)
			pdao = new PhysicalDevDao();
		return pdao;
	}
	
	//학생생성 정보 삽입
	public int insertPhysicalDev(String s_no){
		int cnt = 0;
		String[] age = {"만 3세 1학기","만 3세 2학기","만 4세 1학기","만 4세 2학기","만 5세 1학기","만 5세 2학기"};
		
		String sql = "insert into physicalDev values(?, ?, ?, ?, ?)";
		try {
			for(int i =0 ; i<age.length; i++) {
				ps = conn.prepareStatement(sql);
				ps.setString(1, s_no);
				ps.setString(2, age[i]);
				ps.setString(3, " ");
				ps.setDouble(4, 0.0);
				ps.setDouble(5, 0.0);
				cnt += ps.executeUpdate();
			}
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
	
	// 정보조회
	public ArrayList<PhysicalDevBean> getPhysical(String s_no) {
		ArrayList<PhysicalDevBean> plist = new ArrayList<PhysicalDevBean>();
		String sql = "select * from physicalDev where s_no = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				PhysicalDevBean pb = new PhysicalDevBean();
				pb.setS_no(s_no);
				pb.setP_age(rs.getString("p_age"));
				pb.setPdate(rs.getString("pdate"));
				pb.setWeight(rs.getDouble("weight"));
				pb.setHeight(rs.getDouble("height"));
				plist.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return plist;
	}
}
