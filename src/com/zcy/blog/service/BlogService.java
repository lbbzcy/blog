package com.zcy.blog.service;

import java.util.List;

import com.zcy.blog.model.Blog;
import com.zcy.blog.utils.PageBean;

public interface BlogService {
//	根据blogId查找blog
	public Blog getBlogInfoById(Integer blogId);
//	根据userId查找blog
	public List<Blog> getBlogInfoByUserId(Integer userId);
//	查找所有的博客
	public List<Blog> getBlogInfos();
//	插入博客
	public int insertBlog(Blog blog);
//	分页查找博客
	public PageBean<Blog> findBlogsByPage(Integer page);
//	更新博客信息
	public int updateBlogById(Blog blog);
}
