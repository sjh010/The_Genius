package org.sos.service;

import java.util.List;

import org.sos.vo.ResultVO;

public interface ResultService {

	public List<ResultVO> readUserScore(String user_id) throws Exception;
	
}
