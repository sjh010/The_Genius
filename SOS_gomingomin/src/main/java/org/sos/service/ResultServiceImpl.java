package org.sos.service;

import java.util.List;

import javax.inject.Inject;

import org.sos.mapper.ResultMapper;
import org.sos.vo.ResultVO;
import org.springframework.stereotype.Service;

@Service
public class ResultServiceImpl implements ResultService {

	@Inject 
	ResultMapper resultMapper;
	
	@Override
	public List<ResultVO> readUserScore(String user_id) throws Exception {
		// TODO Auto-generated method stub
		List<ResultVO> list;
		
		list = resultMapper.readUserScore(user_id);
		
		return list;
	}

}
