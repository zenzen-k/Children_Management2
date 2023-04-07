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
			ps.setString(1, "'%" + userKinder + "%'");
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
	public int getKinderByKname(String k_name) {
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
	
	// 유치원 정보 불러오기
	public KindergartenBean getKinderByKno(int k_no) {
		KindergartenBean kb = null;
		String sql = "select * from kindergarten where k_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				kb = new KindergartenBean();
				kb.setK_no(k_no);
				kb.setK_name(rs.getString("k_name"));
				kb.setK_addr1(rs.getString("k_addr1"));
				kb.setK_addr2(rs.getString("k_addr2"));
				kb.setK_addr3(rs.getString("k_addr3"));
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
		return kb;
	}
	
	//유치원 학급별 인원수
	public ArrayList<KindergartenBean> getCountByK(int skno) {
		ArrayList<KindergartenBean> kList = new ArrayList<KindergartenBean>();
		String sql = "select c_age, count(s_name) as cnt from "
				+ "(select c.c_age, s_name from "
				+ "(select c_age from classroom where k_no=? and c_age>0 group by c_age) c "
				+ "left outer join "
				+ "(select c_age, s_name from student where k_no=?) s "
				+ "on c.c_age = s.c_age) "
				+ "group by c_age order by c_age";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, skno);
			ps.setInt(2, skno);
			rs = ps.executeQuery();
			while(rs.next()) {
				KindergartenBean kb = new KindergartenBean();
				int cnt = rs.getInt("cnt");
				String c_age = rs.getString("c_age");
				
				kb.setK_no(cnt);
				kb.setK_name(c_age);
				
				kList.add(kb);
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
		return kList;
	}
	
	// 모든 유치원 조회하기
	public ArrayList<KindergartenBean> getAllKinder() {
		ArrayList<KindergartenBean> klist = new ArrayList<KindergartenBean>();
		String sql = "select * from kindergarten";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				KindergartenBean kb = new KindergartenBean();
				kb.setK_no(rs.getInt("k_no"));
				kb.setK_name(rs.getString("k_name"));
				kb.setK_addr1(rs.getString("k_addr1"));
				kb.setK_addr2(rs.getString("k_addr2"));
				kb.setK_addr3(rs.getString("k_addr3"));
				
				klist.add(kb);
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
		return klist;
	}
	
	//
}
