package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 게시판 메인페이지 표시
	public String showMainpage() {
		return "board_main";
	}

	// 글 목록 표시
	public List<BoardVO> selectList() {
		List<BoardVO> list = sqlSession.selectList("b.post_list");
		return list; // DB에서 얻어낸 List를 반환
	}

	// 글 목록 표시
	public List<BoardVO> selectQuestionList() {
		List<BoardVO> qalist = sqlSession.selectList("b.question_list");
		return qalist; // DB에서 얻어낸 List를 반환
	}

	// 다이어리 글 목록 표시
	public List<BoardVO> selectDiaryList() {
		List<BoardVO> dilist = sqlSession.selectList("b.diary_list");
		return dilist; // DB에서 얻어낸 List를 반환
	}

	// 새 글 추가
	public int insertUser(BoardVO vo) {

		System.out.println(vo.getSection());
		// 맵퍼에게 vo 전달
		// 맵퍼로 전달되는 파라미터 값은 무조건 한 개
		int res = sqlSession.insert("b.board_insert", vo);
		return res;
	}

	// 새 글 추가
	public int qainsertUser(BoardVO vo) {

		System.out.println(vo.getSection());
		// 맵퍼에게 vo 전달
		// 맵퍼로 전달되는 파라미터 값은 무조건 한 개
		int res = sqlSession.insert("b.question_insert", vo);
		return res;
	}

	// 다이어리 글 추가
	public int diinsertUser(BoardVO vo) {

		// 맵퍼에게 vo 전달
		// 맵퍼로 전달되는 파라미터 값은 무조건 한 개
		int res = sqlSession.insert("b.board_insert_diary", vo);
		return res;
	}

	// 게시물 글 자세히
	public BoardVO select_po(int idx) {
		BoardVO vo = sqlSession.selectOne("b.select_po", idx);
		return vo;
	}

	// qa 글 자세히
	public BoardVO select_qa(int qaidx) {
		BoardVO vo = sqlSession.selectOne("b.select_qa", qaidx);
		return vo;
	}

	// 다이어리 글 자세히
	public BoardVO selectOne(int diidx) {
		return sqlSession.selectOne("b.selectOne", diidx);
	}

	// post 글 삭제
	public int delPo(int idx) {
		int res = sqlSession.delete("b.post_delete", idx);
		return res;
	}

	// diary 글 삭제
	public int delDi(int diidx) {
		int res = sqlSession.delete("b.diary_delete", diidx);
		return res;
	}
	
	public int delQa(int qaidx) {
		int res = sqlSession.delete("b.question_delete", qaidx);
		return res;
	}

	// post 수정
	public int update_modify(BoardVO vo) {
		int res = sqlSession.update("b.post_update", vo);
		return res;
	}
	
	// diary 글 수정
	public int update_modifydi(BoardVO vo) {
		int res = sqlSession.update("b.diary_update", vo);
		return res;
		}
}
