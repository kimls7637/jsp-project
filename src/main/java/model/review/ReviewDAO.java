package model.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.common.JDBCUtil;

public class ReviewDAO {
   Connection conn;
   PreparedStatement pstmt;

   final String INSERT="INSERT INTO REVIEW VALUES((SELECT NVL(MAX(RNUM),0)+1 FROM REVIEW),?,?,?,?,?) ";
   final String UPDATE="UPDATE REVIEW SET RID='알수없음' WHERE RID=?";
   //[마이페이지]리뷰내역
   final String SELECTALL_MY="SELECT RNUM,RPNUM,RID,RCONTENT,RGRADE,RDATE,PNAME,PIMG FROM (SELECT RNUM,RPNUM,RID,RCONTENT,RGRADE,RDATE,PNAME,PIMG FROM REVIEW, PRODUCT WHERE REVIEW.RPNUM=PRODUCT.PNUM) WHERE RID=?";
   // 상품상세페이지 리뷰 목록
   final String SELECTALL="SELECT RNUM, RPNUM,RID,RPAD(SUBSTR(RID,1,3),LENGTH(RID),'*') AS RSTARID,RCONTENT,RGRADE,RDATE FROM REVIEW WHERE RPNUM=? ORDER BY RDATE DESC";

   //리뷰등록
   public boolean insert(ReviewVO rvo) {
      conn=JDBCUtil.connect();
   // 리뷰등록 날짜 생성
      Date today = new Date();
      SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
      try {
         pstmt=conn.prepareStatement(INSERT);
         pstmt.setInt(1, rvo.getrPNum());
         pstmt.setString(2, rvo.getrId());
         pstmt.setString(3, rvo.getrContent());
         pstmt.setString(4, rvo.getrGrade());
         pstmt.setString(5, date.format(today));
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
   
   //리뷰 수정은 없음. 회원탈퇴할때 리뷰작성 아이디를 알수없음으로 변경해줄것
   public boolean update(ReviewVO rvo) {
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(UPDATE);
         pstmt.setString(1,rvo.getrId());
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
   
   // 상품상세페이지 리뷰 목록
   public ArrayList<ReviewVO> selectAll(ReviewVO rvo) {
      ArrayList<ReviewVO> datas=new ArrayList<ReviewVO>();
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTALL);
         pstmt.setInt(1, rvo.getrPNum()); // id로 리뷰보기
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) { 
            ReviewVO data=new ReviewVO();
            data.setrNum(rs.getInt("RNUM"));
            data.setrPNum(rs.getInt("RPNUM"));
            data.setrId(rs.getString("RID"));
            data.setrStarId(rs.getString("RSTARID")); // ID***
            if(rs.getString("RSTARID").equals("알수")) {
               data.setrStarId(rs.getString("RID")); // 알수로 나오는거 막아버려~~~~
            }
            data.setrContent(rs.getString("RCONTENT"));
            data.setrGrade(rs.getString("RGRADE"));
            data.setrDate(rs.getString("RDATE"));
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return datas;
   }
   //[마이페이지]리뷰내역
   public ArrayList<ReviewVO> selectAllMy(ReviewVO rvo) {
      ArrayList<ReviewVO> datas=new ArrayList<ReviewVO>();
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTALL_MY);
         pstmt.setString(1, rvo.getrId()); // id로 리뷰보기
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) { // 데이터 하나만 반환 - if
            ReviewVO data=new ReviewVO();
            // 다 필요할수도 있으니까 전체 세팅
            data.setrNum(rs.getInt("RNUM"));
            data.setrPNum(rs.getInt("RPNUM"));
            data.setrId(rs.getString("RID"));
            data.setrContent(rs.getString("RCONTENT"));
            data.setrGrade(rs.getString("RGRADE"));
            data.setrDate(rs.getString("RDATE"));
            data.setrPName(rs.getString("PNAME"));
            data.setrPImg(rs.getString("PIMG"));
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return datas;
   }
}