package kr.co.byby.dto;

import java.util.List;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

public class HospitalBoardVO {
   
   List<MultipartFile> files;
   
   private String file_name_key;
   
   private String delete_file;
   
   private int no;
   
   @Length(min=2, max=50, message="2글자 이상 50글자 이하로 입력하세요")
   @NotEmpty(message="필수항목입니다")
   private String title;
   private int ctg_no;
   private String ctg_name;
   @NotEmpty(message="필수항목입니다")
   private String content;
   private int viewcnt;
   private String wrt_date;
   private String memberid;
   

   
   public HospitalBoardVO() {
      super();
      // TODO Auto-generated constructor stub
   }


   


   
   

   public HospitalBoardVO(List<MultipartFile> files, String file_name_key, String delete_file, int no, String title,
         int ctg_no, String ctg_name, String content, int viewcnt, String wrt_date, String memberid) {
      super();
      this.files = files;
      this.file_name_key = file_name_key;
      this.delete_file = delete_file;
      this.no = no;
      this.title = title;
      this.ctg_no = ctg_no;
      this.ctg_name = ctg_name;
      this.content = content;
      this.viewcnt = viewcnt;
      this.wrt_date = wrt_date;
      this.memberid = memberid;
   }








   public String getDelete_file() {
      return delete_file;
   }



   public void setDelete_file(String delete_file) {
      this.delete_file = delete_file;
   }



   public String getFile_name_key() {
      return file_name_key;
   }



   public void setFile_name_key(String file_name_key) {
      this.file_name_key = file_name_key;
   }



   public List<MultipartFile> getFiles() {
      return files;
   }


   public void setFiles(List<MultipartFile> files) {
      this.files = files;
   }


   public int getNo() {
      return no;
   }


   public void setNo(int no) {
      this.no = no;
   }


   public String getTitle() {
      return title;
   }


   public void setTitle(String title) {
      this.title = title;
   }


   public int getCtg_no() {
      return ctg_no;
   }


   public void setCtg_no(int ctg_no) {
      this.ctg_no = ctg_no;
   }


   public String getCtg_name() {
      return ctg_name;
   }


   public void setCtg_name(String ctg_name) {
      this.ctg_name = ctg_name;
   }


   public String getContent() {
      return content;
   }


   public void setContent(String content) {
      this.content = content;
   }


   public int getViewcnt() {
      return viewcnt;
   }


   public void setViewcnt(int viewcnt) {
      this.viewcnt = viewcnt;
   }


   public String getWrt_date() {
      return wrt_date;
   }


   public void setWrt_date(String wrt_date) {
      this.wrt_date = wrt_date;
   }


   public String getMemberid() {
      return memberid;
   }


   public void setMemberid(String memberid) {
      this.memberid = memberid;
   }


   @Override
   public String toString() {
      return "HospitalBoardVO [no=" + no + ", title=" + title + ", ctg_no=" + ctg_no + ", ctg_name=" + ctg_name
            + ", content=" + content + ", viewcnt=" + viewcnt + ", wrt_date=" + wrt_date + ", memberid=" + memberid
            + "]";
   }

   
}
