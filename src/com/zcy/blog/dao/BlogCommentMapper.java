package com.zcy.blog.dao;

import java.util.List;

import com.zcy.blog.model.BlogComment;

public interface BlogCommentMapper {
	int deleteByPrimaryKey(Short commentId);

	int insert(BlogComment record);

	int insertSelective(BlogComment record);

	BlogComment selectByPrimaryKey(Short commentId);

	int updateByPrimaryKeySelective(BlogComment record);

	int updateByPrimaryKeyWithBLOBs(BlogComment record);

	int updateByPrimaryKey(BlogComment record);

	// 根据用户id查找对应评论的博客详情
	List<BlogComment> getCommentInfoByUserId(Integer userId);

	// 根据blogid查找对应评论的博客详情
	List<BlogComment> getCommentInfoByBlogId(Integer blogId);
}