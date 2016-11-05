package com.zcy.blog.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zcy.blog.model.Blog;
import com.zcy.blog.model.BlogComment;
import com.zcy.blog.model.BlogUser;
import com.zcy.blog.model.User;
import com.zcy.blog.model.UserHobbyKey;
import com.zcy.blog.service.BlogService;
import com.zcy.blog.service.CommentService;
import com.zcy.blog.service.HobbyService;
import com.zcy.blog.service.UserService;
import com.zcy.blog.utils.MD5Util;
import com.zcy.blog.utils.MailUtils;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private HobbyService hobbyService;
	@Resource 
	private CommentService commentService;
	/**
	 * 测试
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request,Model model){
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(userId);
		model.addAttribute("user", user);
		return "showUser";
	}
	/**
	 * 检验用户是否可用
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/checkUser",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkUser(@RequestParam(value="username") String username,Model model){
		Map<String, String> resultMap = new HashMap<>();
		System.out.println(username);
		BlogUser blogUser = userService.getBlogUserByUserName(username);
		if(blogUser!=null){
			resultMap.put("result","用户名已经存在");
			return resultMap;
		}
		resultMap.put("result", "SUCCESS");
		return resultMap;
	}
	/**
	 * 检验邮箱是否可用
	 * @param email
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/checkEmail",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkEmail(@RequestParam(value="email") String email,Model model){
		Map<String,String> resultMap = new HashMap<>();
		System.out.println(email);
		BlogUser blogUser = userService.getBlogUserByEmail(email);
		if(blogUser!=null){
			resultMap.put("result", "该邮箱已经绑定账号，请重新输入邮箱");
			return resultMap;
		}
		resultMap.put("result", "SUCCESS");
		return resultMap;
	}
	/**
	 * 用户注册
	 * @return
	 */
	@RequestMapping(value="/handleRegister",method={RequestMethod.POST,RequestMethod.GET})
	public String handleRegister(HttpServletRequest request,Model model) {
		String username = request.getParameter("username");
		System.out.println(username);
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		password = MD5Util.string2MD5(password);
		BlogUser blogUser = new BlogUser();
		blogUser.setUserName(username);
		blogUser.setEmail(email);
		blogUser.setPassword(password);
		System.out.println(username+","+email+","+password);
		int result = userService.insertIntoBlogUser(blogUser);
		System.out.println("result:"+result);
		if(result>=1){
//			注册成功
			System.out.println("注册成功");
			model.addAttribute("username", username);
			request.getSession().setAttribute("blogUser", blogUser);
			model.addAttribute("username", blogUser.getUserName());
			return "personalHome";
		}else{
//			注册失败
			return "register";
		}
		
//		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
	}
	/**
	 * 处理登录
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/handleLogin",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<String,String> handleLogin(HttpServletRequest request,Model model){
		Map<String, String> mapResult = new HashMap<>();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		password = MD5Util.string2MD5(password);
		System.out.println(username+","+password);
		BlogUser blogUser = userService.getBlogUserByUserName(username);
		if(blogUser==null){
			mapResult.put("result", "FAILURE");
		}else{
			if(blogUser.getPassword().equals(password)){
				mapResult.put("result", "SUCCESS");
				//将登陆成功的用户信息存入session中
				request.getSession().setAttribute("blogUser", blogUser);
			}else{
				mapResult.put("result", "FAILURE");
			}
		}
		return mapResult;
	}
	/**
	 * 找回密码发送邮件
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getPassword",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> getPassword(HttpServletRequest request){
		Map<String,String> resultMap = new HashMap<>();
		String email = request.getParameter("email");
		System.out.println(email);
		MailUtils.sendMail(email);
		resultMap.put("result", "SUCCESS");
		return resultMap;
	}
	/**
	 * 处理找回密码的逻辑
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/handleGetPwd",method=RequestMethod.POST)
	public String handleGetPwd(HttpServletRequest request,Model model){
		String email = request.getParameter("email");
		String password =request.getParameter("password");
		password = MD5Util.string2MD5(password);
		System.out.println(email+","+password);
		BlogUser blogUser = userService.getBlogUserByEmail(email);
		if(blogUser!=null){
			blogUser.setPassword(password);
			int result = userService.updateBlogUser(blogUser);
			if(result>=1){
				return "redirect:/login";
			}
		}
		return "redirect:/error";
	}
	/**
	 * 处理修改密码的逻辑
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/handleModifyPwd",method=RequestMethod.POST)
	public String handleModifyPwd(HttpServletRequest request,Model model){
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		System.out.println(userId+","+oldPassword+","+newPassword);
		//判断用户输入的密码是否正确 
		BlogUser blogUser = userService.selectByPid(userId);
		oldPassword = MD5Util.string2MD5(oldPassword);
		System.err.println("oldPassword:"+oldPassword);
		newPassword = MD5Util.string2MD5(newPassword);
		System.out.println("newPassword:"+newPassword);
		if(oldPassword.equals(blogUser.getPassword())){
			//修改密码
			blogUser.setPassword(newPassword);
			int result = userService.updateBlogUser(blogUser);
			if(result>=1){
				model.addAttribute("modiPwdmsg", "修改密码成功");
			}
		}else{
			model.addAttribute("modiPwdmsg", "修改密码失败，原密码错误");
		}
		model.addAttribute("username", blogUser.getUserName());
		return "redirect:personalHome";
	}
	/**
	 * 修改个人信息页面
	 * @return
	 */
	@RequestMapping(value="/personalHome",method=RequestMethod.GET)
	public String personalHome(HttpServletRequest request,Model model){
		String username = request.getParameter("username");
		System.out.println(username);
		BlogUser blogUser = userService.getBlogUserByUserName(username);
		System.out.println("userId"+blogUser.getUserId());
		//根据用户id查找用户发表的评论
		List<BlogComment> blogs = commentService.getCommentInfoByUserId(blogUser.getUserId());
		model.addAttribute("blogs", blogs);
		blogUser = userService.getBlogUserInfo(blogUser.getUserId());
		System.out.println(blogUser);
		model.addAttribute("blogUser", blogUser);
		return "personal_home";
	}
	/**
	 * 上传文件处理
	 * @param file
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/uploadImg",method=RequestMethod.POST)
	public String uploadImg(@RequestParam(value="file",required=false) MultipartFile file,HttpServletRequest request,ModelMap model) throws Exception{
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		BlogUser blogUser = null;
		System.out.println("userId"+userId);
//		String pathRoot = request.getSession().getServletContext().getRealPath("");
		String pathRoot = "D:\\upload\\";//上传文件的存放位置
		String path="";
		if(!file.isEmpty()){
			//生成uuid作为文件名称
//			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			
			//获得文件类型(可以判断如果不是图片，禁止上传)
			String contentType = file.getContentType();
			System.out.println("contentType:"+contentType);
			if("image/jpeg".equals(contentType)||"image/bmp".equals(contentType)||"image/gif".equals(contentType)||"image/png".equals(contentType)){
				//获得文件后缀
				String imageName = contentType.substring(contentType.indexOf("/")+1);
				blogUser = userService.selectByPid(userId);
				if(blogUser!=null){
					String uuid = blogUser.getUserName();
					path = uuid+"."+imageName;
					blogUser.setHeadPath(path);
					int result = userService.updateBlogUser(blogUser);
					if(result>=1){
//						修改成功
						model.addAttribute("modiImgPwd", "修改头像成功");
					}else{
//						修改失败
						model.addAttribute("modiImgPwd", "修改头像失败");
					}
				}
				file.transferTo(new File(pathRoot+path));
			}
		}
		model.addAttribute("username", blogUser.getUserName());
		model.addAttribute("fileUrl", path);
		return "redirect:personalHome";
	}
	/**
	 * 处理用户登出的操作
	 * @return
	 */
	@RequestMapping(value="/handleLogout",method=RequestMethod.GET)
	public String handleLogout(HttpServletRequest request){
//		将session中存放的值移除
		request.getSession().removeAttribute("blogUser");
		return "redirect:/login";
	}
	/**
	 * 处理修改用信息的操作
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/handleModiInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> handleModiInfo(HttpServletRequest request) throws ParseException{
		Map<String, String> resultMap = new HashMap<String,String>();
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		String nickName = request.getParameter("nickName");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birthday");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = sdf.parse(birth);
		String qq = request.getParameter("qq");
		String hobbies = request.getParameter("hobbies");
		String[] hobbyList = hobbies.split(",");
		System.out.println(userId+","+nickName+","+gender+","+birthday+","+qq+","+hobbies);
//		修改用户信息
		BlogUser blogUser = userService.selectByPid(userId);
		System.out.println(blogUser);
		blogUser.setNickName(nickName);
		blogUser.setGender(gender);
		blogUser.setBirthday(birthday);
		blogUser.setQq(qq);
		hobbyService.deleteHobbyByUserId(userId);
		int result = userService.updateBlogUser(blogUser);
		List<UserHobbyKey> list = new ArrayList<UserHobbyKey>();
		for(int i=0;i<hobbyList.length;i++){
			UserHobbyKey u = new UserHobbyKey();
			u.setUserId(userId);
			u.setHobbyId(Integer.parseInt(hobbyList[i]));
			System.out.println(u);
			list.add(u);
		}
		int result1 = userService.insertBatchUserHobby(list);
		System.out.println("result:"+result+",result1:"+result1);
		if(result>=1&&result1>=1){
			System.out.println("修改成功");
			resultMap.put("result", "SUCCESS");
		}else{
			System.out.println("修改失败");
			resultMap.put("result", "FAILURE");
		}
		
		return resultMap;
	}
}
