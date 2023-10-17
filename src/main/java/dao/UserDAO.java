package dao;

import java.util.List;

import dto.User;

public interface UserDAO {
	// 회원가입
	void insertUser(User user) throws Exception;

	// 회원정보수정
	void updateUser(User user) throws Exception;

	// userId로 user 선택
	User selectUser(String userId) throws Exception;

	// nickname으로 user 선택
	User selectUserByNickname(String nickname) throws Exception;

	// 좋아요한 유저목록 조회 
	List<User> selectMissionLikeUser(Integer missionIdx) throws Exception;
}
