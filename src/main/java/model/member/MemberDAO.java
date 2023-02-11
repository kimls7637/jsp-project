package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.common.JDBCUtil;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;

	final String INSERT="INSERT INTO MEMBER VALUES(?,?,?,?)";
	final String UPDATE="UPDATE MEMBER SET PW=?, NAME=?, PHONE=? WHERE ID=?";
	final String UPDATE_PW="UPDATE MEMBER SET PW=? WHERE ID=?";
	final String UPDATE_NOPW="UPDATE MEMBER SET NAME=?, PHONE=? WHERE ID=?";
	final String DELETE="DELETE FROM MEMBER WHERE ID=? AND PW=?";
	final String SELECTONE="SELECT * FROM MEMBER WHERE ID=? AND PW=?";
	final String SELECTONE_CHK="SELECT ID FROM MEMBER WHERE ID=? "; // ID만!
	// 총회원수 ----->>>> 목록이 아니라 COUNT로 나오게!!
	final String SELECTONE_ALL="SELECT COUNT(ID) AS IDCNT FROM MEMBER";
	// id찾기(인증번호 확인) - phone 받고 id반환(세팅)
	final String SELECTONE_ID="SELECT ID FROM MEMBER WHERE PHONE=?";
	// pw찾기(인증번호 확인) - phone,id 받고 pw반환(세팅)
	final String SELECTONE_PW="SELECT ID,PW FROM MEMBER WHERE PHONE=? AND ID=?";
	// 인증번호 폰번호 존재확인여부
	final String SELECTONE_PHONECHK="SELECT PHONE FROM MEMBER WHERE PHONE=?";


	public boolean insert(MemberVO mvo) { // 회원가입
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(INSERT);
			pstmt.setString(1, mvo.getId()); // id 세팅
			pstmt.setString(2, mvo.getPw()); // pw 세팅
			pstmt.setString(3, mvo.getName()); // 이름 세팅 
			pstmt.setString(4, mvo.getPhone()); // 폰 번호 세팅 
			int res=pstmt.executeUpdate();
			if(res<=0) {
				return false;
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(conn, pstmt);
		return true;
	}

	public boolean update(MemberVO mvo) { // 회원정보변경
		conn=JDBCUtil.connect();
		if(mvo.getPw()=="") {
			try {
				pstmt=conn.prepareStatement(UPDATE_NOPW);
				pstmt.setString(1, mvo.getName()); // 변경한 이름 세팅 
				pstmt.setString(2, mvo.getPhone()); // 변경한 폰 번호 세팅 
				pstmt.setString(3, mvo.getId()); // PK
				int res=pstmt.executeUpdate();
				if(res<=0) {
					return false;
				}
			} catch(SQLException e) {
				e.printStackTrace();
				return false;
			}

		}
		else if(mvo.getPhone()==null) {
			try {
				pstmt=conn.prepareStatement(UPDATE_PW);
				pstmt.setString(1, mvo.getPw()); // 변경한 pw 세팅
				pstmt.setString(2, mvo.getId()); // PK
				int res=pstmt.executeUpdate();
				if(res<=0) {
					return false;
				}
			} catch(SQLException e) {
				e.printStackTrace();
				return false;
			}
		}else {
			try {
				pstmt=conn.prepareStatement(UPDATE);
				pstmt.setString(1, mvo.getPw()); // 변경한 pw 세팅
				pstmt.setString(2, mvo.getName()); // 변경한 이름 세팅 
				pstmt.setString(3, mvo.getPhone()); // 변경한 폰 번호 세팅 
				pstmt.setString(4, mvo.getId()); // PK
				int res=pstmt.executeUpdate();
				if(res<=0) {
					return false;
				}
			} catch(SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		JDBCUtil.disconnect(conn, pstmt);
		return true;
	}

	public boolean delete(MemberVO mvo) { // 회원탈퇴
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(DELETE);
			pstmt.setString(1, mvo.getId()); // PK인 id 세팅
			pstmt.setString(2, mvo.getPw()); // pw 세팅
			int res=pstmt.executeUpdate(); // 삭제실행
			if(res<=0) {
				return false;
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(conn, pstmt);
		return true;
	}

	public MemberVO selectOne(MemberVO mvo) { // 로그인 & 중복검사
		MemberVO data=null; 
		// 아래 return에서 data가 if를 안 거칠수도있으니까 초기화가 필요하다
		conn=JDBCUtil.connect();
		try {
			if(mvo.getPw()==null) { // ID만 있는것 - 중복검사
				pstmt=conn.prepareStatement(SELECTONE_CHK);
				pstmt.setString(1, mvo.getId()); 
				// 쿼리문 실행후 rs값이 있다면 id가 존재하는것- ID세팅해서 보내줌 (존재하는 ID)
				// 만약에 rs값이 없다면 존재하지않는 id == 세팅해줄 ID 없음 == 중복이 아님
			}
			else {
				pstmt=conn.prepareStatement(SELECTONE);
				pstmt.setString(1, mvo.getId());
				pstmt.setString(2, mvo.getPw());
			}
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { // 데이터 하나만 반환 - if
				// 다음에 필요할값들 세팅해서 넘겨주면된다
				data=new MemberVO();
				data.setId(rs.getString("ID"));
				// data.setPw(rs.getString("PW")); // 뷰에서 필요하지않을것같아서!!
				data.setName(rs.getString("NAME"));
				data.setPhone(rs.getString("PHONE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	// 관리자가 보는거: 총 회원수
	public MemberVO selectOneAll(MemberVO mvo) { 
		MemberVO data=null; 
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SELECTONE_ALL);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { 
				data=new MemberVO();
				data.setIdCnt(rs.getInt("IDCNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	// id찾기(인증번호 확인) - phone 받고 id반환(세팅)
	public MemberVO selectOneId(MemberVO mvo) {
		MemberVO data=null; 
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SELECTONE_ID);
			pstmt.setString(1,mvo.getPhone()); 
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { 
				data=new MemberVO();
				data.setPhone(mvo.getPhone());
				data.setId(rs.getString("ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	// pw찾기(인증번호 확인) - phone,id 받고 pw반환(세팅)
	public MemberVO selectOnePw(MemberVO mvo) {
		MemberVO data=null; 
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SELECTONE_PW);
			pstmt.setString(1,mvo.getPhone()); 
			pstmt.setString(2, mvo.getId());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { 
				data=new MemberVO();
				data.setId(rs.getString("ID"));
				data.setPw(rs.getString("PW"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}
	// 인증번호 폰번호 존재확인여부
	public MemberVO selectOnePhoneChk(MemberVO mvo) {
		MemberVO data=null; 
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SELECTONE_PHONECHK);
			pstmt.setString(1, mvo.getPhone());
			ResultSet rs=pstmt.executeQuery(); // rs가 있다면 존재하는 폰번호, 없다면 존재하지않는 폰번호
			if(rs.next()) { 
				data=new MemberVO();
				data.setPhone(rs.getString("PHONE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}
}