package kr.co.byby.dao;

import java.util.List;

import kr.co.byby.dto.BoardFileVO;
import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalCriteria;
import kr.co.byby.dto.SymptomBoardVO;

public interface SymptomBoardDAO {
	//병원게시판 조회 서비스
	public List<SymptomBoardVO> selectAll();
	
	//병원게시판 조회 서비스_페이지
	public List<SymptomBoardVO> listPage(HospitalCriteria cri) throws Exception;
	
	//병원게시판 게시물 총 갯수
	public int listCount() throws Exception;
	
	//병원게시판 등록 서비스
	public void insert(SymptomBoardVO board);
	
	//병원게시글 상세조회 서비스
	public SymptomBoardVO selectByNo(int no);
	
	//병원게시글 삭제
	public void delete(int no);
	
	//병원게시글 수정
	public void update(SymptomBoardVO board);
	
	//게시판 파일업로드
	public int insertBoardFile(BoardFileVO boardFile);
	
	//카테고리별 게시글 갯수
	   public int listCgCount(String ctg_name) throws Exception;
	   
	//카테고리 게시글 조회
	   public List<SymptomBoardVO> selectCtgBoard(HospitalCriteria cri)throws Exception;
	
	   // 병원게시글 조회수 증가
	   public void increaseViewcnt(int no);
	   
	   //파일삭제
	   public int deleteBoardFile(BoardFileVO boardFile);
	   
	 //게시판 파일 수정 
	   public int insertBoardFileUpdate(BoardFileVO boardFile);

}
