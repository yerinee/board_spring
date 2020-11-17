package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.model.MemberVO;

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

	

}
