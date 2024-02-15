package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GpVO;

public class GpDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 쇼핑채널 메인화면 && 쇼핑채널 전체 상품 조회
	public List<GpVO> selectList() {
		List<GpVO> list = sqlSession.selectList("g.gp_list");
		return list;
	}
	// 쇼핑채널 메인화면 && 사료 상품 조회
		public List<GpVO> selectfeedList() {
			List<GpVO> feedlist = sqlSession.selectList("g.gp_feedlist");
			return feedlist;
		}
		public List<GpVO> selectleashList() {
			List<GpVO> leashlist = sqlSession.selectList("g.gp_leashlist");
			return leashlist;
		}
		public List<GpVO> selectpadList() {
			List<GpVO> padlist = sqlSession.selectList("g.gp_padlist");
			return padlist;
		}
		public List<GpVO> selectclothList() {
			List<GpVO> clothlist = sqlSession.selectList("g.gp_clothlist");
			return clothlist;
		}
	// 관리자 상품 추가
	public int addProduct(GpVO vo) {

		/*
		 * System.out.println(vo.getCategory()); System.out.println(vo.getFilename());
		 * System.out.println(vo.getPopularity()); System.out.println(vo.getPrice());
		 * System.out.println(vo.getProductdetail());
		 * System.out.println(vo.getProductname()); System.out.println(vo.getSpecies());
		 */

		int res = sqlSession.insert("g.gp_addproduct", vo);
		return res;
	}

	// 관리자 상품 삭제
	public int deleteProduct(int pid) {
		int res = sqlSession.delete("g.gp_delete", pid);
		return res;
	}

	//삭제 전 파일명 가져오기
	public GpVO selectOne(int pid) {
		GpVO vo = sqlSession.selectOne("g.gp_delete_filename",pid);
		return vo;
	}
	
	// 관리자 상품 수정
	public int update_modify(GpVO vo) {
		vo.getPid();
		vo.getCategory();
		vo.getRegdate();
		vo.getFilename();
		vo.getProductname();
		vo.getProductdetail();
		vo.getPopularity();
		vo.getPrice();
		vo.getSpecies();
		
		 System.out.println(vo.getCategory()); 
		 System.out.println(vo.getFilename());
		 System.out.println(vo.getPopularity()); 
		 System.out.println(vo.getPrice());
		 System.out.println(vo.getProductdetail());
		 System.out.println(vo.getProductname()); 
		 System.out.println(vo.getSpecies());
		 System.out.println(vo.getPid());
		int res = sqlSession.update("g.gp_modify", vo);
		return res;

	}
}
// 쇼핑채널 메인화면 && 쇼핑채널 전체 상품 조회

// 관리자모드 메인화면

// 관리자모드 상품 추가

// 관리자모드 상품 수정

// 관리자모드 상품 삭제
