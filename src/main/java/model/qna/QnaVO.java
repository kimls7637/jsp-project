package model.qna;

public class QnaVO {
   private int qNum; // PK
   private String qTitle;
   private String qId; // FK
   private String qContent;
   private String qDate;
   private String qReply; // 댓글
   private String qStarId; // 목록보낼때 id***로 보내기위함. vo에만 있음
   
   public int getqNum() {
      return qNum;
   }
   public void setqNum(int qNum) {
      this.qNum = qNum;
   }
   public String getqTitle() {
      return qTitle;
   }
   public void setqTitle(String qTitle) {
      this.qTitle = qTitle;
   }
   public String getqId() {
      return qId;
   }
   public void setqId(String qId) {
      this.qId = qId;
   }
   public String getqContent() {
      return qContent;
   }
   public void setqContent(String qContent) {
      this.qContent = qContent;
   }
   public String getqDate() {
      return qDate;
   }
   public void setqDate(String qDate) {
      this.qDate = qDate;
   }
   public String getqReply() {
      return qReply;
   }
   public void setqReply(String qReply) {
      this.qReply = qReply;
   }
   
   public String getqStarId() {
      return qStarId;
   }
   public void setqStarId(String qStarId) {
      this.qStarId = qStarId;
   }
   @Override
   public String toString() {
      return "QnaVO [qNum=" + qNum + ", qTitle=" + qTitle + ", qId=" + qId + ", qContent=" + qContent + ", qDate="
            + qDate + ", qReply=" + qReply + ", qStarId=" + qStarId + "]";
   }
   
   
   
}