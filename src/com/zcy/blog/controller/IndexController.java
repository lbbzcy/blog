package com.zcy.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zcy.blog.model.Blog;
import com.zcy.blog.service.BlogService;
import com.zcy.blog.utils.PageBean;

import oracle.net.aso.b;

@Controller
public class IndexController {
	@Resource
	private BlogService blogService;
	@RequestMapping("/")
	public String go(){
		return "redirect:/index?page=1";
	}
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model){
		Integer page = Integer.parseInt(request.getParameter("page"));
		PageBean<Blog> pageBean = blogService.findBlogsByPage(page);
		model.addAttribute("pageBean", pageBean);
		return "index";
	}
}
