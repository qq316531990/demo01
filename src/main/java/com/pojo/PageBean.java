package com.pojo;

import java.util.List;

public class PageBean<E>{
	private int currPage=1;//当前页码
	private int pageSize=5;//页面显示的记录数
	private int count;//总记录数
	private int startIndex;//查询的起始下标
	private int endIndex;//查询的结束下标
	private List<E> data;//查询获取到的数据

	public List<E> getData() {
		return data;
	}
	public void setData(List<E> data) {
		this.data = data;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getStartIndex() {//计算 起始下标
		if(this.currPage>Math.ceil((this.count*1.0/this.pageSize))){//假设 当前页码超出范围 按照最后一页算
			this.currPage=(int) Math.ceil((this.count*1.0/this.pageSize));
			}
		if(this.currPage<=1){
			this.currPage=1;//如果传入的当前页码小于1  就按照1来算
			startIndex=0;
		}else {
			startIndex = (this.currPage-1 ) * pageSize;//查询的起始下标=当前页码*页面显示的记录数
		}
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		endIndex=this.getStartIndex()+pageSize;//结束下标=起始下标+页面显示的条数-1
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
}
