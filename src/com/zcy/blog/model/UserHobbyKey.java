package com.zcy.blog.model;

public class UserHobbyKey {
    private Integer userId;

    private Integer hobbyId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getHobbyId() {
        return hobbyId;
    }

    public void setHobbyId(Integer hobbyId) {
        this.hobbyId = hobbyId;
    }

	@Override
	public String toString() {
		return "UserHobbyKey [userId=" + userId + ", hobbyId=" + hobbyId + "]";
	}
    
    
}