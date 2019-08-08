package kr.co.byby.controller;

import java.net.URI;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.web.client.RestTemplate;

import kr.co.byby.dto.HospitalItemDTO;
import kr.co.byby.dto.HospitalItemsDTO;
import kr.co.byby.dto.HospitalResponseVO;

public class Search {
   
   private static RestTemplate restTemplate = new RestTemplate();
   private final static String serviceKey = "mpX6S1AFxgLPtTT8D2E2zoUm5oJ%2Bv8LnphKcPuh9GiDHM27AQf3HXFPVT9JAWhIYiS0QePuw0WdFvCDRh10zDQ%3D%3D";
   private final static String hospitalURL = "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
   private String requestURL = null;
   private static String Q0;
   private static String Q1;
   private static String QD;
   static List<HospitalItemDTO> items;
   
   public Search(String Q0, String Q1, String QD) {
      this.Q0 = Q0;
      this.Q1 = Q1;
      this.QD = QD;
   }


//   public static String requestHospitalInfo(String Q0, String Q1, String QD, int i, int j) {
//
//      try {
//         URI requestURI = new URI(hospitalURL + "?serviceKey=" + serviceKey + "&Q0=" + URLEncoder.encode(Q0, "UTF-8") + "&Q1=" + URLEncoder.encode(Q1, "UTF-8") + "&QD=" + QD + "&pageNo=1" + "&numOfRows=100");
//         HospitalResponseVO response = restTemplate.getForObject(requestURI, HospitalResponseVO.class);
//         
//         System.out.println("병원정보입니다..");
//         items = response.getBody().getItems();
//         
//         for(HospitalItemDTO item : items) {
//            System.out.println(item.toString());
//         }
//      
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//
//      
////      int size = items.size();
////      System.out.println(size);
//      
////      for(int n=0; n<size; n++) {
////         HospitalItemDTO s = items.get(n);
////         System.out.println(s);
////      }
////      
//      
//      HospitalItemDTO s = items.get(i);
//      String str = s.toString();
//      String[] words = str.split("!!");
//      
////      System.out.println(words[j]);
//
//      return words[j];
//   }
   public static String requestHospitalInfo() {

      try {
         URI requestURI = new URI(hospitalURL + "?serviceKey=" + serviceKey + "&Q0=" + URLEncoder.encode(Q0, "UTF-8") + "&Q1=" + URLEncoder.encode(Q1, "UTF-8") + "&QD=" + QD + "&pageNo=1" + "&numOfRows=100");
         HospitalResponseVO response = restTemplate.getForObject(requestURI, HospitalResponseVO.class);
         
         System.out.println("병원정보입니다..");
         items = response.getBody().getItems();
         
         for(HospitalItemDTO item : items) {
            System.out.println(item.toString());
         }
      
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return items.toString();
   }
   
   public static String getItem(int i) {
      return items.get(i).toString();
   }
   

   public static int cnt() {
      return items.size();
   }

}