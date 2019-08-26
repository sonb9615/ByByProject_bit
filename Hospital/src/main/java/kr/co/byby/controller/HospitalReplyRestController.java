package kr.co.byby.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.byby.dto.ReplyHospitalVO;
import kr.co.byby.service.ReplyHospitalService;   

@RestController
@RequestMapping(value = "/restBoard")
public class HospitalReplyRestController {
   
   @Autowired
   private ReplyHospitalService service;
   
   @RequestMapping(value = "/getReqlyList", method = RequestMethod.POST)
   public List<ReplyHospitalVO> getReplyList(@RequestParam("no") int no) throws Exception {
      return service.getReplyList(no);
   }
   
   @RequestMapping(value = "/saveReqly", method = RequestMethod.POST)
   public Map<String, Object> saveReply(@RequestBody ReplyHospitalVO replyVO) throws Exception {
      
      Map<String, Object> result = new HashMap<>();
      try {
         service.saveReply(replyVO);
         result.put("status", "OK");
      } catch (Exception e) {
         e.printStackTrace();
         result.put("status", "False");
      }
      return result;
   }
   
   @RequestMapping(value="/deleteReply/{commentno}")
   public ResponseEntity<String> replyDelete(@PathVariable("commentno") Integer commentno){
      ResponseEntity<String> entity = null;
      try {
         service.deleteReply(commentno);
         entity = new ResponseEntity<String>("success",HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
   @RequestMapping(value="/updateReply/{commentno}")
   public ResponseEntity<String> replyUpdate(@PathVariable("commentno") Integer commentno, @RequestBody ReplyHospitalVO replyVO){
      ResponseEntity<String> entity = null;
      try {
         replyVO.setCommentno(commentno);
         service.updateReply(replyVO);
         entity = new ResponseEntity<String>("success",HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
      }
      return entity;
   }

}