package kr.co.byby.dao;

import java.util.List;

import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalCriteria;

public interface HospitalBoardDAO {
	//병원게시판 조회 서비스
	public List<HospitalBoardVO> selectAll();
	
	//병원게시판 조회 서비스_페이지
	public List<HospitalBoardVO> listPage(HospitalCriteria cri) throws Exception;
	
	//병원게시판 게시물 총 갯수
	public int listCount() throws Exception;
	
	//병원게시판 등록 서비스
	public void insert(HospitalBoardVO board);
	
	//병원게시글 상세조회 서비스
	public HospitalBoardVO selectByNo(int no);
	
	//병원게시글 삭제
	public void delete(int no);
	
	//병원게시글 수정
	public void update(HospitalBoardVO board);
	
	//카테고리 게시글 조회
	public List<HospitalBoardVO> selectCtgBoard(String ctg_name);
}
