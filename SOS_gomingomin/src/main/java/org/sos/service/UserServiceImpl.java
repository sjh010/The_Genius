package org.sos.service;

import javax.inject.Inject;

import org.sos.mapper.UserMapper;
import org.sos.vo.UserVO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserMapper userMapper ;
	
	@Override
	public void registUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		userMapper.registUser(vo);	
	}

	@Override
	public UserVO readUser(String user_id) throws Exception {
		// TODO Auto-generated method stub
		UserVO vo;
		vo = userMapper.readUser(user_id);
		
		return vo;
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateUser(vo);
	}

	@Override
	public void deleteUser(String user_id) throws Exception {
		// TODO Auto-generated method stub
		userMapper.deleteUser(user_id);
	}
	
}
