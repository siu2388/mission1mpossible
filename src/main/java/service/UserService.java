package service;

import dto.User;

public interface UserService {
	void joinUser(User user) throws Exception;

	User login(String userId, String pwd) throws Exception;

}
