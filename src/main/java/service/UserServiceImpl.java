package service;

import java.util.List;

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
		if (finduser != null) {
			throw new Exception("이미 가입된 아이디입니다.");
		}
		userDao.insertUser(user);
	}

	// 로그인
	@Override
	public User login(String userId, String pwd) throws Exception {
		User user = userDao.selectUser(userId);
		// 미가입 아이디 오류
		if (user == null) {
			throw new Exception("가입된 아이디가 아닙니다.");
		}
		// 비밀번호 오류
		if (user.getPwd().equals(pwd) == false) {
			throw new Exception("비밀번호가 일치하지 않습니다.");
		}
		return user;
	}

	// userId로 회원 정보 가져오기
	@Override
	public User getUserById(String userId) throws Exception {
		return userDao.selectUser(userId);
	}

	// 회원정보수정
	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	// 아이디 중복체크
	@Override
	public boolean isUserIdDuplicate(String userId) throws Exception {
		User findUser = userDao.selectUser(userId);
		return findUser != null; // 중복이면 true, 아니면 false 반환
	}

	// 닉네임 중복체크
	@Override
	public boolean isNicknameDuplicate(String nickname) throws Exception {
		User findUser = userDao.selectUserByNickname(nickname);
		return findUser != null; // 중복이면 true, 아니면 false 반환
	}

	// 좋아요한 유저
	@Override
	public List<User> findMissionLikeUser(Integer missionIdx) throws Exception {
		return userDao.selectMissionLikeUser(missionIdx);
	}

}
