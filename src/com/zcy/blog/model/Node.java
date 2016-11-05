package com.zcy.blog.model;

import java.util.ArrayList;
import java.util.List;

public class Node {
	private int id;// 自己的id,-1时表示叶子节点
	private int p_id;// 父节点id,0时表示根节点
	private int root_number;// 这个是每条树的唯一标识，表示该节点所在根
	private Node parent;// 记录父节点,每个节点只有一个父节点
	private List<Node> children = new ArrayList<Node>();// 记录子节点，子节点可以有多个

	public Node(int id, int p_id, int root_number) {
		this.id = id;
		this.p_id = p_id;
		this.root_number = root_number;
	}
	
	public int getId() {
		return this.id;
	}

	public int getPId() {
		return this.p_id;
	}

	public int getRootNumber() {
		return this.root_number;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public void setRoot_number(int root_number) {
		this.root_number = root_number;
	}

	public void setChildren(List<Node> children) {
		this.children = children;
	}

	public void setParent(Node parent) {// 设置父节点
		this.parent = parent;
	}

	public Node getParent() {// 获取该节点的父节点
		return this.parent;
	}

	public void setChildren(Node child) {// 记录子节点
		this.children.add(child);
	}

	public boolean isRoot() {// 判断是否为根
		return this.p_id == 0;
	}

	public boolean isLeaf() {// 判断是否为叶子节点
		return this.id == -1;
	}

	public List<Node> getChildrenList() {// 获取该节点的的所有子节点集合表
		return this.children;
	}

	@Override
	public String toString() {
		return "Node [id=" + id + ", p_id=" + p_id + ", root_number=" + root_number + ", parent=" + parent + "]";
	}
	
}
