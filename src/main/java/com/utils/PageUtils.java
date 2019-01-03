package com.utils;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;

/**
 * 通用的分页工具类
 * @author 我的好伙伴
 *
 * @param <T>
 */
public class PageUtils<T> {

	private int currentPage;// 当前页码
	private int pageSize; // 每页大小
	private int totalNum; // 总数据条数
	private int first = 1;// 首页
	private int last;// 尾页
	private int totalPage;// 总页数
	private int prev;// 上一页
	private int next;// 下一页
	private int startNum;// 页面序号显示的起始位置
	private int start;// 页码显示控制-开始页码
	private int end;// 页码显示控制-结束页码
	private int count = 10;// 页码显示控制-总显示页码(防止页码过多导致拥挤)
	private List<T> list = new ArrayList<T>();// 数据

	/**
	 * 在构造器中根据指导参数计算其他属性值
	 *
	 * @param currentPage
	 * @param pageSize
	 * @param totalNum
	 */
	public PageUtils(int currentPage, int pageSize, int totalNum) {

		this.currentPage = currentPage;
		// 赋值每页显示的记录条数
		this.pageSize = pageSize;
		// 赋值总记录条数(总数据条数)
		this.totalNum = totalNum;

		// 计算获得总页数(不能相除加1,要是刚好除尽了就会多了一页)
		this.totalPage = this.last = (int) Math.ceil((double) totalNum / pageSize);
		// 防止当前页大于总页数
		this.currentPage = Math.min(this.totalPage, this.currentPage);
		// 防止当前页小于1
		this.currentPage = Math.max(this.currentPage, 1);
		// 防止上一页小于1
		this.prev = Math.max(this.currentPage - 1, 1);
		// 防止下一页大于总页数
		this.next = Math.min(this.totalPage + 1, this.currentPage+1);
		//计算获取数据显示的序号位置
		this.startNum=(this.currentPage-1)*pageSize;
		//计算显示页码的起始位置
		this.start=Math.max(this.currentPage-this.count/2, 1);
		//计算显示页码的结束位置
		this.end= Math.min(this.start + this.count,this.totalPage);




	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public PageUtils(int currentPage, int pageSize, int totalNum, int first, int last, int totalPage, int prev,
					 int next, int startNum, int start, int end, int count, List<T> list) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalNum = totalNum;
		this.first = first;
		this.last = last;
		this.totalPage = totalPage;
		this.prev = prev;
		this.next = next;
		this.startNum = startNum;
		this.start = start;
		this.end = end;
		this.count = count;
		this.list = list;
	}

	public String toString(){
		return JSON.toJSONString(this);
	}

}
