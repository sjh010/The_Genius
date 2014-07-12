package org.sos.service;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.sos.mapper.CharacterMapper;
import org.sos.vo.CharacterVO;
import org.sos.vo.FileVO;
import org.springframework.stereotype.Service;

@Service
public class CharacterServiceImpl implements CharacterService {
	
	@Inject
	CharacterMapper characterMapper ;

	@Override
	public void registCharacter(CharacterVO vo) throws Exception {
		// TODO Auto-generated method stub
		characterMapper.registCharacter(vo);
	}

	@Override
	public CharacterVO readCharacter(int character_id) throws Exception {
		// TODO Auto-generated method stub
		CharacterVO vo;
		vo = characterMapper.readCharacter(character_id);
		
		return vo;
	}
	
	@Override
	public List<CharacterVO> readCharacterList(int pageNum) throws Exception {
		// TODO Auto-generated method stub
		return characterMapper.readCharacterList(pageNum);
	}

	@Override
	public List<CharacterVO> readAllCharacterList() throws Exception {
		// TODO Auto-generated method stub
		return characterMapper.readAllCharacterList();
	}

	@Override
	public void updateCharacter(CharacterVO vo) throws Exception {
		// TODO Auto-generated method stub
		characterMapper.updateCharacter(vo);
	}

	@Override
	public void deleteCharacter(int character_id) throws Exception {
		// TODO Auto-generated method stub
		characterMapper.deleteCharacter(character_id);
	}

	@Override
	public void registFile(FileVO file) throws Exception {
		// TODO Auto-generated method stub

		
	}

	@Override
	public List<CharacterVO> readSexCharacterList(String user_sex)
			throws Exception {
		// TODO Auto-generated method stub
		return characterMapper.readSexCharacterList(user_sex);
	}
	
	




}
