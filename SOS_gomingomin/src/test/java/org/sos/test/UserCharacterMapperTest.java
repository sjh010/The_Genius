package org.sos.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sos.mapper.UserCharacterMapper;
import org.sos.service.UserCharacterService;
import org.sos.vo.UserCharacterVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/**/*-context.xml"})
public class UserCharacterMapperTest {

	@Inject
	UserCharacterMapper userCharacterMapper;
	
	@Inject
	UserCharacterService userCharacterService;
	
	@Test
	public void testRegist() throws Exception{
		UserCharacterVO vo = new UserCharacterVO();
		vo.setUser_id("thgns");
		vo.setUser_character1(10);
		vo.setUser_character2(11);
		vo.setUser_character3(12);
		
		userCharacterService.registUserCharacter(vo);
	}
	
	@Test
	public void testRead() throws Exception{
		UserCharacterVO vo;
		vo = userCharacterService.readUserCharacter("thgns");
		System.out.println(vo.getUser_id());
		System.out.println(vo.getUser_character1());
		System.out.println(vo.getUser_character2());
		System.out.println(vo.getUser_character3());
		
	}
	
	@Test
	public void testUpdate() throws Exception{
		UserCharacterVO vo = new UserCharacterVO();
		vo.setUser_id("thgns");
		vo.setUser_character1(13);
		vo.setUser_character2(14);
		vo.setUser_character3(15);
		userCharacterService.updateUserCharacter(vo);
		
	}
	
	@Test
	public void testDelete() throws Exception{
		userCharacterService.deleteUserCharacter("thgns");
	}

}