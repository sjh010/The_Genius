package org.sos.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sos.mapper.CharacterMapper;
import org.sos.service.CharacterService;
import org.sos.vo.CharacterVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/**/*-context.xml"})
public class CharacterMapperTest {
	
	@Inject
	CharacterMapper characterMapper;
	
	@Inject
	CharacterService characterService;
	
	@Test
	public void testRegist() throws Exception{
		CharacterVO vo = new CharacterVO();
		vo.setCharacter_name("정우성");
		vo.setCharacter_img("http://ssuace.org/h1/b3/");
		vo.setType_adventure(5);
		vo.setType_practice(4);
		vo.setType_rule(3);
		vo.setType_tradition(2);
		vo.setType_enjoyment(6);
		vo.setType_pleasure(1);
		vo.setType_harmony(4);
		characterService.registCharacter(vo);
	}
	
	@Test
	public void testRead() throws Exception{
		CharacterVO vo;
		vo = characterService.readCharacter(10);
		System.out.println(vo.getCharacter_id());
		System.out.println(vo.getCharacter_img());
		System.out.println(vo.getCharacter_name());
		System.out.println(vo.getType_adventure());
		System.out.println(vo.getType_practice());
		System.out.println(vo.getType_rule());
		System.out.println(vo.getType_tradition());
		System.out.println(vo.getType_enjoyment());
		System.out.println(vo.getType_pleasure());
		System.out.println(vo.getType_harmony());
	}
	
	@Test
	public void testUpdate() throws Exception{
		CharacterVO vo = new CharacterVO();
		vo.setCharacter_id(13);
		vo.setCharacter_name("소지섭");
		vo.setCharacter_img("http://bit49.com/");
		vo.setType_adventure(3);
		vo.setType_practice(2);
		vo.setType_rule(5);
		vo.setType_tradition(3);
		vo.setType_enjoyment(5);
		vo.setType_pleasure(2);
		vo.setType_harmony(1);
		
		characterService.updateCharacter(vo);
	}
	
	@Test
	public void testDelete() throws Exception{
		characterService.deleteCharacter(9);
	}
	
}
