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

public class AttendManageDao {
	private static AttendManageDao adao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private AttendManageDao() {
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
	public static AttendManageDao getInstance() {
		if(adao == null)
			adao = new AttendManageDao();
		return adao;
	}
	
	//출석부조회 - 담임
	public ArrayList<chJoinBean> getAttendMng(int skno, int scno, String adate) {
		ArrayList<chJoinBean> alist = new ArrayList<chJoinBean>();
		String sql = "select s.s_no, s_name, attend, absence, earlier, adate from "
				+ "(select s_no, s_name from student where c_no=? and k_no=?) s "
				+ "left outer join (select * from ATTENDMANAGE where adate=? and k_no=?) a "
				+ "on a.s_no = s.s_no order by s_name";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, scno);
			ps.setInt(2, skno);
			ps.setString(3, adate);
			ps.setInt(4, skno);
			rs = ps.executeQuery();
			while(rs.next()) {
				chJoinBean jb = new chJoinBean();
				jb.setS_no(rs.getString("s_no"));
				jb.setS_name(rs.getString("s_name"));
				jb.setAttend(rs.getInt("attend"));
				jb.setAbsence(rs.getInt("absence"));
				jb.setEarlier(rs.getInt("earlier"));
				jb.setAdate(rs.getString("adate"));
				alist.add(jb);
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
		return alist;
	}
	
	//출석부조회 - 원장 
	public ArrayList<chJoinBean> getAttendMng(int skno, String adate) {
		ArrayList<chJoinBean> alist = new ArrayList<chJoinBean>();
		String sql = "select s.s_no, s_name, attend, absence, earlier, adate from "
				+ "(select s_no, s_name from student where k_no=?) s "
				+ "left outer join (select * from ATTENDMANAGE where adate=? and k_no=?) a "
				+ "on a.s_no = s.s_no order by s_name";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, skno);
			ps.setString(2, adate);
			ps.setInt(3, skno);
			rs = ps.executeQuery();
			while(rs.next()) {
				chJoinBean jb = new chJoinBean();
				jb.setS_no(rs.getString("s_no"));
				jb.setS_name(rs.getString("s_name"));
				jb.setAttend(rs.getInt("attend"));
				jb.setAbsence(rs.getInt("absence"));
				jb.setEarlier(rs.getInt("earlier"));
				jb.setAdate(rs.getString("adate"));
				alist.add(jb);
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
		return alist;
	}
	
	// 날짜 데이터가 있는지 조회함
	public boolean getOldDate(String s_no, String adate) {
		boolean result = false;
		String sql = "select * from attendManage where s_no=? and adate=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			ps.setString(2, adate);
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
	
	//데이터 수정
	public int updateAttend(AttendManageBean ab) {
		int cnt = -1;
		String sql = "update attendManage set attend=?, absence=?, earlier=? where s_no=? and adate=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ab.getAttend());
			ps.setInt(2, ab.getAbsence());
			ps.setInt(3, ab.getEarlier());
			ps.setString(4, ab.getS_no());
			ps.setString(5, ab.getAdate());
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
	
	//데이터 삽입
	public int insertAttend(AttendManageBean ab) {
		int cnt = -1;
		String sql = "insert into attendManage values(?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ab.getK_no());
			ps.setString(2, ab.getS_no());
			ps.setInt(3, ab.getAttend());
			ps.setInt(4, ab.getAbsence());
			ps.setInt(5, ab.getEarlier());
			ps.setString(6, ab.getAdate());
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
	
	// 개인 출석 조회
	public ArrayList<AttendManageBean> getAttendBySno(String selectSno, String startdate, String enddate) {
		ArrayList<AttendManageBean> alist = new ArrayList<AttendManageBean>();
		String sql = "select * from attendManage where s_no=? and (adate between ? and ?) order by adate desc";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, selectSno);
			ps.setString(2, startdate);
			ps.setString(3, enddate);
			rs = ps.executeQuery();
			while(rs.next()) {
				AttendManageBean ab = new AttendManageBean();
				ab.setK_no(rs.getInt("k_no"));
				ab.setS_no(rs.getString("s_no"));
				ab.setAttend(rs.getInt("attend"));
				ab.setAbsence(rs.getInt("absence"));
				ab.setEarlier(rs.getInt("earlier"));
				ab.setAdate(String.valueOf(rs.getDate("adate")));
				alist.add(ab);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return alist;
	}
}
