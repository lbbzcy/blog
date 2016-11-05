package com.zcy.blog.dao;

import java.util.List;

import com.zcy.blog.model.BlogUser;

public interface BlogUserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(BlogUser record);

    int insertSelective(BlogUser record);

    BlogUser selectByPrimaryKey(Integer userId);
    
    BlogUser selectByUserName(String userName);
    
    BlogUser selectByEmail(String email);

    int updateByPrimaryKeySelective(BlogUser record);

    int updateByPrimaryKey(BlogUser record);
    
    BlogUser getBlogUserInfo(Integer userId);
}