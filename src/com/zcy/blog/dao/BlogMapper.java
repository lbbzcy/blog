package com.zcy.blog.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.zcy.blog.model.Blog;

public interface BlogMapper {
    int deleteByPrimaryKey(Integer blogId);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(Integer blogId);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKeyWithBLOBs(Blog record);

    int updateByPrimaryKey(Blog record);
    
    //根据blogId查找博客
    Blog getBlogInfoById(Integer blogId);
    //根据userId查找博客
    List<Blog> getBlogInfoByUserId(Integer userId);
    //查找所有的博客
    List<Blog> getBlogInfos();
    //查找blog的总数
    int findBlogCount();
    //分页查找发布的所有博客
    List<Blog> findBlogsByPage(RowBounds rb);
}