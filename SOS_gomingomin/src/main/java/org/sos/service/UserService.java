package org.sos.service;

import java.util.List;

import org.sos.vo.UserVO;

public interface UserService {
	
	public void registUser(UserVO vo) throws Exception;
	
	public UserVO readUser(String user_id) throws Exception;
	
	public List<UserVO> readUserList(int pageNo) throws Exception;
	
	public void updateUser(UserVO vo) throws Exception;
	
	public void deleteUser(String user_id) throws Exception;

}
