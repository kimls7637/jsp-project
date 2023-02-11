package model.orderProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.common.JDBCUtil;

public class OrderProductDAO {
   Connection conn;
   PreparedStatement pstmt;

   // OPK빼고 다 추가 / 주문번호 자동증가
   final String INSERT="INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),?,?,?,?,?,?,?,?,?)";

   // 나의 주문내역 !!!!!!!!!!!!!!!!!!!!!!
   final String SELECTALL=
        "SELECT ORDERTABLE.*, PRICETABLE.TOTALPRICE\n"
        + "   FROM (SELECT OPK,ONUM,OID,ONAME,OPHONE,OADDRESS,ODATE,OPNUM,OCNT,OMSG,PNAME,PPRICE,PIMG FROM ORDERPRODUCT, PRODUCT WHERE OPNUM=PNUM) ORDERTABLE,\n"
        + "   (SELECT  SUM(OCNT * PPRICE) AS TOTALPRICE, ONUM FROM (SELECT ONUM, OPNUM, OCNT FROM ORDERPRODUCT WHERE OID=?), PRODUCT WHERE OPNUM = PNUM GROUP BY ONUM) PRICETABLE\n"
        + "   WHERE ORDERTABLE.ONUM = PRICETABLE.ONUM\n"
        + "   ORDER BY ORDERTABLE.ONUM DESC";

   // 회원 TOP5 (매출량 기준) - 관리자메인에서 볼수있는거
   final String SELECTALL_TOP5="SELECT * FROM (SELECT OID,SUM(OCNT*PPRICE) AS IDTOTALPRICE FROM (SELECT OID,OCNT,PPRICE FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM) GROUP BY OID ) WHERE ROWNUM<=5 ORDER BY IDTOTALPRICE DESC";

   //관리자 워스트2개 
   final String SELECTALL_WORST="SELECT OPNUM, TOTALOCNT,PNAME,PIMG,PPRICE FROM(SELECT OPNUM, TOTALOCNT,PNAME,PIMG,PPRICE FROM (SELECT OPNUM, SUM(OCNT) AS TOTALOCNT FROM ORDERPRODUCT GROUP BY OPNUM) TOTALTABLE,PRODUCT WHERE TOTALTABLE.OPNUM=PRODUCT.PNUM ORDER BY TOTALOCNT ASC) WHERE ROWNUM<=2";
   // 베스트6개 (회원 메인+관리자 메인)
   final String SELECTALL_BEST=
         "SELECT OPNUM, TOTALOCNT,PNAME,PIMG,PPRICE "
      +   "FROM(SELECT OPNUM, TOTALOCNT,PNAME,PIMG,PPRICE "
      +        "FROM (SELECT OPNUM, SUM(OCNT) AS TOTALOCNT "
      +             "FROM ORDERPRODUCT "
      +             "GROUP BY OPNUM) TOTALTABLE,PRODUCT "
      +        "WHERE TOTALTABLE.OPNUM=PRODUCT.PNUM "
      +        "ORDER BY TOTALOCNT DESC) "
      +    "WHERE ROWNUM<=6";

   // 일 매출: 지정 날짜 - SELECTONE
   final String SELECTONE_DAY="SELECT SUM(OCNT*PPRICE) AS TOTALDAY FROM (SELECT ODATE,OCNT,PPRICE FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM) WHERE ODATE =? GROUP BY ODATE";

   // 일 매출: 날짜기간 설정 - SELECTALL- 오름차순 정렬
   final String SELECTALL_DAY="SELECT SUBSTR(ODATE,-5) AS ODATE, SUM(OCNT*PPRICE) AS TOTALDAY FROM(SELECT * FROM (SELECT ODATE,OCNT,PPRICE FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM) WHERE ODATE BETWEEN TO_CHAR(SYSDATE-6, 'YYYY-MM-DD') AND TO_CHAR(SYSDATE, 'YYYY-MM-DD')) GROUP BY ODATE ORDER BY ODATE ASC";

   // 총 매출 -  조인*
   final String SELECTONE_ALL="SELECT SUM(OCNT*PPRICE) AS TOTAL FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM";

