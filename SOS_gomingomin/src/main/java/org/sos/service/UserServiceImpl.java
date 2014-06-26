package org.sos.service;

import java.util.List;

import javax.inject.Inject;

import org.sos.mapper.UserMapper;
import org.sos.vo.PagingVO;
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
		
		return userMapper.readUser(user_id);
	}
	
	@Override
	public List<UserVO> readUserList(int pageNo) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.readUserList(pageNo);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateUser(vo);
	}
	
	@Override
	public void updateUserGrade(UserVO userVo)
			throws Exception {
		System.out.println(userVo.toString());
		// TODO Auto-generated method stub
		userMapper.updateUserGrade(userVo);
		
	}

	@Override
	public void deleteUser(String user_id) throws Exception {
		// TODO Auto-generated method stub
		userMapper.deleteUser(user_id);
	}


	@Override
	public PagingVO calcPaging(int pageNo) {
		// TODO Auto-generated method stub
		PagingVO pagingVo = new PagingVO();
		pagingVo.setTotalPage(userMapper.getTotalCnt());
		pagingVo.setPageNo(pageNo);
		return pagingVo;
	}

	
}
