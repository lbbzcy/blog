package com.zcy.blog.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Hobby implements Serializable{
    private Integer hobbyId;

    private String hobbyName;
    
    public Integer getHobbyId() {
        return hobbyId;
    }

    public void setHobbyId(Integer hobbyId) {
        this.hobbyId = hobbyId;
    }

    public String getHobbyName() {
        return hobbyName;
    }

    public void setHobbyName(String hobbyName) {
        this.hobbyName = hobbyName == null ? null : hobbyName.trim();
    }

	@Override
	public String toString() {
		return "Hobby [hobbyId=" + hobbyId + ", hobbyName=" + hobbyName + "]";
	}
}