package org.sos.service;

import org.sos.vo.UserCharacterVO;

public interface UserCharacterService {

	public void registUserCharacter(UserCharacterVO vo) throws Exception;
	
	public UserCharacterVO readUserCharacter(String user_id) throws Exception;
	
	public void updateUserCharacter(UserCharacterVO vo) throws Exception;
	
	public void deleteUserCharacter(String user_id) throws Exception;
	
}
