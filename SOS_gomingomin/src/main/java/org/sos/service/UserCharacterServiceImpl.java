package org.sos.service;

import javax.inject.Inject;

import org.sos.mapper.UserCharacterMapper;
import org.sos.vo.UserCharacterVO;
import org.springframework.stereotype.Service;

@Service
public class UserCharacterServiceImpl implements UserCharacterService {

	@Inject
	UserCharacterMapper userCharacterMapper;
	
	@Override
	public void registUserCharacter(UserCharacterVO vo) throws Exception {
		// TODO Auto-generated method stub
		userCharacterMapper.registUserCharacter(vo);
		
	}

	@Override
	public UserCharacterVO readUserCharacter(String user_id) throws Exception {
		// TODO Auto-generated method stub
		UserCharacterVO vo;
		vo = userCharacterMapper.readUserCharacter(user_id);
		
		return vo;
		
	}

	@Override
	public void updateUserCharacter(UserCharacterVO vo) throws Exception {
		// TODO Auto-generated method stub
		userCharacterMapper.updateUserCharacter(vo);
		
	}

	@Override
	public void deleteUserCharacter(String user_id) throws Exception {
		// TODO Auto-generated method stub
		userCharacterMapper.deleteUserCharacter(user_id);
		
	}

}