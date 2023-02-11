package model.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.common.JDBCUtil;

public class QnaDAO {
	Connection conn;
	PreparedStatement pstmt;

	final String INSERT="INSERT INTO QNA VALUES((SELECT NVL(MAX(QNUM),0)+1 FROM QNA),?,?,?,?,?)";
	final String UPDATE="UPDATE QNA SET QREPLY=? WHERE QNUM=?";
	final String DELETE="DELETE FROM QNA WHERE QNUM=?";
	final String DELETE_ALL="DELETE FROM QNA WHERE QID=?";
	// 큐앤에이 상세
	final String SELECTONE="SELECT QNUM,QTITLE,QID,RPAD(SUBSTR(QID,1,3),LENGTH(QID),'*') AS QSTARID,QCONTENT,QDATE,QREPLY FROM QNA WHERE QNUM=?";
	// 큐앤에이 목록
	final String SELECTALL="SELECT QNUM,QTITLE,QID,RPAD(SUBSTR(QID,1,3),LENGTH(QID),'*') AS QSTARID,QCONTENT,QDATE,QREPLY FROM QNA ORDER BY QNUM DESC";
	// 내 큐엔에이 보기
	final String SELECTALL_MY="SELECT QNUM,QTITLE,QID,RPAD(SUBSTR(QID,1,3),LENGTH(QID),'*') AS QSTARID,QCONTENT,QDATE,QREPLY FROM QNA WHERE QID=?";


	// 사용자 큐앤에이 추가
	public boolean insert(QnaVO qvo) { 
		conn=JDBCUtil.connect();
		// 주문날짜 생성
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		try {
			pstmt=conn.prepareStatement(INSERT);
			pstmt.setString(1, qvo.getqTitle()); // 큐앤에이 제목
			pstmt.setString(2, qvo.getqId()); // 작성자 id
			pstmt.setString(3, qvo.getqContent()); // 큐앤에이 내용
			pstmt.setString(4, date.format(today)); // 큐앤에이 작성날짜
			pstmt.setString(5, qvo.getqReply()); // 큐앤에이 답글
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

	// 관리자 답글 추가/수정/삭제 
	public boolean update(QnaVO qvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(UPDATE);
			pstmt.setString(1,qvo.getqReply()); // 답글을 추가/수정/삭제 update
			pstmt.setInt(2, qvo.getqNum()); // PK로
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

	// 사용자 큐앤에이 삭제 
	public boolean delete(QnaVO qvo) {
		conn=JDBCUtil.connect();
		try {
			if(qvo.getqId()==null) {
				pstmt=conn.prepareStatement(DELETE);
				pstmt.setInt(1,qvo.getqNum()); 
			}
			else {
				pstmt=conn.prepareStatement(DELETE_ALL);
				pstmt.setString(1,qvo.getqId()); 
			}
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

	// 큐앤에이 상세
	public QnaVO selectOne(QnaVO qvo) {
		QnaVO data=null; 
		// 아래 return에서 data가 if를 안 거칠수도있으니까 초기화가 필요하다
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SELECTONE);
			pstmt.setInt(1, qvo.getqNum()); // PK로 상세보기
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { // 데이터 하나만 반환 - if
				data=new QnaVO();
				// 다 필요할수도 있으니까 전체 세팅
				data.setqNum(rs.getInt("QNUM"));
				data.setqTitle(rs.getString("QTITLE"));
				data.setqId(rs.getString("QID"));
				data.setqStarId(rs.getString("QSTARID")); // ID***
				data.setqContent(rs.getString("QCONTENT"));
				data.setqDate(rs.getString("QDATE"));
				data.setqReply(rs.getString("QREPLY"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	// 큐앤에이 목록 / 내 큐엔에이 보기 
	public ArrayList<QnaVO> selectAll(QnaVO qvo) {
		ArrayList<QnaVO> datas=new ArrayList<QnaVO>();
		conn=JDBCUtil.connect();
		try {
			if(qvo.getqId()==null) { // null이라면 큐앤에이 목록
				pstmt=conn.prepareStatement(SELECTALL);
			}
			else { // null이 아니라면 내 큐앤에이 보기
				pstmt=conn.prepareStatement(SELECTALL_MY);
				pstmt.setString(1, qvo.getqId()); 
			}
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) { 
				QnaVO data=new QnaVO();
				// 다 필요할수도 있으니까 전체 세팅
				data.setqNum(rs.getInt("QNUM"));
				data.setqTitle(rs.getString("QTITLE"));
				data.setqId(rs.getString("QID"));
				data.setqStarId(rs.getString("QSTARID")); // ID***
				data.setqContent(rs.getString("QCONTENT"));
				data.setqDate(rs.getString("QDATE"));
				data.setqReply(rs.getString("QREPLY"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

}