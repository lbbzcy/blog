package com.zcy.blog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zcy.blog.dao.UserHobbyMapper;
import com.zcy.blog.service.HobbyService;

@Service("hobbyService")
public class HobbyServiceImpl implements HobbyService{

	@Resource
	private UserHobbyMapper userHobbyDao;
	/**
	 * 根据用户id删除爱好
	 */
	@Override
	public int deleteHobbyByUserId(Integer userId) {
		return userHobbyDao.deleteByPrimaryKey(userId);
	}

}
