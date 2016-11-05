package com.zcy.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.zcy.blog.dao.BlogMapper;
import com.zcy.blog.model.Blog;
import com.zcy.blog.service.BlogService;
import com.zcy.blog.utils.PageBean;

@Service("blogService")
public class BlogServiceImpl implements BlogService{

	@Resource
	private BlogMapper blogDao;
	/**
	 * 根据blogId查找博客
	 */
	@Override
	public Blog getBlogInfoById(Integer blogId) {
		return blogDao.getBlogInfoById(blogId);
	}
	/**
	 * 查找所有的博客
	 */
	@Override
	public List<Blog> getBlogInfos() {
		return blogDao.getBlogInfos();
	}
	/**
	 * 插入博客
	 */
	@Override
	public int insertBlog(Blog blog) {
		return blogDao.insertSelective(blog);
	}
	/**
	 * 分页查询博客
	 */
	@Override
	public PageBean<Blog> findBlogsByPage(Integer page) {
		PageBean<Blog> pageBean = new PageBean<>();
		//设置页数
		pageBean.setPage(page);
		//设置每页显示的记录数
		Integer limit = 4;
		pageBean.setLimit(limit);
		//设置总的记录数
		Integer totalCount = blogDao.findBlogCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = (totalCount / limit) + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		// 设置pageBean中的list数据的集合
		int start = (page - 1) * limit;
		RowBounds rn = new RowBounds(start, limit);
		List<Blog>  list = blogDao.findBlogsByPage(rn);
		pageBean.setList(list);
		return pageBean;
	}
	/**
	 * 更新博客信息
	 */
	@Override
	public int updateBlogById(Blog blog) {
		return blogDao.updateByPrimaryKeySelective(blog);
	}
	/**
	 * 根据userId查找blog
	 */
	@Override
	public List<Blog> getBlogInfoByUserId(Integer userId) {
		return blogDao.getBlogInfoByUserId(userId);
	}
}
