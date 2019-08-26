package kr.co.byby.service;

import java.util.List;

import kr.co.byby.dto.ReplyHospitalVO;

public interface ReplyHospitalService {
   
   //댓글리스트
   public List<ReplyHospitalVO> getReplyList(int no) throws Exception;
   
   //댓글 등록
   public int saveReply(ReplyHospitalVO replyVO) throws Exception;

   //댓글 수정
   public int updateReply(ReplyHospitalVO replyVO) throws Exception;

   //댓글 삭제
   public int deleteReply(int commentno) throws Exception;

}