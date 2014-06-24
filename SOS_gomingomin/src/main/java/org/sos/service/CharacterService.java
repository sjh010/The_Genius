package org.sos.service;

import java.util.List;

import org.sos.vo.CharacterVO;
import org.sos.vo.FileVO;

public interface CharacterService {

	public void registCharacter(CharacterVO vo) throws Exception;
	
	public CharacterVO readCharacter(int character_id) throws Exception;
	
	public List<CharacterVO> readCharacterList(int pageNum) throws Exception;
	
	public List<CharacterVO> readAllCharacterList() throws Exception;
	
	public void updateCharacter(CharacterVO vo) throws Exception;
	
	public void deleteCharacter(int character_id) throws Exception;

	public void registFile(FileVO file) throws Exception;
	
}
