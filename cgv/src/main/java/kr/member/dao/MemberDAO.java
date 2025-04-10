package kr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.member.vo.MemberVO;
import kr.util.DBUtil;

public class MemberDAO {
	
	private static final MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public void register(MemberVO member) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO MEMBER (MEMBER_ID , USER_ID, PASSWORD, NAME, BIRTHDATE, GENDER, PHONE, EMAIL, ADDRESS) "
					+ "VALUES(MEMBER_SEQ.NEXTVAL, ?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, member.getUser_id());
			pstmt.setString(++cnt, member.getPassword());
			pstmt.setString(++cnt, member.getName());
			pstmt.setString(++cnt, member.getBirthdate());
			pstmt.setString(++cnt, member.getGender());
			pstmt.setString(++cnt, member.getPhone());
			pstmt.setString(++cnt, member.getEmail());
			pstmt.setString(++cnt, member.getAddress());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
