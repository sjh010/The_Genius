package org.sos.test;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sos.mapper.UserMapper;
import org.sos.service.UserService;
import org.sos.vo.UserVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/**/*-context.xml"})

public class UserMapperTest {
	
	@Inject
	UserMapper userMapper;
	
	@Inject
	UserService userService;
	
	
	@Test
	public void testRegist() throws Exception{
		UserVO vo = new UserVO();
		vo.setUser_id("thgnss");
		vo.setUser_password("1234");
		vo.setUser_name("����");
		vo.setUser_birth("1985-11-19");
		vo.setUser_sex("F");
		vo.setUser_addr("����� ���ϱ� ��õ�� 412-1");
		vo.setUser_email("thgns@hanmail.net");
		vo.setUser_mobile("010-9135-8519");
		vo.setUser_phone("010-9135-8519");
		userService.registUser(vo);
	}
	
	@Test
	public void testRead() throws Exception{
		UserVO vo;
		vo = userService.readUser("thgns");
		System.out.println(vo.getUser_id());
		System.out.println(vo.getUser_password());
		System.out.println(vo.getUser_name());
		System.out.println(vo.getUser_birth());
		System.out.println(vo.getUser_sex());
		System.out.println(vo.getUser_addr());
		System.out.println(vo.getUser_email());
		System.out.println(vo.getUser_mobile());
		System.out.println(vo.getUser_phone());
	}
	
	@Test
	public void testUpdate() throws Exception{
		UserVO vo = new UserVO();
		vo.setUser_id("thgns");
		vo.setUser_password("5678");
		vo.setUser_name("����");
		vo.setUser_birth("1985-11-19");
		vo.setUser_sex("F");
		vo.setUser_addr("����� ���ϱ� ��õ�� 412-1");
		vo.setUser_email("thgns@hanmail.net");
		vo.setUser_mobile("010-9135-8519");
		vo.setUser_phone("010-9135-8519");
		userService.updateUser(vo);
	}
	
	@Test
	public void testDelete() throws Exception{
		userService.deleteUser("thgns");
	}
	
}
