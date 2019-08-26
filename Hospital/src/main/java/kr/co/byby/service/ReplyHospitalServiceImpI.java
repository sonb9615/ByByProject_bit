package kr.co.byby.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.byby.dao.ReplyHospitalDAO;
import kr.co.byby.dao.ReplySymptomDAO;
import kr.co.byby.dto.ReplyHospitalVO;
import kr.co.byby.dto.ReplySymptomVO;

@Service
public class ReplyHospitalServiceImpI implements ReplySymptomService{
   
   @Autowired
   private ReplySymptomDAO replysymptomDAO;

   @Override
   public List<ReplySymptomVO> getReplyList(int no) throws Exception {
      return replysymptomDAO.getReplyList(no);
   }

   @Override
   public int saveReply(ReplySymptomVO replyVO) throws Exception {
      return replysymptomDAO.saveReply(replyVO);
   }

   @Override
   public int updateReply(ReplySymptomVO replyVO) throws Exception {
      return replysymptomDAO.updateReply(replyVO);
   }

   @Override
   public int deleteReply(int commentno) throws Exception {
      return replysymptomDAO.deleteReply(commentno);
   }

}