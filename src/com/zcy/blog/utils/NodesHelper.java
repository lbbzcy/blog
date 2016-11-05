package com.zcy.blog.utils;

import java.util.ArrayList;
import java.util.List;

import com.zcy.blog.model.Node;

public class NodesHelper {
	public static List<Node> getConvertNode(List<Node> list) {// 对外开放接口,返回排序后的集合表
		// 各节点之间建立连接关系
		connectNodes(list);
		// 获取所有的根节点
		List<Node> rootNodes = getRootNodes(list);
		// 建立空表，储存排序后的节点
		List<Node> result = new ArrayList<Node>();

		for (int i = 0; i < rootNodes.size(); i++) {// 根据每个根节点，将其所属节点添加到空表中
													// 递归添加节点
			addNodeToResult(result, rootNodes.get(i));
		}

		return result;
	}

	private static void connectNodes(List<Node> list) {// 各节点之间建立连接关系
		for (int i = 0; i < list.size() - 1; i++) {
			Node nodeLast = list.get(i);
			for (int j = i + 1; j < list.size(); j++) {
				Node nodeNext = list.get(j);
				if (nodeLast.getRootNumber() == nodeNext.getRootNumber())// 判断是否处于同一树
				{
					if (nodeNext.getPId() == nodeLast.getId()) {
						nodeLast.setChildren(nodeNext);
						nodeNext.setParent(nodeLast);
					} else if (nodeNext.getId() == nodeLast.getPId()) {
						nodeNext.setChildren(nodeLast);
						nodeLast.setParent(nodeNext);
					}
				}
			}
		}

	}

	private static List<Node> getRootNodes(List<Node> list) {// 获取所有的根节点
		List<Node> rootNodes = new ArrayList<Node>();

		int length = list.size();
		for (int i = 0; i < length; i++) {
			if (list.get(i).isRoot()) {
				rootNodes.add(list.get(i));
			}
		}
		return rootNodes;
	}

	private static void addNodeToResult(List<Node> result, Node node)// 递归添加节点
	{
		result.add(node);

		if (node.isLeaf()) {
			return;
		}

		List<Node> list = node.getChildrenList();

		for (int i = 0; i < list.size(); i++) {
			addNodeToResult(result, list.get(i));
		}
	}
}
