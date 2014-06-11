package org.sos.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sos.vo.UserVO;

public interface UserMapper {
	@Insert("insert into tbl_user(user_id, user_password, user_name, user_birth, user_sex, user_addr, user_email, user_mobile, user_phone)"
			+" values("
			+ "#{user_id},"
			+ "#{user_password},"
			+ "#{user_name},"
			+ "#{user_birth},"
			+ "#{user_sex},"
			+ "#{user_addr},"
			+ "#{user_email},"
			+ "#{user_mobile},"
			+ "#{user_phone})")
	public void registUser(UserVO vo);
	
	@Select("select user_id, user_password, user_name, user_birth, user_sex, user_addr, user_email, user_mobile, user_phone"
			+ " from tbl_user"
			+ " where user_id = #{user_id}")
	public UserVO readUser(String user_id);
	
	@Update("update tbl_user set"
			+ " user_password = #{user_password},"
			+ " user_name = #{user_name},"
			+ " user_birth = #{user_birth},"
			+ " user_sex = #{user_sex},"
			+ " user_addr = #{user_addr},"
			+ " user_email = #{user_email},"
			+ " user_mobile = #{user_mobile},"
			+ " user_phone = #{user_phone}")
	public void updateUser(UserVO user_id);
	
	@Delete("delete from tbl_user where user_id = #{user_id}")
	public void deleteUser(String user_id);
	
	
}