   // 카테고리별 판매량 - 조인*/GROUP BY
   final String SELECTONE_CATEGORY="SELECT SUM(OCNT) AS TOTALCNT FROM (SELECT OCNT,PCATE FROM ORDERPRODUCT, PRODUCT WHERE OPNUM=PNUM) WHERE PCATE=? GROUP BY PCATE";

   //아직 상품 구매가 없을시 세팅하기위한 쿼리문
   final String SET_ITEM="SELECT PNUM,PPRICE,PNAME,PIMG FROM PRODUCT";

   // 결제시 중복결제 막기위한 opk++반환
   final String SELECTONE_MAXOPK="SELECT NVL(MAX(OPK),0)+1 AS OPK FROM ORDERPRODUCT";

   // ONUM 자동증가 시켜주기
   final String SELECTONE_MAXONUM="SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT";

   // 알수없음 넣어주기
   final String UPDATE="UPDATE ORDERPRODUCT SET OID='알수없음' WHERE OID=?";

   // 주문하기
   public boolean insert(OrderProductVO ovo) {
      conn=JDBCUtil.connect();
      // 주문날짜 생성
      Date today = new Date();
      SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
      try {
         pstmt=conn.prepareStatement(INSERT);
         pstmt.setInt(1,ovo.getoNum()); // 주문번호
         pstmt.setString(2,ovo.getoId()); // 주문자FK 
         pstmt.setString(3,ovo.getoName()); // 받는사람
         pstmt.setString(4,ovo.getoPhone()); // 받는사람 연락처
         pstmt.setString(5,ovo.getoAddress()); // 받는사람 주소
         pstmt.setString(6,date.format(today)); // 주문날짜
         pstmt.setInt(7,ovo.getoPNum()); // 상품번호FK
         pstmt.setInt(8,ovo.getoCnt()); // 주문수량
         pstmt.setString(9,ovo.getoMsg()); // 주문메세지
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

   //오더 수정은 없음. 회원탈퇴할때 주문내역 아이디를 알수없음으로 변경해줄것
   public boolean update(OrderProductVO ovo) {
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(UPDATE);
         pstmt.setString(1,ovo.getoId());
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
   
   // 나의주문내역
   public ArrayList<OrderProductVO> selectAll(OrderProductVO ovo) {
      ArrayList<OrderProductVO> datas=new ArrayList<OrderProductVO>();
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTALL);
         pstmt.setString(1, ovo.getoId()); // 주문자ID로 세팅해서
         ResultSet rs=pstmt.executeQuery(); // 불러오기
         while(rs.next()) { 
            OrderProductVO data=new OrderProductVO();
            // 다 필요할수도 있으니까 전체 세팅
            data.setoPk(rs.getInt("OPK"));
            data.setoNum(rs.getInt("ONUM"));
            data.setoId(rs.getString("OID"));
            data.setoName(rs.getString("ONAME"));
            data.setoPhone(rs.getString("OPHONE"));
            data.setoAddress(rs.getString("OADDRESS"));
            data.setoDate(rs.getString("ODATE"));
            data.setoPNum(rs.getInt("OPNUM"));
            data.setoCnt(rs.getInt("OCNT"));
            data.setoMsg(rs.getString("OMSG"));
            data.setoPName(rs.getString("PNAME"));
            data.setoPPrice(rs.getInt("PPRICE"));
            data.setoPImg(rs.getString("PIMG"));
            data.setTotalPrice(rs.getInt("TOTALPRICE")); // 주문별 총금액
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return datas;
   }

   // 워스트2개
   public ArrayList<OrderProductVO> selectAllWorst(OrderProductVO ovo) {
      ArrayList<OrderProductVO> datas=new ArrayList<OrderProductVO>();
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTALL_WORST);  
         
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) { 
            OrderProductVO data=new OrderProductVO();
            data.setoPNum(rs.getInt("OPNUM")); // 상품번호!!!
            data.setoCnt(rs.getInt("TOTALOCNT")); // 상품수량
            data.setoPName(rs.getString("PNAME"));
            data.setoPImg(rs.getString("PIMG"));
            data.setoPPrice(rs.getInt("PPRICE"));
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      //데이터가 없을시 임시 데이트 세팅

      if(datas.size()<2) {
         conn=JDBCUtil.connect();
         try {
            pstmt=conn.prepareStatement(SET_ITEM);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()) {
               boolean flag=true;
               for (int i=0;i<datas.size();i++) {
                  if(datas.get(i).getoPNum()==rs.getInt("PNUM")) {
                     flag=false;
                     break;
                  }
               }
               if(flag) {
                  OrderProductVO data=new OrderProductVO();
                  data.setoPNum(rs.getInt("PNUM")); // 상품번호!!! **수정했듬!
                  data.setoPName(rs.getString("PNAME"));
                  data.setoPImg(rs.getString("PIMG"));
                  data.setoPPrice(rs.getInt("PPRICE"));
                  datas.add(data);
               }
               
               //아이템 2개 채웠으면 종료
               if(datas.size()==2) {
                  break;
               }
            }
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      JDBCUtil.disconnect(conn, pstmt);
      return datas;
   }

   // 베스트6개 
   public ArrayList<OrderProductVO> selectAllBest(OrderProductVO ovo) {
      ArrayList<OrderProductVO> datas=new ArrayList<OrderProductVO>();  // 어레이리스트 객체화
      conn=JDBCUtil.connect();  // DB 연결
      try {
         pstmt=conn.prepareStatement(SELECTALL_BEST);  // connection을 통해 pstmt 객체 확보
                                          // 준비시킬 SQL문을 인자에 넣어줌
         ResultSet rs=pstmt.executeQuery();  // SQL문의 실행결과가 rs에 저장됨 즉, rs == 결과값
         while(rs.next()) { 
            OrderProductVO data=new OrderProductVO();  // OrderProductVO 객체화
            data.setoPNum(rs.getInt("OPNUM"));  // data에 결과값 차례대로 세팅
            data.setoCnt(rs.getInt("TOTALOCNT")); 
            data.setoPName(rs.getString("PNAME"));
            data.setoPImg(rs.getString("PIMG"));
            data.setoPPrice(rs.getInt("PPRICE"));
            datas.add(data);  // 어레이리스트에 정보들 세팅된 주문상품 add
         }
      } catch (SQLException e) {  // try문 실행 중 SQL예외 발생 시
         e.printStackTrace();  // 예외 내용 출력
      }
      JDBCUtil.disconnect(conn, pstmt);
      
      if(datas.size()<6) {  // 팔린 상품들(datas)이 6개 미만이라면
         if(ovo.getoId()!="admin") {  // 넘어온 id가 "admin"이 아니라면
            conn=JDBCUtil.connect();
            try {
               pstmt=conn.prepareStatement(SET_ITEM);  // 제품 불러오는 SQL문 준비시킴
               ResultSet rs=pstmt.executeQuery();  // SQL문의 실행결과가 rs에 저장됨
               while(rs.next()) {
                  boolean flag=true;  // 중복 확인 flag 변수 true로 초기화
                  for (int i=0;i<datas.size();i++) {
                     if(datas.get(i).getoPNum()==rs.getInt("PNUM")) { // 주문상품리스트에 있는 상품번호와 임시로 추가해줄 상품번호가 같다면
                        flag=false; // 중복, false로 바꿔줌
                        break; // 중복번호 찾으면 for문 종료
                     }
                  }
                  if(flag) { // 임시로 추가해줄 상품번호가 중복되는게 없다면 실행
                     OrderProductVO data=new OrderProductVO();
                     data.setoPNum(rs.getInt("PNUM"));  // data에 결과값 차례대로 세팅
                     data.setoPName(rs.getString("PNAME"));
                     data.setoPImg(rs.getString("PIMG"));
                     data.setoPPrice(rs.getInt("PPRICE"));
                     datas.add(data);
                  }
                  if(datas.size()==6) { // 상품 6개 채웠으면 반복문 종료
                     break;
                  }
               }
            } catch (SQLException e) {  // try문 실행 중 SQL예외 발생 시
               e.printStackTrace();  // 예외 내용 출력
            }
         }
         JDBCUtil.disconnect(conn, pstmt);  // DB 연결 해제
      }
      return datas;  // 관리자일때는 임시 데이터 세팅전의 어레이리스트 반환
   }


   // 일 매출: 지정 날짜 - SELECTONE
   public OrderProductVO selectOneDay(OrderProductVO ovo) {
      OrderProductVO data=new OrderProductVO(); // 반환할 data 객체화
      conn=JDBCUtil.connect(); // 데이터베이스와 연결
      // connection을 JDBCUtil에서 다 처리해주고있기 때문에 연결 메서드를 호출해서 사용하면 된다.
      try {
         // connection을 통해 pstmt 객체 확보. prepareStatement()메서드를 통해서.
         pstmt=conn.prepareStatement(SELECTONE_DAY); // pstmt객체 생성시에 준비시킬 SQL문을 인자에 넣어주고
         pstmt.setString(1, ovo.getoDate()); // 첫번째 물음표에 주문날짜 세팅
         ResultSet rs=pstmt.executeQuery(); // SQL문 실행시키고 그 결과값인 ResultSet을 반환
         data.setoDate(ovo.getoDate());//데이터가 없을시 날자를 그대로 세팅해줌
         if(rs.next()) {
            data.setTotalDay(rs.getInt("TOTALDAY")); 
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return data;
   }


   ////// 일 매출 먼저 만들어둔것. 나중에 쓸수도있으니 살려두기
   // 일 매출: 날짜기간 설정 - SELECTALL- 오름차순 정렬
   public ArrayList<OrderProductVO> selectAllDay(OrderProductVO ovo) {
      ArrayList<OrderProductVO> datas=new ArrayList<OrderProductVO>();
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTALL_DAY);
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) { 
            OrderProductVO data=new OrderProductVO();
            data.setTotalDay(rs.getInt("TOTALDAY"));
            data.setoDate(rs.getString("ODATE"));
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return datas;
   }


   // 총 매출
   public OrderProductVO selectOneAll(OrderProductVO ovo) {
      OrderProductVO data=null;
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTONE_ALL);
         ResultSet rs=pstmt.executeQuery();
         if(rs.next()) { 
            data=new OrderProductVO();
            data.setTotalPrice(rs.getInt("TOTAL")); // 총 매출 세팅
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return data;
   }


   // 카테고리별 총 수량
   public OrderProductVO selectOneCategory(OrderProductVO ovo) {
      OrderProductVO data=null;
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTONE_CATEGORY);
         pstmt.setString(1, ovo.getoCate());
         ResultSet rs=pstmt.executeQuery();
         if(rs.next()) { 
            data=new OrderProductVO();
            data.setoCnt(rs.getInt("TOTALCNT")); // 각 카테고리 총개수
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return data;
   }

   // 회원 TOP5 (매출량 기준) - 관리자메인에서 볼수있는거
   public ArrayList<OrderProductVO> selectAllTop5(OrderProductVO ovo) {
      ArrayList<OrderProductVO> datas=new ArrayList<OrderProductVO>();
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTALL_TOP5);
         ResultSet rs=pstmt.executeQuery();
         while(rs.next()) { 
            OrderProductVO data=new OrderProductVO();
            data.setIdTotalPrice(rs.getInt("IDTOTALPRICE")); // 멤버별 주문총액 top5
            data.setoId(rs.getString("OID")); // 주문id
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return datas;
   }

   // 결제시 중복결제 막기위한 opk++반환
   public OrderProductVO selectOneMaxoPk(OrderProductVO ovo) { 
      OrderProductVO data=new OrderProductVO();
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTONE_MAXOPK);
         ResultSet rs=pstmt.executeQuery();
         if(rs.next()) {
            data.setoPk(rs.getInt("OPK")); // +1된 OPK
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return data;
   }

   // ONUM 주문번호 자동증가 
   public OrderProductVO selectOneMaxoNum(OrderProductVO ovo) { 
      OrderProductVO data=new OrderProductVO();
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(SELECTONE_MAXONUM);
         ResultSet rs=pstmt.executeQuery();
         if(rs.next()) {
            data.setoNum(rs.getInt("ONUM")); // 자동증가된 ONUM
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      JDBCUtil.disconnect(conn, pstmt);
      return data;
   }

}