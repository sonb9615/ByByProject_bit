package kr.co.byby.service;

import java.io.IOException;
import java.util.List;

import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalCriteria;
import kr.co.byby.dto.SymptomBoardVO;

public interface SymptomBoardService {
	// 병원게시판 전체조회
	List<SymptomBoardVO> selectAllBoard();

	// 병원게시판 전체조회_페이지
	public List<SymptomBoardVO> listPage(HospitalCriteria cri) throws Exception;

	// 게시판 게시물 총 갯수
	public int listCount() throws Exception;

	// 병원게시판 게시글작성
	void insertBoard(SymptomBoardVO board);

	// 병원게시판 상세글 조회
	SymptomBoardVO detailBoardByNo(int no);

	// 병원게시판 게시글 삭제
	void deleteBoardByNo(int no);

	// 병원게시판 게시글 수정
	public void update(SymptomBoardVO board);

	// 카테고리당 게시물 갯수
	public int listCgCount(String ctg_name) throws Exception;

	// 카테고리 게시물 조회
	List<SymptomBoardVO> ctgBoard(HospitalCriteria cri) throws Exception;

	// 병원게시판 조회수 증가
	   public void increaseViewcnt(int no);
}
