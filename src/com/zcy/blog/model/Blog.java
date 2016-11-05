package com.zcy.blog.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Blog implements Serializable {
	private Integer blogId;

	private String blogTitle;

	private Date publishDate;

	private Integer readCounts;

	private Integer commentCounts;

	private Integer userId;

	private String blogContent;

	// 用户与博客文章关联 在Blog端加入BlogUser
	private BlogUser blogUser;
	// 博客与博客评论的关联 在Blog端加入BlogComment
	private List<BlogComment> commentList = new ArrayList<BlogComment>();

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle == null ? null : blogTitle.trim();
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Integer getReadCounts() {
		return readCounts;
	}

	public void setReadCounts(Integer readCounts) {
		this.readCounts = readCounts == null ? null : readCounts;
	}

	public Integer getCommentCounts() {
		return commentCounts;
	}

	public void setCommentCounts(Integer commentCounts) {
		this.commentCounts = commentCounts == null ? null : commentCounts;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getBlogContent() {
		return blogContent;
	}

	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent == null ? null : blogContent.trim();
	}

	public BlogUser getBlogUser() {
		return blogUser;
	}

	public void setBlogUser(BlogUser blogUser) {
		this.blogUser = blogUser;
	}

	public List<BlogComment> getcommentList() {
		return commentList;
	}

	public void setcommentList(List<BlogComment> commentList) {
		this.commentList = commentList;
	}

	@Override
	public String toString() {
		return "Blog [blogId=" + blogId + ", blogTitle=" + blogTitle + ", publishDate=" + publishDate + ", readCounts="
				+ readCounts + ", commentCounts=" + commentCounts + ", userId=" + userId + ", blogContent="
				+ blogContent + ", blogUser=" + blogUser + ", commentList=" + commentList + "]";
	}
}