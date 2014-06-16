package org.sos.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sos.mapper.ResultMapper;
import org.sos.service.ResultService;
import org.sos.vo.ResultVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/**/*-context.xml"})
public class ResultMapperTest {

	@Inject
	ResultMapper resultMapper;
	
	@Inject
	ResultService resultService;
	
	@Test
	public void testReadUserScore() throws Exception{
		List<ResultVO> list = resultService.readUserScore("thgns");
		
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i).toString());
		}
	
	}
}
