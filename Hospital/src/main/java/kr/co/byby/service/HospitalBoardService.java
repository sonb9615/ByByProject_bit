package kr.co.byby.service;

import java.util.List;

import kr.co.byby.dto.HospitalBoardVO;

public interface HospitalBoardService {
	//병원게시판 전체조회
	List<HospitalBoardVO> selectAllBoard();
	//병원게시판 게시글작성
	void insertBoard(HospitalBoardVO board);
	//병원게시판 상세글 조회
	HospitalBoardVO detailBoardByNo(int no);
	//병원게시판 게시글 삭제
	void deleteBoardByNo(int no);
	// 병원게시판 게시글 수정
	public void update(HospitalBoardVO board);
}
