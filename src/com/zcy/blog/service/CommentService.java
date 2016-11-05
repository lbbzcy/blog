package com.zcy.blog.service;

import java.util.List;

import com.zcy.blog.model.BlogComment;

public interface CommentService {
//	插入评论
	public int insertIntoComment(BlogComment comment);
//	根据用户id查找对应评论的博客详情
	public List<BlogComment> getCommentInfoByUserId(Integer userId);
//	根据blogid查找评论
	public List<BlogComment> getCommentInfoByBlogId(Integer blogId);
}
