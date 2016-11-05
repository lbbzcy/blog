package com.zcy.blog.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BlogUser implements Serializable{
    private Integer userId;

    private String userName;

    private String email;

    private String password;

    private String nickName;

    private String gender;

    private Date birthday;

    private String qq;

    private String hobby;

    private String headPath;
    
    //用户与博客文章关联 在BlogUser端加入Blog的集合
    private List<Blog> blogList = new ArrayList<Blog>();
    //用户与爱好之间多对多关联
    private List<Hobby> hobbyList = new ArrayList<Hobby>();

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName == null ? null : nickName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby == null ? null : hobby.trim();
    }

    public String getHeadPath() {
        return headPath;
    }

    public void setHeadPath(String headPath) {
        this.headPath = headPath == null ? null : headPath.trim();
    }

	public List<Blog> getBlogList() {
		return blogList;
	}

	public void setBlogList(List<Blog> blogList) {
		this.blogList = blogList;
	}
	

	public List<Hobby> getHobbyList() {
		return hobbyList;
	}

	public void setHobbyList(List<Hobby> hobbyList) {
		this.hobbyList = hobbyList;
	}

	@Override
	public String toString() {
		return "BlogUser [userId=" + userId + ", userName=" + userName + ", email=" + email + ", password=" + password
				+ ", nickName=" + nickName + ", gender=" + gender + ", birthday=" + birthday + ", qq=" + qq + ", hobby="
				+ hobby + ", headPath=" + headPath + ", blogList=" + blogList + ", hobbyList=" + hobbyList + "]";
	}

}