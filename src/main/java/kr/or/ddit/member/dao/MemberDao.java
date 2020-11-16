package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.model.PageVO;

@Repository("memberRepository")
public class MemberDao implements MemberDaoI{


	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public MemberVO getMember(String userId) {
		

//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		MemberVO memberVo = sqlSession.selectOne("member.getMember", userId);
//		sqlSession.close();
		return memberVo;
	}

	@Override
	public List<MemberVO> selectAllMember() {
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		List<MemberVO> memlist = sqlSession.selectList("member.selectAllMember");
		
		//sqlSession.commit(); // select문은 별도의 영향을 주지않기때문에 commit을 하지 않고 종료해도 된다.
//		sqlSession.close();
		return memlist;
	}

	@Override
	public List<MemberVO> getAllpage(Map<String, Integer> map) {
		
		//sqlSession.commit(); // select문은 별도의 영향을 주지않기때문에 commit을 하지 않고 종료해도 된다.
		return sqlSession.selectList("member.getAllpage", map);
	}

	@Override
	public int selectMemberCount() {	

		return sqlSession.selectOne("member.selectMemberCount");
	}

	@Override
	public List<MemberVO> selectAllMemberPage(PageVO pagevo) {
		
		//sqlSession.commit(); // select문은 별도의 영향을 주지않기때문에 commit을 하지 않고 종료해도 된다.
		
		return sqlSession.selectList("member.selectAllMemberPage", pagevo);
	}

	@Override
	public int inserMember(MemberVO memberVo) {
		
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int insertCnt = 0;
//		try {
			insertCnt = sqlSession.insert("member.insertMember", memberVo);			
//		}catch (Exception e) {
			
//		}
		
		// 변경이 발생된 트랜잭션은 명시적으로 끝내주어야한다.
//		if(insertCnt == 1) { // 정상적으로 insert가 되었으면 commit
//			sqlSession.commit();
//		}else { // insert가 되지 않았으면 rollback
//			sqlSession.rollback();
//		}
		
//		sqlSession.close();
		
		return insertCnt;
	}

	@Override
	public int deleteMember(String userid) {
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int deleteCnt = sqlSession.delete("member.deleteMember", userid);
//		if(deleteCnt == 1) {
//			sqlSession.commit();
//		}else {
//			sqlSession.rollback();
//		}
//		sqlSession.close();
		return deleteCnt;
	}

	@Override
	public int updateMember(MemberVO memberVo) {
//		SqlSession sqlSession = MybatisUtil.getSqlSession();
		int updateCnt = sqlSession.update("member.updateMember", memberVo);
//		System.out.println("updateCnt :: " + updateCnt);
//		if(updateCnt == 1) {
//			sqlSession.commit();
//		}else {
//			sqlSession.rollback();
//		}
//		sqlSession.close();
		return updateCnt;
	}

}
