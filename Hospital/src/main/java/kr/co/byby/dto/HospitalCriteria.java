package kr.co.byby.dto;

public class HospitalCriteria {

   
   private int page;
   private int perPageNum;
   private int rowStart;
   private int rowEnd;
   
   
   private String ctg_name;
   
   
   
   public HospitalCriteria() {
      this.page = 1;
      this.perPageNum = 10;
   }

   


   public String getCtg_name() {
      return ctg_name;
   }

   public void setCtg_name(String ctg_name) {
      this.ctg_name = ctg_name;
   }




   public int getPage() {
      return page;
   }


   public int getPageStart() {
      return (this.page - 1) * perPageNum;
   }
   

   public void setPage(int page) {
      
      if(page<=0) {
         this.page = 1;
         return;
      }
      this.page = page;
   }


   public int getPerPageNum() {
      return perPageNum;
   }


   public void setPerPageNum(int perPageNum) {
      if(perPageNum <= 0 || perPageNum > 100) {
         this.perPageNum = 10;
         return;
      }
      this.perPageNum = perPageNum;
   }




   public int getRowStart() {
      rowStart = ((page - 1) * perPageNum + 1);
      return rowStart;
   }




   public void setRowStart(int rowStart) {
      this.rowStart = rowStart;
   }




   public int getRowEnd() {
      rowEnd = rowStart + perPageNum - 1;
      return rowEnd;
   }

   public void setRowEnd(int rowEnd) {
      this.rowEnd = rowEnd;
   }




   @Override
   public String toString() {
      return "HospitalCriteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd="
            + rowEnd + ", ctg_name=" + ctg_name + "]";
   }




   
   
   
   
   
}