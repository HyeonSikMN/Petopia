package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {
			
	SqlSession sqlSession;
	public MemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
}
	
	//아이디 중복체크
	public MemberVO checkId(String id) {
		MemberVO vo  = sqlSession.selectOne("m.check_id", id);
		return vo;
	}
	//닉네임 중복체크
	public MemberVO checknickname(String nickname) {
		MemberVO vo  = sqlSession.selectOne("m.check_nickname", nickname);
		return vo;
	}	  
	
	
	
	
	//회원추가
	public int insertUser(MemberVO vo) {
		
		int res = sqlSession.insert("m.insert_user", vo);
		return res;
		
	}
		
	
	//회원 삭제
	public int deleteMember(int idx) {
		
		int res = sqlSession.delete("m.delMember", idx);
		return res;
		
	}
	
	//수정할 회원의 정보 얻어오기
	public MemberVO selectOne(int idx) {
		MemberVO vo = sqlSession.selectOne("m.selectOne", idx);
		return vo;
	}
	
	//회원 정보 수정
	public int update_modify(MemberVO vo) {
		int res = sqlSession.update("m.member_update", vo);
		return res;
	}
	
	//전체 회원목록 조회
	public List<MemberVO> selectAll(){
		List<MemberVO> list = sqlSession.selectList("m.member_list");
		return list;
		}
		
	//로그인
	public MemberVO loginId( String id ) {
		MemberVO vo = sqlSession.selectOne("m.check_id", id);
		return vo;
			}

}
