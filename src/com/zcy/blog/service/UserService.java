package com.zcy.blog.service;

import java.util.List;

import com.zcy.blog.model.BlogUser;
import com.zcy.blog.model.User;
import com.zcy.blog.model.UserHobbyKey;

public interface UserService {
	public User getUserById(long userId);
//	根据用户名查找用户
	public BlogUser getBlogUserByUserName(String userName);
//	根据邮箱查找用户
	public BlogUser getBlogUserByEmail(String email);
//	注册用户插入用户信息
	public int insertIntoBlogUser(BlogUser blogUser);
//	根据id修改用户信息
	public int updateBlogUser(BlogUser blogUser);
//	关联查询用户信息(包含用户发表的博客)
	public BlogUser getBlogUserInfo(Integer userId);
//	根据id查找用户
	public BlogUser selectByPid(Integer id);
//	批量插入用户爱好
	public int insertBatchUserHobby(List<UserHobbyKey> userHobbyList);
}
