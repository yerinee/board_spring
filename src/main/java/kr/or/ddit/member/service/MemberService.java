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
import kr.or.ddit.member.model.PageVO;

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

	@Override
	public List<MemberVO> selectAllMember() {

		return memberDao.selectAllMember();
	}
	
	// Map 새로 만들어서 pageSize와 pages를 정의할 경우
	@Override
	public Map<String , Object> getAllpage(Map<String, Integer> map) {
	
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		map2.put("memberList", memberDao.getAllpage( map));
		
		int totalCnt = memberDao.selectMemberCount();
		int pages = (int)Math.ceil((double)totalCnt/ map.get("pageSize"));
		map2.put("pages", pages);

		return map2;
	}

	
	// PageVO를 새로 만들어서 pageSize와 pages를 정의할 경우
	@Override
	public Map<String, Object> selectMemberPageList(PageVO pagevo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberList", memberDao.selectAllMemberPage(pagevo));
		int totalCnt = memberDao.selectMemberCount();
		int pages = (int)Math.ceil((double)totalCnt/ pagevo.getPageSize());
		map.put("pages", pages);
		
		return map;
	}

	@Override
	public int inserMember(MemberVO memberVo) {
		
		return memberDao.inserMember(memberVo);
	}

	@Override
	public int deleteMember(String userid) {
		return 0;
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		
		return memberDao.updateMember(memberVo);
	}

	
	
	
}