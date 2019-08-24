package kr.co.byby.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.byby.dao.ReplyHospitalDAO;
import kr.co.byby.dto.ReplyHospitalVO;

@Service
public class ReplySymptomServiceImpI implements ReplyHospitalService{
   
   @Autowired
   private ReplyHospitalDAO replyhospitalDAO;

   @Override
   public List<ReplyHospitalVO> getReplyList(int no) throws Exception {
      return replyhospitalDAO.getReplyList(no);
   }

   @Override
   public int saveReply(ReplyHospitalVO replyVO) throws Exception {
      return replyhospitalDAO.saveReply(replyVO);
   }

   @Override
   public int updateReply(ReplyHospitalVO replyVO) throws Exception {
      return replyhospitalDAO.updateReply(replyVO);
   }

   @Override
   public int deleteReply(int commentno) throws Exception {
      return replyhospitalDAO.deleteReply(commentno);
   }

}