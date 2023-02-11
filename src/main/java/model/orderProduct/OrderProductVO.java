package model.orderProduct;

public class OrderProductVO {
   private int oPk; // PK
   private int oNum; // 주문번호
   private String oId; // 주문자FK
   private String oName; // 받는사람
   private String oPhone; // 받는사람 연락처
   private String oAddress; // 받는사람 주소
   private String oDate; // 주문날짜
   private int oPNum; // 상품번호FK
   private int oCnt; // 주문수량
   private String oMsg; // 주문메세지
   private int totalPrice; // 총매출 - vo에만 있음
   private String oCate; // 카테고리별 총수량 알때 씀 - vo에만 있음
   private int totalDay; // 일 매출 - vo에만 있음
   private String oPName; // 베스트,워스트상품 보내줄때 - vo에만 있음
   private String oPImg; // 베스트,워스트상품 보내줄때 - vo에만 있음
   private int oPPrice; // 베스트,워스트상품 보내줄때 - vo에만 있음
   private int idTotalPrice; // 멤버별 주문총액 top5 - vo에만 있음
   
   
   public int getoPk() {
      return oPk;
   }
   public void setoPk(int oPk) {
      this.oPk = oPk;
   }
   public int getoNum() {
      return oNum;
   }
   public void setoNum(int oNum) {
      this.oNum = oNum;
   }
   public String getoId() {
      return oId;
   }
   public void setoId(String oId) {
      this.oId = oId;
   }
   public String getoName() {
      return oName;
   }
   public void setoName(String oName) {
      this.oName = oName;
   }
   public String getoPhone() {
      return oPhone;
   }
   public void setoPhone(String oPhone) {
      this.oPhone = oPhone;
   }
   public String getoAddress() {
      return oAddress;
   }
   public void setoAddress(String oAddress) {
      this.oAddress = oAddress;
   }
   public String getoDate() {
      return oDate;
   }
   public void setoDate(String oDate) {
      this.oDate = oDate;
   }
   public int getoPNum() {
      return oPNum;
   }
   public void setoPNum(int oPNum) {
      this.oPNum = oPNum;
   }
   public int getoCnt() {
      return oCnt;
   }
   public void setoCnt(int oCnt) {
      this.oCnt = oCnt;
   }
   public String getoMsg() {
      return oMsg;
   }
   public void setoMsg(String oMsg) {
      this.oMsg = oMsg;
   }
   
   public int getTotalPrice() {
      return totalPrice;
   }
   public void setTotalPrice(int totalPrice) {
      this.totalPrice = totalPrice;
   }
   public String getoCate() {
      return oCate;
   }
   public void setoCate(String oCate) {
      this.oCate = oCate;
   }
   
   public int getTotalDay() {
      return totalDay;
   }
   public void setTotalDay(int totalDay) {
      this.totalDay = totalDay;
   }
   
   public String getoPName() {
      return oPName;
   }
   public void setoPName(String oPName) {
      this.oPName = oPName;
   }
   public String getoPImg() {
      return oPImg;
   }
   public void setoPImg(String oPImg) {
      this.oPImg = oPImg;
   }
   public int getoPPrice() {
      return oPPrice;
   }
   public void setoPPrice(int oPPrice) {
      this.oPPrice = oPPrice;
   }
   
   public int getIdTotalPrice() {
      return idTotalPrice;
   }
   public void setIdTotalPrice(int idTotalPrice) {
      this.idTotalPrice = idTotalPrice;
   }
@Override
public String toString() {
	return "OrderVO [oPk=" + oPk + ", oNum=" + oNum + ", oId=" + oId + ", oName=" + oName + ", oPhone=" + oPhone
			+ ", oAddress=" + oAddress + ", oDate=" + oDate + ", oPNum=" + oPNum + ", oCnt=" + oCnt + ", oMsg=" + oMsg
			+ ", totalPrice=" + totalPrice + ", oCate=" + oCate + ", totalDay=" + totalDay + ", oPName=" + oPName
			+ ", oPImg=" + oPImg + ", oPPrice=" + oPPrice + ", idTotalPrice=" + idTotalPrice + "]";
}

   
   
}