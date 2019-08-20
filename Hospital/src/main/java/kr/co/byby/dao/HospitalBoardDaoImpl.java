package kr.co.byby.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.byby.dto.BoardFileVO;
import kr.co.byby.dto.HospitalBoardVO;
import kr.co.byby.dto.HospitalCriteria;

@Repository
public class HospitalBoardDaoImpl implements HospitalBoardDAO{
	
	@Autowired
	private SqlSessionTemplate session;

	public List<HospitalBoardVO> selectAll() {
		List<HospitalBoardVO> hospitalboardList = session.selectList("kr.co.byby.dao.HospitalBoardDAO.selectAll");
		return hospitalboardList;
	}
	
	/* 게시판 첨부파일 등록 */
	public int insertBoardFile(BoardFileVO boardFile) {
		return session.insert("kr.co.byby.dao.HospitalBoardDAO.insertBoardFile", boardFile);
	}
	
	@Override
	   public int listCgCount(String ctg_name) throws Exception {
	      return session.selectOne("kr.co.byby.dao.HospitalBoardDAO.listCgCount", ctg_name);
	   }

	public List<HospitalBoardVO> selectCtgBoard( HospitalCriteria cri) {
	      List<HospitalBoardVO> ctgBoardList = session.selectList("kr.co.byby.dao.HospitalBoardDAO.selectCtgBoard", cri);
	      return ctgBoardList;
	   }


	public void insert(HospitalBoardVO board) {
		session.insert("kr.co.byby.dao.HospitalBoardDAO.insert",board);
		
	}

	public HospitalBoardVO selectByNo(int no) {
		HospitalBoardVO hospital = session.selectOne("kr.co.byby.dao.HospitalBoardDAO.selectByNo",no);
		return hospital;
	}

	public void delete(int no) {
		session.delete("kr.co.byby.dao.HospitalBoardDAO.deleteByNo", no);
		
	}

	@Override
	public void update(HospitalBoardVO board) {
		session.update("kr.co.byby.dao.HospitalBoardDAO.update", board);
		
	}

	@Override
	public List<HospitalBoardVO> listPage(HospitalCriteria cri) throws Exception {
		List<HospitalBoardVO> hospitalboardListPage = session.selectList("kr.co.byby.dao.HospitalBoardDAO.listPage", cri);
		return hospitalboardListPage;
	}

	@Override
	public int listCount() throws Exception {
		return session.selectOne("kr.co.byby.dao.HospitalBoardDAO.listCount");
	}

	
	 @Override
	   public void increaseViewcnt(int no) {
	       session.update("kr.co.byby.dao.HospitalBoardDAO.increaseViewcnt", no);
	      
	   }
	 
	 /* 첨부파일 삭제 */
	   public int deleteBoardFile(BoardFileVO boardFile) {
	      return session.update("kr.co.byby.dao.HospitalBoardDAO.deleteBoardFile", boardFile);
	   }
	   
	 //게시판 파일 수정 
	   public int insertBoardFileUpdate(BoardFileVO boardFile) {
	      return session.insert("kr.co.byby.dao.HospitalBoardDAO.insertBoardFileUpdate", boardFile);
	   }
}
