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

public class ScheduleDao {
	private static ScheduleDao scdao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private ScheduleDao() {
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
	public static ScheduleDao getInstance() {
		if(scdao == null)
			scdao = new ScheduleDao();
		return scdao;
	}
	
	//월별 일정가져오기
	public ArrayList<ScheduleBean> getAllSchedule(int k_no, int year, int month){
		ArrayList<ScheduleBean> slist = new ArrayList<ScheduleBean>();
		String sql = "select * from schedule where k_no=? and syear=? and smonth=? order by smonth, sdate, emonth, edate";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			ps.setInt(2, year);
			ps.setInt(3, month);
			rs = ps.executeQuery();
			while(rs.next()) {
				ScheduleBean sb = new ScheduleBean();
				sb.setK_no(rs.getInt("k_no"));
				sb.setSyear(rs.getInt("syear"));
				sb.setSmonth(rs.getInt("smonth"));
				sb.setSdate(rs.getInt("sdate"));
				sb.setEyear(rs.getInt("eyear"));
				sb.setEmonth(rs.getInt("emonth"));
				sb.setEdate(rs.getInt("edate"));
				sb.setS_title(rs.getString("s_title"));
				slist.add(sb);
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
		return slist;
	}
	
	// 월 개수
	public int monthCount(int k_no, int year, int month) {
		int count = 0;
		String sql = "select count(*) cnt from schedule where k_no=? and syear=? and smonth=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			ps.setInt(2, year);
			ps.setInt(3, month);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
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
		return count;
	}
	
	// 년 개수
	public int yearCount(int k_no, int year) {
		int count = 0;
		String sql = "select count(*) cnt from schedule where k_no=? and syear=? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			ps.setInt(2, year);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
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
		return count;
	}
	
	// 일정 등록하기
	public int insertSchedule(ScheduleBean sb) {
		int cnt = -1;
		String sql = "insert into schedule values(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sb.getK_no());
			ps.setInt(2, sb.getSyear());
			ps.setInt(3, sb.getSmonth());
			ps.setInt(4, sb.getSdate());
			ps.setInt(5, sb.getEyear());
			ps.setInt(6, sb.getEmonth());
			ps.setInt(7, sb.getEdate());
			ps.setString(8, sb.getS_title());
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
