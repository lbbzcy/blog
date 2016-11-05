package com.zcy.blog.model;

import java.io.Serializable;
import java.util.Date;

public class BlogComment implements Serializable{
    private Integer commentId;

    private Integer parentId;

    private String thread;

    private Date commentDate;

    private Integer userId;

    private Integer blogId;
    
    private Integer depth;

    private String commentContent;
    
    //在博客评论表中加入博客 
    private Blog blog;
    
    //在博客表中加入发表评论用户的
    private BlogUser blogUser;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getThread() {
        return thread;
    }

    public void setThread(String thread) {
        this.thread = thread == null ? null : thread.trim();
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public Integer getDepth() {
		return depth;
	}

	public void setDepth(Integer depth) {
		this.depth = depth;
	}

	public BlogUser getBlogUser() {
		return blogUser;
	}

	public void setBlogUser(BlogUser blogUser) {
		this.blogUser = blogUser;
	}

	@Override
	public String toString() {
		return "BlogComment [commentId=" + commentId + ", parentId=" + parentId + ", thread=" + thread
				+ ", commentDate=" + commentDate + ", userId=" + userId + ", blogId=" + blogId + ", depth=" + depth
				+ ", commentContent=" + commentContent + ", blog=" + blog + ", blogUser=" + blogUser + "]";
	}
    
}