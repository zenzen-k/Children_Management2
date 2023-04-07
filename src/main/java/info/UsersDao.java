package info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UsersDao {
	private static UsersDao udao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private UsersDao() {
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
	public static UsersDao getInstance() {
		if(udao == null)
			udao = new UsersDao();
		return udao;
	}
	
	// 회원가입 기능
	public int insertUsers(UsersBean ub) {
		int cnt = -1;
		String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ub.getId());
			ps.setString(2, ub.getPw());
			ps.setInt(3, ub.getC_no());
			ps.setInt(4, ub.getK_no());
			ps.setInt(5, ub.getE_no());
			ps.setString(6, ub.getU_name());
			ps.setString(7, ub.getU_hp1());
			ps.setString(8, ub.getU_hp2());
			ps.setString(9, ub.getU_hp3());
			ps.setString(10, ub.getU_rrn1());
			ps.setString(11, ub.getU_rrn2());
			ps.setString(12, ub.getEmail());
			ps.setString(13, ub.getApproval());
			ps.setString(14, ub.getTerms());
			
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
	
	// 아이디 검사
	public boolean searchId(String id) {
		boolean result = false;
		String sql = "select id from users where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
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
		return result;
	}
	
	// 회원정보 가져오기
	public UsersBean getUserInfo(String id) {
		UsersBean ub = null;
		String sql = "select * from users where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				ub = new UsersBean();
				ub.setId(rs.getString("id"));
				ub.setPw(rs.getString("pw"));
				ub.setC_no(rs.getInt("c_no"));
				ub.setK_no(rs.getInt("k_no"));
				ub.setE_no(rs.getInt("e_no"));
				ub.setU_name(rs.getString("u_name"));
				ub.setU_hp1(rs.getString("u_hp1"));
				ub.setU_hp2(rs.getString("u_hp2"));
				ub.setU_hp3(rs.getString("u_hp3"));
				ub.setU_rrn1(rs.getString("u_rrn1"));
				ub.setU_rrn2(rs.getString("u_rrn2"));
				ub.setEmail(rs.getString("email"));
				ub.setApproval(rs.getString("approval"));
				ub.setTerms(rs.getString("terms"));
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
		return ub;
	}
	
	// 로그인
		public UsersBean getUserLogin(String id, String pw) {
			UsersBean ub = null;
			String sql = "select * from users where id=? and pw=?";
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pw);
				rs = ps.executeQuery();
				if(rs.next()) {
					ub = new UsersBean();
					ub.setId(rs.getString("id"));
					ub.setPw(rs.getString("pw"));
					ub.setC_no(rs.getInt("c_no"));
					ub.setK_no(rs.getInt("k_no"));
					ub.setE_no(rs.getInt("e_no"));
					ub.setU_name(rs.getString("u_name"));
					ub.setU_hp1(rs.getString("u_hp1"));
					ub.setU_hp2(rs.getString("u_hp2"));
					ub.setU_hp3(rs.getString("u_hp3"));
					ub.setU_rrn1(rs.getString("u_rrn1"));
					ub.setU_rrn2(rs.getString("u_rrn2"));
					ub.setEmail(rs.getString("email"));
					ub.setApproval(rs.getString("approval"));
					ub.setTerms(rs.getString("terms"));
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
			return ub;
		}
	
	//id찾기
	public String getSearchId(String u_name, String email) {
		String id = null;
		String sql = "select id from users where u_name=? and email=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, u_name);
			ps.setString(2, email);
			rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
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
		return id;
	}
	
	//pw찾기
	public String getSearchPw(String id, String u_name, String email) {
		String pw = null;
		String sql = "select pw from users where id=? and u_name=? and email=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, u_name);
			ps.setString(3, email);
			rs = ps.executeQuery();
			if(rs.next()) {
				pw = rs.getString("pw");
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
		return pw;
	}
	
	//정보수정
	public int updateUser(UsersBean ub) {
		int cnt = -1;
		String sql = "update users set email=?, u_hp1=?, u_hp2=?, u_hp3=? where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ub.getEmail());
			ps.setString(2, ub.getU_hp1());
			ps.setString(3, ub.getU_hp2());
			ps.setString(4, ub.getU_hp3());
			ps.setString(5, ub.getId());
			
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
	
	//비밀번호 수정
	public int updatePw(String id, String pw, String newpw) {
		int cnt = -1;
		String sql = "select pw from users where id = ?";
		String sql2 = "update users set pw=? where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					ps = conn.prepareStatement(sql2);
					ps.setString(1, newpw);
					ps.setString(2, id);
					cnt = ps.executeUpdate();
				}else {
					cnt = -2;
				}
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
	
	//담당교사별이름,직급 구하기
	public ArrayList<UsersBean> getUnameByCno(int cno) {
		ArrayList<UsersBean> ulist = new ArrayList<UsersBean>();
		String sql = "select u_name, e_name from emp natural join (select u_name, e_no, k_no from users where c_no = ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cno);
			rs = ps.executeQuery();
			while(rs.next()) {
				UsersBean ub = new UsersBean();
				ub.setU_name(rs.getString("u_name"));
				ub.setId(rs.getString("e_name"));
				ulist.add(ub);
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
		return ulist;
	}
	
	// 유치원 전체 교사 조회 (원장 제외)
	public ArrayList<UsersBean> getAllUser(int skno){
		ArrayList<UsersBean> ulist = new ArrayList<UsersBean>();
		String sql = "select * from users where e_no > 505 and k_no=" + skno;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				UsersBean ub = new UsersBean();
				ub.setId(rs.getString("id"));
				ub.setPw(rs.getString("pw"));
				ub.setC_no(rs.getInt("c_no"));
				ub.setK_no(rs.getInt("k_no"));
				ub.setE_no(rs.getInt("e_no"));
				ub.setU_name(rs.getString("u_name"));
				ub.setU_hp1(rs.getString("u_hp1"));
				ub.setU_hp2(rs.getString("u_hp2"));
				ub.setU_hp3(rs.getString("u_hp3"));
				ub.setU_rrn1(rs.getString("u_rrn1"));
				ub.setU_rrn2(rs.getString("u_rrn2"));
				ub.setEmail(rs.getString("email"));
				ub.setApproval(rs.getString("approval"));
				ub.setTerms(rs.getString("terms"));
				ulist.add(ub);
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
		return ulist;
	}
	
	// 교사 직급, 교실 , 이름 조회
	public ArrayList<JoinBean> getAllTeachers(int k_no){
		ArrayList<JoinBean> jlist = new ArrayList<JoinBean>();
		String sql = "select u_name, id, c_no, c_name, c_age, e_name, e_no from "
				+ "(select u_name, id, c_no, c_name, c_age, e_no from "
				+ "(select * from users where k_no = ?) natural join classroom) "
				+ "natural join emp e order by e_no";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, k_no);
			rs = ps.executeQuery();
			while(rs.next()) {
				JoinBean jb = new JoinBean();
				jb.setU_name(rs.getString("u_name"));
				jb.setC_name(rs.getString("c_name"));
				jb.setE_name(rs.getString("e_name"));
				jb.setId(rs.getString("id"));
				jb.setC_no(rs.getInt("c_no"));
				jb.setE_no(rs.getInt("e_no"));
				jb.setC_age(rs.getInt("c_age"));
				
				jlist.add(jb);
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
		System.out.println(jlist.get(0).getC_no());
		return jlist;
	}
	
	// 교사 직급, 등 수정
	public int updateUsersT(String id, String c_no, String e_no) {
		int cnt = -1;
		String sql = "update users set c_no=?, e_no=? where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, c_no);
			ps.setString(2, e_no);
			ps.setString(3, id);
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
	
	//미승인 교사 리스트 조회
	public ArrayList<UsersBean> getApprovalForUser(int k_no) {
		ArrayList<UsersBean> ulist = new ArrayList<UsersBean>();
		String sql = "select * from users where approval='N' and k_no=" + k_no;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				UsersBean ub = new UsersBean();
				ub.setId(rs.getString("id"));
				ub.setPw(rs.getString("pw"));
				ub.setC_no(rs.getInt("c_no"));
				ub.setK_no(rs.getInt("k_no"));
				ub.setE_no(rs.getInt("e_no"));
				ub.setU_name(rs.getString("u_name"));
				ub.setU_hp1(rs.getString("u_hp1"));
				ub.setU_hp2(rs.getString("u_hp2"));
				ub.setU_hp3(rs.getString("u_hp3"));
				ub.setU_rrn1(rs.getString("u_rrn1"));
				ub.setU_rrn2(rs.getString("u_rrn2"));
				ub.setEmail(rs.getString("email"));
				ub.setApproval(rs.getString("approval"));
				ub.setTerms(rs.getString("terms"));
				
				ulist.add(ub);
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
		return ulist;
	}
	
	// 가입승인 
	public int updateApproval(String[] id) {
		int cnt = 0;
		String sql = "update users set approval='Y' where id=?";
		for(int i=1; i<id.length; i++) {
			sql += "or id=? ";
		}
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0; i<id.length; i++) {
				ps.setString(i+1, id[i]);
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
}
