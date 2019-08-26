package kr.co.byby.dto;

import javax.validation.constraints.NotEmpty;

public class ReplyHospitalVO {
   private int no;
   private int commentno;
   private String comm_date;
   
   @NotEmpty(message="필수항목입니다")
   private String comm_content;
   private String memberid;
   
   @NotEmpty(message="필수항목입니다")
   private String replyerid;
   
   public ReplyHospitalVO() {
      // TODO Auto-generated constructor stub
   }

   public ReplyHospitalVO(int no, int commentno, String comm_date, String comm_content, String memberid,
         String replyerid) {
      super();
      this.no = no;
      this.commentno = commentno;
      this.comm_date = comm_date;
      this.comm_content = comm_content;
      this.memberid = memberid;
      this.replyerid = replyerid;
   }

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public int getCommentno() {
      return commentno;
   }

   public void setCommentno(int commentno) {
      this.commentno = commentno;
   }

   public String getComm_date() {
      return comm_date;
   }

   public void setComm_date(String comm_date) {
      this.comm_date = comm_date;
   }

   public String getComm_content() {
      return comm_content;
   }

   public void setComm_content(String comm_content) {
      this.comm_content = comm_content;
   }

   public String getMemberid() {
      return memberid;
   }

   public void setMemberid(String memberid) {
      this.memberid = memberid;
   }

   public String getReplyerid() {
      return replyerid;
   }

   public void setReplyerid(String replyerid) {
      this.replyerid = replyerid;
   }

   @Override
   public String toString() {
      return "ReplyHospitalVO [no=" + no + ", commentno=" + commentno + ", comm_date=" + comm_date + ", comm_content="
            + comm_content + ", memberid=" + memberid + ", replyerid=" + replyerid + "]";
   }


}