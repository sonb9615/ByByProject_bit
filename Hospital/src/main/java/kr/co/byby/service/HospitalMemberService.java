package kr.co.byby.service;

import java.util.List;

import kr.co.byby.dto.HospitalMemberVO;

public interface HospitalMemberService {

	void insertMember(HospitalMemberVO member);

	int checkIdSignUp(String memberid);

	// 개인정보 상세조회
	HospitalMemberVO detailBoardById(String memberid);

	// 개인정보수정
	public void updateMember(HospitalMemberVO member);
}
