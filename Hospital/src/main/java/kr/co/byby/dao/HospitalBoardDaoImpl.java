package kr.co.byby.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	
	
	
	
}
