package service;

import dao.UserDAO;
import dao.UserDAOImpl;
import dto.User;

public class UserServiceImpl implements UserService {

	private UserDAO userDao;

	public UserServiceImpl() {
		userDao = new UserDAOImpl();
	}

	// 회원가입
	@Override
	public void joinUser(User user) throws Exception {
		// 중복가입 체크
		User finduser = userDao.selectUser(user.getUserId());
		if (finduser != null)
			throw new Exception("가입된 아이디입니다.");

		userDao.insertUser(user);

	}

	// 로그인
	@Override
	public User login(String userId, String pwd) throws Exception {
		User user = userDao.selectUser(userId);
		// 미가입. 아이디오류
		if (user == null) {
			throw new Exception("가입된 아이디가 아닙니다.");
		}
		// 비번오류
		if (user.getPwd().equals(pwd) == false) {
			throw new Exception("비번오류");
		}
		return user;

	}

}
