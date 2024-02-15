package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;
import vo.QaVO;

public class ContentDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 새 글 추가
	public int insertContent(String content) { 

		int res = sqlSession.insert("b.content_insert", content);
		return res;
	}

	public List<QaVO> selectContentList() {
		List<QaVO> contentlist = sqlSession.selectList("b.content_list");
		return contentlist; // DB에서 얻어낸 List를 반환
	}

}
