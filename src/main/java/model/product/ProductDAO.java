package model.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;


public class ProductDAO {
   Connection conn;
   PreparedStatement pstmt;

   final String INSERT="INSERT INTO PRODUCT VALUES((SELECT NVL(MAX(PNUM),0)+1 FROM PRODUCT),?,?,?,?,?)";
   final String UPDATE="UPDATE PRODUCT SET PNAME=?, PPRICE=?, PCNT=?, PIMG=? WHERE PNUM=?"; // 상품변경시 이름,가격,재고 
   final String UPDATE_CNT="UPDATE PRODUCT SET PCNT=? WHERE PNUM=?";
   final String UPDATE_NOIMG="UPDATE PRODUCT SET PNAME=?, PPRICE=?, PCNT=? WHERE PNUM=?"; // 상품변경시 이름,가격,재고 
   final String DELETE="DELETE FROM PRODUCT WHERE PNUM=?";
   // 상품상세 가져오기 & 장바구니목록 가져오기
   final String SELECTONE="SELECT * FROM PRODUCT WHERE PNUM=?";

   // 상품목록 가져오기
   final String SELECTALL="SELECT * FROM PRODUCT WHERE PCATE=?";

   // 상품이름으로 검색
   final String SELECTALL_PNAME="SELECT * FROM PRODUCT WHERE PNAME LIKE '%'||?||'%' ORDER BY PNUM";
   
   // 크롤링쿼리문
   final String CHECK_DATA="SELECT COUNT(PNUM) AS PNUM FROM PRODUCT";
   


   public boolean insert(ProductVO pvo) { // 상품추가
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(INSERT);
         pstmt.setString(1,pvo.getpName()); // 상품이름
         pstmt.setInt(2,pvo.getpPrice()); // 상품가격
         pstmt.setString(3,pvo.getpImg()); // 상품이미지
         pstmt.setInt(4,pvo.getpCnt()); // 상품재고
         pstmt.setString(5,pvo.getpCate()); // 상품 카테고리
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

   public boolean update(ProductVO pvo) { // 상품변경
      conn=JDBCUtil.connect();
      try {
         if(pvo.getpImg() != null) {
         pstmt=conn.prepareStatement(UPDATE);
         pstmt.setString(1,pvo.getpName()); // 상품이름
         pstmt.setInt(2,pvo.getpPrice()); // 상품가격
         pstmt.setInt(3,pvo.getpCnt()); // 상품재고
         pstmt.setString(4, pvo.getpImg()); //이슬추가
         pstmt.setInt(5,pvo.getpNum()); // 조건 상품PK
         }
         else {
            pstmt=conn.prepareStatement(UPDATE_NOIMG);
                pstmt.setString(1,pvo.getpName()); // 상품이름
                pstmt.setInt(2,pvo.getpPrice()); // 상품가격
                pstmt.setInt(3,pvo.getpCnt()); // 상품재고
                pstmt.setInt(4,pvo.getpNum()); // 조건 상품PK
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

   public boolean updateCnt(ProductVO pvo) {
      conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(UPDATE_CNT);
            pstmt.setInt(1, pvo.getpCnt());
            pstmt.setInt(2, pvo.getpNum());
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
   
   
   public boolean delete(ProductVO pvo) { // 상품삭제
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(DELETE);
         pstmt.setInt(1, pvo.getpNum());
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

   public ProductVO selectOne(ProductVO pvo) { // 상품상세 & 장바구니목록
      ProductVO data=null; 
      // 아래 return에서 data가 if를 안 거칠수도있으니까 초기화가 필요하다
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTONE);
         pstmt.setInt(1, pvo.getpNum()); 
         ResultSet rs=pstmt.executeQuery();
         if(rs.next()) { // 데이터 하나만 반환 - if
            data=new ProductVO();
            // 다 필요할수도 있으니까 전체 세팅
            data.setpNum(rs.getInt("PNUM"));
            data.setpName(rs.getString("PNAME"));
            data.setpPrice(rs.getInt("PPRICE"));
            data.setpImg(rs.getString("PIMG"));
            data.setpCate(rs.getString("PCATE"));
            data.setpCnt(rs.getInt("PCNT"));
            data.setCartCnt(pvo.getCartCnt());
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return data;
   }

   public ArrayList<ProductVO> selectAll(ProductVO pvo) { // 상품목록가져오기
      // + 검색
      ArrayList<ProductVO> datas=new ArrayList<ProductVO>();
      conn=JDBCUtil.connect();
      try {
         if(pvo.getpName()==null) {//카테고리별상품목록출력
            pstmt=conn.prepareStatement(SELECTALL); // 전체보기
            pstmt.setString(1, pvo.getpCate());
         }
         else { // 상품 제목으로 검색
            pstmt=conn.prepareStatement(SELECTALL_PNAME);
            pstmt.setString(1, pvo.getpName());
         }
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) { 
            ProductVO data=new ProductVO();
            // 다 필요할수도 있으니까 전체 세팅
            data.setpNum(rs.getInt("PNUM"));
            data.setpName(rs.getString("PNAME"));
            data.setpPrice(rs.getInt("PPRICE"));
            data.setpImg(rs.getString("PIMG"));
            data.setpCnt(rs.getInt("PCNT"));
            data.setpCate(rs.getString("PCATE"));
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return datas;
   }

   // 크롤링 메서드
   public boolean checkData(ProductVO pvo) {
      conn=JDBCUtil.connect();
      ProductVO data = null;
      try {
         pstmt=conn.prepareStatement(CHECK_DATA);
         ResultSet rs=pstmt.executeQuery();
         //만약 데이터가 있다면
         if(rs.next()) { 
            data=new ProductVO();
            data.setpNum(rs.getInt("PNUM"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      if(data.getpNum()==0) {
         return true;
      }
      return false;
   }

}