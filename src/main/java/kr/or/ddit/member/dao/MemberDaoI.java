package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.member.model.MemberVO;
public interface MemberDaoI {
	
	// 해당 멤버정보
	MemberVO getMember(String userId);
	
	

}
