package kr.co.byby.dao;

import java.util.List;

import kr.co.byby.dto.HospitalBoardVO;

public interface HospitalBoardDAO {
	//병원게시판 조회 서비스
	public List<HospitalBoardVO> selectAll();
	
	//병원게시판 등록 서비스
	public void insert(HospitalBoardVO board);
	
	//병원게시글 상세조회 서비스
	public HospitalBoardVO selectByNo(int no);
	
	//병원게시글 삭제
	public void delete(int no);
}
