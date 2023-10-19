package dao;

import java.util.Map;

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

	@Override
	public User selectOtherUserByNickname(Map<String, Object> params) throws Exception {
		return sqlSession.selectOne("mapper.user.selectOtherUserByNickname", params);
	}
}
