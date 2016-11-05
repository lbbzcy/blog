package com.zcy.blog.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zcy.blog.model.Blog;
import com.zcy.blog.model.BlogComment;
import com.zcy.blog.model.BlogUser;
import com.zcy.blog.model.Node;
import com.zcy.blog.service.BlogService;
import com.zcy.blog.service.CommentService;
import com.zcy.blog.service.UserService;
import com.zcy.blog.utils.NodesHelper;

@Controller
@RequestMapping("/blog")
public class BlogController {
	@Resource
	private BlogService blogService;
	@Resource
	private CommentService commentService;
	/**
	 * 用户发表博客的处理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/handleBlogEdit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> handleBlogEdit(HttpServletRequest request){
		Map<String,String> resultMap = new HashMap<>();
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		String blogTitle = request.getParameter("title");
		String blogContent = request.getParameter("content");
		System.out.println("title:"+blogTitle+"content:"+blogContent);
		Date publishDate = new Date();
		
		Blog blog = new Blog();
		blog.setBlogTitle(blogTitle);
		blog.setBlogContent(blogContent);
		blog.setPublishDate(publishDate);
		blog.setUserId(userId);
		
		int result = blogService.insertBlog(blog);
		
		if(result>=1){
			//发表成功，返回到个人中心
			System.out.println("发表成功");
			resultMap.put("result", "SUCCESS");
		}
		return resultMap;
	}
	/**
	 * 跳转到博客详情
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/blogDetail",method=RequestMethod.GET)
	public String blogDeatil(HttpServletRequest request,Model model){
		Integer blogId = Integer.parseInt(request.getParameter("blogId"));
		Blog blog = blogService.getBlogInfoById(blogId);
		if(blog!=null){
			Integer readCounts = blog.getReadCounts();
			if(readCounts==null){
				readCounts = 0;
			}
			readCounts++;
			System.out.println("readCounts:"+readCounts);
			model.addAttribute("blog", blog);
			//根据blogId查找comment
			List<BlogComment> comments = commentService.getCommentInfoByBlogId(blog.getBlogId());
			model.addAttribute("comments", comments);
			
//			将阅读次数增1
			blog.setReadCounts(readCounts);
			blogService.updateBlogById(blog);
		}
		
//		return "test1";
		return "blog_detail";
	}
	/**
	 * 检验用户是否有评论的权限
	 * @return
	 */
	@RequestMapping(value="/checkIsLogin",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkIsLogin(HttpServletRequest reqeust){
		Map<String,String> result = new HashMap<>();
		Object obj = reqeust.getSession().getAttribute("blogUser");
		if(obj==null){
			result.put("result", "FAILURE");
		}
		return result;
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/handleBlogComment",method=RequestMethod.POST)
	public String handleBlogComment(HttpServletRequest request){
		String commentContent = request.getParameter("commentContent");
		Integer blogId = Integer.parseInt(request.getParameter("blogId"));
		BlogUser user = (BlogUser) request.getSession().getAttribute("blogUser");
		Integer userId = user.getUserId();
		Date commentDate = new Date();
		BlogComment blogComment = new BlogComment();
		blogComment.setBlogId(blogId);
		blogComment.setUserId(userId);
		blogComment.setCommentContent(commentContent);
		blogComment.setCommentDate(commentDate);
		
		
		
		blogComment.setThread("0");
		//对评论的评论  所以需要传入被评论的评论的id
		blogComment.setParentId(1);
		blogComment.setDepth(0);
		
		commentService.insertIntoComment(blogComment);
		Blog blog = blogService.getBlogInfoById(blogId);
		if(blog!=null){
			Integer commentCounts = blog.getCommentCounts();
			if(commentCounts==null){
				commentCounts = 0;
			}
			commentCounts++;
			System.out.println("commentCounts:"+commentCounts);
//			将评论次数增1
			blog.setCommentCounts(commentCounts);
			blogService.updateBlogById(blog);
		}
		return "redirect:blogDetail?blogId="+blogId;
	}
}
