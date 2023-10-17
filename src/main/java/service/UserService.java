package service;

import java.util.List;

import dto.User;

public interface UserService {
	// 회원가입
	void joinUser(User user) throws Exception;

	// 로그인
	User login(String userId, String pwd) throws Exception;

	// 회원정보수정
	void updateUser(User user) throws Exception;

	// 아이디 중복체크
	boolean isUserIdDuplicate(String userId) throws Exception;

	// 닉네임 중복체크
	boolean isNicknameDuplicate(String nickname) throws Exception;

	// 아이디로 회원정보 가져오기
	User getUserById(String userId) throws Exception;

	// 좋아요한 유저
	List<User> findMissionLikeUser(Integer missionIdx) throws Exception;
}
