package kr.or.ddit.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVO;

@Service("memberService")
public class MemberService implements MemberServiceI {
	
	@Resource(name="memberRepository")
	private MemberDaoI memberDao;
	
	
	public MemberService() {
//		memberDao = new MemberDao();
	}
	
	@Override
	public MemberVO getMember(String userId) {
		
		return memberDao.getMember(userId);
	}

	
	
	
	
}
