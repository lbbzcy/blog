package com.zcy.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zcy.blog.dao.BlogCommentMapper;
import com.zcy.blog.model.BlogComment;
import com.zcy.blog.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	
	@Resource
	private BlogCommentMapper commentDao;
	/**
	 * 插入评论
	 */
	@Override
	public int insertIntoComment(BlogComment comment) {
		return commentDao.insertSelective(comment);
	}
	/**
	 * 根据用户id查找对应评论的博客详情
	 */
	@Override
	public List<BlogComment> getCommentInfoByUserId(Integer userId) {
		return commentDao.getCommentInfoByUserId(userId);
	}
	/**
	 * getCommentInfoByBlogId
	 */
	@Override
	public List<BlogComment> getCommentInfoByBlogId(Integer blogId) {
		return commentDao.getCommentInfoByBlogId(blogId);
	}

}
