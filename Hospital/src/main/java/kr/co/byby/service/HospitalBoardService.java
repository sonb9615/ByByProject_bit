package kr.co.byby.service;

import java.util.List;

import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalCriteria;

public interface HospitalBoardService {
	//병원게시판 전체조회
	List<HospitalBoardVO> selectAllBoard();
	//병원게시판 전체조회_페이지
	public List<HospitalBoardVO> listPage(HospitalCriteria cri) throws Exception;
	//게시판 게시물 총 갯수
	public int listCount() throws Exception;
	//병원게시판 게시글작성
	void insertBoard(HospitalBoardVO board);
	//병원게시판 상세글 조회
	HospitalBoardVO detailBoardByNo(int no);

	//병원게시판 게시글 삭제
	void deleteBoardByNo(int no);
	// 병원게시판 게시글 수정
	public void update(HospitalBoardVO board);
	
	// 카테고리 게시물 조회
	List<HospitalBoardVO> ctgBoard(String ctgName);
}
