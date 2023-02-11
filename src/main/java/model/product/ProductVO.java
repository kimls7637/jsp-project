package model.product;

public class ProductVO {
   private int pNum;
   private String pName;
   private int pPrice;
   private String pImg;
   private int pCnt;
   private String pCate;
   private int cartCnt; // 장바구니보낼때 상품 개수(vo에만 있음)
   
   public int getpNum() {
      return pNum;
   }
   public void setpNum(int pNum) {
      this.pNum = pNum;
   }
   public String getpName() {
      return pName;
   }
   public void setpName(String pName) {
      this.pName = pName;
   }
   public int getpPrice() {
      return pPrice;
   }
   public void setpPrice(int pPrice) {
      this.pPrice = pPrice;
   }
   public String getpImg() {
      return pImg;
   }
   public void setpImg(String pImg) {
      this.pImg = pImg;
   }
   public int getpCnt() {
      return pCnt;
   }
   public void setpCnt(int pCnt) {
      this.pCnt = pCnt;
   }
   public String getpCate() {
      return pCate;
   }
   public void setpCate(String pCate) {
      this.pCate = pCate;
   }
   public int getCartCnt() {
      return cartCnt;
   }
   public void setCartCnt(int cartCnt) {
      this.cartCnt = cartCnt;
   }
   @Override
   public String toString() {
      return "ProductVO [pNum=" + pNum + ", pName=" + pName + ", pPrice=" + pPrice + ", pImg=" + pImg + ", pCnt="
            + pCnt + ", pCate=" + pCate + ", cartCnt=" + cartCnt + "]";
   }
   

   
}