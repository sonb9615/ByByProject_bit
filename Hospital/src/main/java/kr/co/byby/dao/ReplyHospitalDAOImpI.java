package kr.co.byby.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.byby.dto.ReplyHospitalVO;

@Repository
public class ReplyHospitalDAOImpI implements ReplyHospitalDAO{
   
   @Autowired
   private SqlSessionTemplate session;
   
   @Override
   public List<ReplyHospitalVO> getReplyList(int no) throws Exception {
      return session.selectList("kr.co.byby.dao.ReplyHospitalDAO.getReplyList", no);
   }

   @Override
   public int saveReply(ReplyHospitalVO replyVO) throws Exception {
      return session.insert("kr.co.byby.dao.ReplyHospitalDAO.saveReply", replyVO);
   }

   @Override
   public int updateReply(ReplyHospitalVO replyVO) throws Exception {
      return session.update("kr.co.byby.dao.ReplyHospitalDAO.updateReply", replyVO);
   }

   @Override
   public int deleteReply(int commentno) throws Exception {
      return session.delete("kr.co.byby.dao.ReplyHospitalDAO.deleteReply", commentno);
   }

}