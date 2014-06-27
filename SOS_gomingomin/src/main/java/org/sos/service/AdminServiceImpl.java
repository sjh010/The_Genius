package org.sos.service;

import javax.inject.Inject;

import org.sos.mapper.AdminMapper;
import org.sos.util.Magi;
import org.sos.vo.AdminVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	AdminMapper adminMapper;
		
	@Override
	public AdminVO readAdmin(String admin_id) throws Exception{
		
		return adminMapper.readAdmin(admin_id);
		
	}

}
