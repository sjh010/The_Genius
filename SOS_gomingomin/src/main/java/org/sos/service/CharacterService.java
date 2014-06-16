package org.sos.service;

import org.sos.vo.CharacterVO;

public interface CharacterService {

	public void registCharacter(CharacterVO vo) throws Exception;
	
	public CharacterVO readCharacter(int character_id) throws Exception;
	
	public void updateCharacter(CharacterVO vo) throws Exception;
	
	public void deleteCharacter(int character_id) throws Exception;
	
}
