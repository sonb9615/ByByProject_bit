package kr.co.byby.service;

import java.util.List;

import kr.co.byby.dto.ReplyHospitalVO;
import kr.co.byby.dto.ReplySymptomVO;

public interface ReplySymptomService {
   
   //댓글리스트
   public List<ReplySymptomVO> getReplyList(int no) throws Exception;
   
   //댓글 등록
   public int saveReply(ReplySymptomVO replyVO) throws Exception;

   //댓글 수정
   public int updateReply(ReplySymptomVO replyVO) throws Exception;

   //댓글 삭제
   public int deleteReply(int commentno) throws Exception;

}