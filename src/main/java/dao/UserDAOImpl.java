package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.User;
import util.MybatisSqlSessionFactory;

public class UserDAOImpl implements UserDAO {

	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public void insertUser(User user) throws Exception {
		sqlSession.insert("mapper.user.insertUser", user);
		sqlSession.commit();
	}

	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("mapper.user.updateUser", user);
		sqlSession.commit();
	}

	@Override
	public User selectUser(String userId) throws Exception {
		User user = sqlSession.selectOne("mapper.user.selectUser", userId);
		return user;
	}

	@Override
	public User selectUserByNickname(String nickname) throws Exception {
		User user = sqlSession.selectOne("mapper.user.selectUserByNickname", nickname);
		return user;
	}

	// 좋아요한 유저 목록 조회 
	@Override
	public List<User> selectMissionLikeUser(Integer missionIdx) throws Exception {
		return sqlSession.selectList("mapper.user.selectMissionLikeUser", missionIdx);
	}
}
