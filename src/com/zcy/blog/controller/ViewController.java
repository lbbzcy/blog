package com.zcy.blog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {
	
	/**
	 * 注册 
	 * @return
	 */
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
	/**
	 * 登陆
	 * @return
	 */
	@RequestMapping("/login")
	public String login(){
		System.out.println("login");
		return "login";
	}
	/**
	 * 修改密码
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getPwd",method=RequestMethod.GET)
	public String modifyPwd(HttpServletRequest request,Model model){
		String email = request.getParameter("email");
		System.out.println(email);
		model.addAttribute("email",email);
		return "get_pwd";
	}
	/**
	 * 跳转到修改博客页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/blogEdit",method=RequestMethod.GET)
	public String blogEdit(HttpServletRequest request,Model model){
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String headPath =request.getParameter("headPath");
		System.out.println("userId:"+userId+"userName:"+userName);
		model.addAttribute("userId", userId);
		model.addAttribute("userName",userName);
		model.addAttribute("headPath",headPath);
		return "blog_edit";
	}
	/**
	 * 跳转到404页面
	 * @return
	 */
	@RequestMapping("/show404")
	public String show404(){
		return "error/404";
		
	}
	/**
	 * 跳转到500页面
	 * @return
	 */
	@RequestMapping("/show500")
	public String show500(){
		return "error/500";
		
	}
	/**
	 * 跳转到错误页面
	 * @return
	 */
	@RequestMapping("/error")
	public String showerror(){
		return "error/error";
		
	}
}
