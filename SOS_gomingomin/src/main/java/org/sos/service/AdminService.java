package org.sos.service;

import org.sos.vo.AdminVO;

public interface AdminService {

	public AdminVO readAdmin(String admin_id) throws Exception;
}
