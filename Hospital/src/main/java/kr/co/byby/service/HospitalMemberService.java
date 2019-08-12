package kr.co.byby.service;

import java.util.List;

import kr.co.byby.dto.HospitalMemberVO;

public interface HospitalMemberService {
	
	//회원가입
	void insertMember(HospitalMemberVO member);

<<<<<<< HEAD
	//개인정보 상세조회
	HospitalMemberVO detailBoardById(String memberid);
	
	//개인정보수정
	public void updateMember(HospitalMemberVO member);

=======
	int checkIdSignUp(String memberid);
>>>>>>> origin/yejin
}
