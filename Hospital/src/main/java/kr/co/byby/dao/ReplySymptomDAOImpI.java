package kr.co.byby.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.byby.dto.ReplyHospitalVO;
import kr.co.byby.dto.ReplySymptomVO;
import kr.co.byby.dto.SymptomBoardVO;

@Repository
public class ReplySymptomDAOImpI implements ReplySymptomDAO{
   
   @Autowired
   private SqlSessionTemplate session;
   
   @Override
   public List<ReplySymptomVO> getReplyList(int no) throws Exception {
      return session.selectList("kr.co.byby.dao.ReplySymptomDAO.getReplyList", no);
   }

   @Override
   public int saveReply(ReplySymptomVO replyVO) throws Exception {
      return session.insert("kr.co.byby.dao.ReplySymptomDAO.saveReply", replyVO);
   }

   @Override
   public int updateReply(ReplySymptomVO replyVO) throws Exception {
      return session.update("kr.co.byby.dao.ReplySymptomDAO.updateReply", replyVO);
   }

   @Override
   public int deleteReply(int commentno) throws Exception {
      return session.delete("kr.co.byby.dao.ReplySymptomDAO.deleteReply", commentno);
   }

}