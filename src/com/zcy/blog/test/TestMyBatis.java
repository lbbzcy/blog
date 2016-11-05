package com.zcy.blog.test;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.zcy.blog.dao.BlogMapper;
import com.zcy.blog.model.Blog;
import com.zcy.blog.model.BlogComment;
import com.zcy.blog.model.BlogUser;
import com.zcy.blog.model.Node;
import com.zcy.blog.model.User;
import com.zcy.blog.service.BlogService;
import com.zcy.blog.service.CommentService;
import com.zcy.blog.service.UserService;
import com.zcy.blog.utils.NodesHelper;
import com.zcy.blog.utils.PageBean;

@RunWith(SpringJUnit4ClassRunner.class) //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
public class TestMyBatis {
	private static Logger logger = Logger.getLogger(TestMyBatis.class);
	@Resource
	private UserService userService = null;
	@Resource 
	private BlogService blogService;
	@Resource 
	private CommentService commentService;

	@Test
	public void test1(){
		/*BlogUser blogUser = userService.selectByPid(1);
		System.out.println(blogUser);*/
		BlogUser userList = userService.getBlogUserInfo(1);
		System.out.println(userList);
		/*for(int i=0;i<userList.size();i++){
			logger.info(JSON.toJSONString(userList[i]));
		}*/
	};
	@Test
	public void test2(){
		List<Blog> blog = blogService.getBlogInfos();
		for(int i=0;i<blog.size();i++){
			System.out.println(blog.get(i));
		}
	}
	@Test
	public void test3(){
		PageBean<Blog> pageBean = blogService.findBlogsByPage(1);
		List<Blog> list = pageBean.getList();
		for(Blog b : list){
			System.out.println(b.getBlogTitle()+","+b.getBlogUser().getUserName());
		}
	}
	@Test 
	public void test4(){
		Blog blog = blogService.getBlogInfoById(3);
		System.out.println(blog);
	}
	
	
	@Test 
	public void test5(){
		List<BlogComment> comment = commentService.getCommentInfoByUserId(1);
//		List<Node> nodes = new ArrayList<Node>();
		for(BlogComment b : comment){
			System.out.println(b);
			/*Node node = new Node(b.getCommentId(), b.getParentId(),b.getBlogId());
			nodes.add(node);*/
		}
		
		/*List<Node> result = NodesHelper.getConvertNode(nodes);
		List<List<Node>> show = new ArrayList<List<Node>>();
		for(Node n : result){
			if(n.getChildrenList()!=null||!"".equals(n.getChildrenList())){
				show.add(n.getChildrenList());
			}
		}
		for(List<Node> ns : show){
			System.out.println(ns);
		}*/
	}
	
	@Test 
	public void test6(){
		List<BlogComment> comment = commentService.getCommentInfoByBlogId(28);
		for(BlogComment b : comment){
			System.out.println(b.getBlogUser().getHeadPath()+","+b.getBlogUser().getUserName());
		}
	}
}
