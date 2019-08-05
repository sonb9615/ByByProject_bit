package kr.co.byby.service;

import java.util.List;

import kr.co.byby.dto.HospitalBoardVO;

public interface HospitalBoardService {
	List<HospitalBoardVO> selectAllBoard();
	void insertBoard(HospitalBoardVO board);
	HospitalBoardVO detailBoardByNo(int no);
	void deleteBoardByNo(int no);
}
