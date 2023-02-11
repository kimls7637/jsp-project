package model.review;

public class ReviewVO {   
   private int rNum;//PK
   private int rPNum;//FK
   private String rId;//FK
   private String rContent;
   private String rGrade;
   private String rDate;
   private String rStarId; // 목록보낼때 id***로 보내기위함. vo에만 있음
   private String rPName;
   private String rPImg;
   public int getrNum() {
      return rNum;
   }
   public void setrNum(int rNum) {
      this.rNum = rNum;
   }
   public String getrId() {
      return rId;
   }
   public void setrId(String rId) {
      this.rId = rId;
   }
   public String getrContent() {
      return rContent;
   }
   public void setrContent(String rContent) {
      this.rContent = rContent;
   }
   public String getrGrade() {
      return rGrade;
   }
   public void setrGrade(String rGrade) {
      this.rGrade = rGrade;
   }
   public String getrDate() {
      return rDate;
   }
   public void setrDate(String rDate) {
      this.rDate = rDate;
   }
   public int getrPNum() {
      return rPNum;
   }
   public void setrPNum(int rPNum) {
      this.rPNum = rPNum;
   }
   public String getrStarId() {
      return rStarId;
   }
   public void setrStarId(String rStarId) {
      this.rStarId = rStarId;
   }
   public String getrPName() {
      return rPName;
   }
   public void setrPName(String rPName) {
      this.rPName = rPName;
   }
   public String getrPImg() {
      return rPImg;
   }
   public void setrPImg(String rPImg) {
      this.rPImg = rPImg;
   }
@Override
public String toString() {
	return "ReviewVO [rNum=" + rNum + ", rPNum=" + rPNum + ", rId=" + rId + ", rContent=" + rContent + ", rGrade="
			+ rGrade + ", rDate=" + rDate + ", rStarId=" + rStarId + ", rPName=" + rPName + ", rPImg=" + rPImg + "]";
}
   


}