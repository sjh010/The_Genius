package org.sos.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sos.mapper.AdminMapper;
import org.sos.vo.AdminVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/**/*-context.xml"})
public class AdminMapperTest {
	
	@Inject
	AdminMapper adminMapper;
	
	@Test
	public void readTest(){
		
		AdminVO admin = adminMapper.readAdmin("admin");
		
		System.out.println(admin.toString());
	}

}
