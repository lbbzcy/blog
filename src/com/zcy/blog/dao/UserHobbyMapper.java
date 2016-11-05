package com.zcy.blog.dao;

import java.util.List;

import com.zcy.blog.model.UserHobbyKey;

public interface UserHobbyMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(UserHobbyKey record);

    int insertSelective(UserHobbyKey record);
    
//    批量插入数据 
    int insertBatchUserHobby(List<UserHobbyKey> userHobbyList);
}