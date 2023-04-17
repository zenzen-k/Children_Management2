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

public class DevelopmentalDao {
	private static DevelopmentalDao ddao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private DevelopmentalDao() {
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
	public static DevelopmentalDao getInstance() {
		if(ddao == null)
			ddao = new DevelopmentalDao();
		return ddao;
	}
	
	//전체데이터
	public ArrayList<DevJoin> getAllDevleop(){
		ArrayList<DevJoin> dlist = new ArrayList<DevJoin>();
		String sql = "select s_no, s_name, d_no, c_age, semester, writer, writerid, approve "
				+ "from developmental natural join STUDENT";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				DevJoin dj = new DevJoin();
				dj.setS_no(rs.getString("s_no"));
				dj.setS_name(rs.getString("s_name"));
				dj.setD_no(rs.getInt("d_no"));
				dj.setD_no(rs.getInt("c_age"));
				dj.setD_no(rs.getInt("semester"));
				dj.setS_name(rs.getString("writer"));
				dj.setS_name(rs.getString("writerid"));
				dj.setS_name(rs.getString("approve"));
				dlist.add(dj);
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
		return dlist;
	}
	//반별데이터
	public ArrayList<DevJoin> getDevleopByCno(int c_no){
		ArrayList<DevJoin> dlist = new ArrayList<DevJoin>();
		String sql = "select s_no, s_name, d_no, c_age, semester, writer, writerid, approve  "
				+ "from developmental natural join  "
				+ "(select * from STUDENT where c_no=?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, c_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				DevJoin dj = new DevJoin();
				dj.setS_no(rs.getString("s_no"));
				dj.setS_name(rs.getString("s_name"));
				dj.setD_no(rs.getInt("d_no"));
				dj.setD_no(rs.getInt("c_age"));
				dj.setD_no(rs.getInt("semester"));
				dj.setS_name(rs.getString("writer"));
				dj.setS_name(rs.getString("writerid"));
				dj.setS_name(rs.getString("approve"));
				dlist.add(dj);
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
		return dlist;
	}
	
	// 학생별 승인완료 학기 데이터
	public ArrayList<DevJoin> getDevStuByApprove(String s_no, int c_age, int semester) {
		ArrayList<DevJoin> djlist = new ArrayList<DevJoin>();
		String sql = "select s_no, sd.d_no, c_age, semester, writer, writerid, approve, scope, d_content from "
				+ "(select * from DEVELOPMENTAL where s_no = ? and c_age=? and semester=? and approve='승인완료') sd "
				+ "left outer join DEVCONTENT dc "
				+ "on sd.d_no = dc.d_no "
				+ "order by c_age, semester";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			ps.setInt(2, c_age);
			ps.setInt(3, semester);
			rs = ps.executeQuery();
			while(rs.next()) {
				DevJoin dj = new DevJoin();
				dj.setS_no(s_no);
				dj.setD_no(rs.getInt("d_no"));
				dj.setC_age(rs.getInt("c_age"));
				dj.setSemester(rs.getInt("semester"));
				dj.setWriter(rs.getString("writer"));
				dj.setWriterid(rs.getString("writerid"));
				dj.setApprove(rs.getString("approve"));
				dj.setScope(rs.getString("scope"));
				dj.setD_content(rs.getString("d_content"));
				djlist.add(dj);
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
		return djlist;
	}
	
	public ArrayList<DevJoin> getDevStu(String s_no, int c_age, int semester) {
		ArrayList<DevJoin> djlist = new ArrayList<DevJoin>();
		String sql = "select s_no, sd.d_no, c_age, semester, writer, writerid, approve, scope, d_content from "
				+ "(select * from DEVELOPMENTAL where s_no = ? and c_age=? and semester=?) sd "
				+ "left outer join DEVCONTENT dc "
				+ "on sd.d_no = dc.d_no "
				+ "order by c_age, semester";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			ps.setInt(2, c_age);
			ps.setInt(3, semester);
			rs = ps.executeQuery();
			while(rs.next()) {
				DevJoin dj = new DevJoin();
				dj.setS_no(s_no);
				dj.setD_no(rs.getInt("d_no"));
				dj.setC_age(rs.getInt("c_age"));
				dj.setSemester(rs.getInt("semester"));
				dj.setWriter(rs.getString("writer"));
				dj.setWriterid(rs.getString("writerid"));
				dj.setApprove(rs.getString("approve"));
				dj.setScope(rs.getString("scope"));
				dj.setD_content(rs.getString("d_content"));
				djlist.add(dj);
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
		return djlist;
	}
	
	//학생별 게시글 수
	public int countDevByStu(String s_no) {
		int count = 0;
		String sql="select count(d_no) cnt from DEVELOPMENTAL where s_no=? and approve='승인완료'";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
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
	
	// 학생데이터
	public ArrayList<DevelopmentalBean> getDevSemester(String s_no) {
		ArrayList<DevelopmentalBean> dlist = new ArrayList<DevelopmentalBean>();
		String sql = "select * from DEVELOPMENTAL where s_no = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				DevelopmentalBean db = new DevelopmentalBean();
				db.setS_no(s_no);
				db.setD_no(rs.getInt("d_no"));
				db.setC_age(rs.getInt("c_age"));
				db.setSemester(rs.getInt("semester"));
				db.setWriter(rs.getString("writer"));
				db.setWriterid(rs.getString("writerid"));
				db.setApprove(rs.getString("approve"));
				
				dlist.add(db);
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
		return dlist;
	}
	
	// 교사 작성 평가글 조회
	public ArrayList<DevelopmentalBean> getDevByUser(String id){
		ArrayList<DevelopmentalBean> dlist = new ArrayList<DevelopmentalBean>();
		String sql = "select * from developmental where writerid='"+id+"' and approve<>'승인완료' order by d_no desc";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				DevelopmentalBean db = new DevelopmentalBean();
				db.setS_no(rs.getString("s_no"));
				db.setD_no(rs.getInt("d_no"));
				db.setC_age(rs.getInt("c_age"));
				db.setSemester(rs.getInt("semester"));
				db.setWriter(rs.getString("writer"));
				db.setWriterid(rs.getString("writerid"));
				db.setApprove(rs.getString("approve"));
				dlist.add(db);
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
		return dlist;
	}
	
	// 값 삽입하기
	public int insertDev(DevelopmentalBean db) {
		int cnt = -1;
		String sql = "insert into developmental values(?, d_seq.nextval, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, db.getS_no());
			ps.setInt(2, db.getC_age());
			ps.setInt(3, db.getSemester());
			ps.setString(4, db.getWriter());
			ps.setString(5, db.getWriterid());
			ps.setString(6, db.getApprove());
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
	public int getDno(DevelopmentalBean db) {
		int dno = 0;
		String sql = "select d_no from developmental where s_no=? and c_age=? and semester=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, db.getS_no());
			ps.setInt(2, db.getC_age());
			ps.setInt(3, db.getSemester());
			rs = ps.executeQuery();
			if(rs.next()) {
				dno = rs.getInt("d_no");
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
		return dno;
	}
	
	//
	public DevelopmentalBean getDevByDno(String d_no) {
		DevelopmentalBean db = new DevelopmentalBean();
		String sql = "select * from developmental where d_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, d_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				db.setS_no(rs.getString("s_no"));
				db.setD_no(rs.getInt("d_no"));
				db.setC_age(rs.getInt("c_age"));
				db.setSemester(rs.getInt("semester"));
				db.setWriter(rs.getString("writer"));
				db.setWriterid(rs.getString("writerid"));
				db.setApprove(rs.getString("approve"));
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
	
	// 승인내역변경
	public int updateDev(String d_no, String approve) {
		int cnt = -1;
		String sql = "update developmental set approve =? where d_no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, approve);
			ps.setString(2, d_no);
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
	
	//승인내역 조회
	public ArrayList<DevJoin> getDevByApprove(int k_no) {
		ArrayList<DevJoin> dlist = new ArrayList<DevJoin>();
		String sql = "select s_no, s_name, d_no, c_age, semester, writer, writerid, c_name, approve "
				+ "from "
				+ "(select s_no, d_no, c_age, semester, writer, writerid, c_name, approve "
				+ "from "
				+ "(select s_no, d_no, c_age, semester, writer, writerid, c_no, approve "
				+ "from "
				+ "(select * from developmental where approve='승인대기' ) d "
				+ "inner join "
				+ "(select * from users where k_no=?) s "
				+ "on s.id = d.writerid) "
				+ "natural join "
				+ "(select * from classroom where k_no=?)) "
				+ "natural join student";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			ps.setInt(2, k_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				DevJoin dj = new DevJoin();
				dj.setS_no(rs.getString("s_no"));
				dj.setS_name(rs.getString("s_name"));
				dj.setD_no(rs.getInt("d_no"));
				dj.setC_age(rs.getInt("c_age"));
				dj.setSemester(rs.getInt("semester"));
				dj.setWriter(rs.getString("writer"));
				dj.setWriterid(rs.getString("writerid"));
				dj.setC_name(rs.getString("c_name"));
				dj.setApprove(rs.getString("approve"));
				dlist.add(dj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dlist;
	}
}
