package com.zcy.blog.dao;

import com.zcy.blog.model.Hobby;

public interface HobbyMapper {
    int deleteByPrimaryKey(Short hobbyId);

    int insert(Hobby record);

    int insertSelective(Hobby record);

    Hobby selectByPrimaryKey(Short hobbyId);

    int updateByPrimaryKeySelective(Hobby record);

    int updateByPrimaryKey(Hobby record);
}