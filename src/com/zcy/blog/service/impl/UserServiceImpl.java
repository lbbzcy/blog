package com.zcy.blog.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zcy.blog.dao.BlogUserMapper;
import com.zcy.blog.dao.UserHobbyMapper;
import com.zcy.blog.dao.UserMapper;
import com.zcy.blog.model.BlogUser;
import com.zcy.blog.model.User;
import com.zcy.blog.model.UserHobbyKey;
import com.zcy.blog.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userDao;
	@Resource
	private UserHobbyMapper userHobbyDao;
	@Resource 
	private BlogUserMapper blogUserDao;
	@Override
	public User getUserById(long userId) {
		return userDao.selectByPrimaryKey(userId);
	}
	/**
	 * 根据用户名查找用户
	 */
	@Override
	public BlogUser getBlogUserByUserName(String userName) {
		return blogUserDao.selectByUserName(userName);
	}
	/**
	 * 注册用户插入用户信息
	 */
	@Override
	public int insertIntoBlogUser(BlogUser blogUser) {
		return blogUserDao.insertSelective(blogUser);
	}
	/**
	 * 根据邮箱查找用户
	 */
	@Override
	public BlogUser getBlogUserByEmail(String email) {
		return blogUserDao.selectByEmail(email);
	}
	/**
	 * 根据id修改密码
	 */
	@Override
	public int updateBlogUser(BlogUser blogUser) {
		return blogUserDao.updateByPrimaryKeySelective(blogUser);
	}
	/**
	 * 根据用户id关联查询用户信息(包含用户发表的博客)
	 */
	@Override
	public BlogUser getBlogUserInfo(Integer userId) {
		return blogUserDao.getBlogUserInfo(userId);
	}
	/**
	 * 根据用户id查询用户(不包含其他任何信息)
	 */
	@Override
	public BlogUser selectByPid(Integer id) {
		return blogUserDao.selectByPrimaryKey(id);
	}
	@Override
	public int insertBatchUserHobby(List<UserHobbyKey> userHobbyList) {
		return userHobbyDao.insertBatchUserHobby(userHobbyList);
	}

}
