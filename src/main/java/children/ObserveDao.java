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

public class ObserveDao {
	private static ObserveDao odao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private ObserveDao() {
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
	public static ObserveDao getInstance() {
		if(odao == null)
			odao = new ObserveDao();
		return odao;
	}
	
	//학생별 일지 개수
	public int getCountBySno(String s_no) {
		int count = 0;
		String sql = "select count(*) cnt from observe where s_no=" + s_no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
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
		return count;
	}
	
	//오늘작성여부
	public String getToWrite(String odate, String s_no) {
		String result="미작성";
		String sql = "select * from observe where odate=? and s_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, odate);
			ps.setString(2, s_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = "작성";
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
	
	//학생별 글 가져오기
	public ArrayList<ObserveBean> getAllObserveBySno(String s_no) {
		ArrayList<ObserveBean> olist = new ArrayList<ObserveBean>();
		String sql = "select * from observe where s_no=? order by odate desc, o_no desc";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				ObserveBean ob = new ObserveBean();
				ob.setS_no(s_no);
				ob.setO_no(rs.getInt("o_no"));
				ob.setC_no(rs.getInt("c_no"));
				ob.setOdate(String.valueOf(rs.getDate("odate")));
				ob.setWriter(rs.getString("writer"));
				ob.setWriterid(rs.getString("writerid"));
				ob.setO_title(rs.getString("o_title"));
				ob.setO_content(rs.getString("o_content"));
				olist.add(ob);
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
		return olist;
	}
	
	//게시글등록하기
	public int insertObserve(ObserveBean ob) {
		int cnt = -1;
		String sql = "insert into observe values(?, o_seq.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ob.getS_no());
			ps.setInt(2, ob.getC_no());
			ps.setString(3, ob.getOdate());
			ps.setString(4, ob.getWriter());
			ps.setString(5, ob.getWriterid());
			ps.setString(6, ob.getO_title());
			ps.setString(7, ob.getO_content());
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
