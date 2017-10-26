package com.czg.myshop.model.page;


import com.github.pagehelper.PageInfo;

import java.util.List;

public class PageBean<T> {
    private int pageNum;//分页
    private int pageSize;//分页数量
    private int size;//分页数量
    private long total;//总量
    private int maxPages;//最大页数
    private List<T> rows;

    public PageBean(PageInfo<T> pageInfo) {
        pageNum = pageInfo.getPageNum();
        pageSize = pageInfo.getPageSize();
        size = pageInfo.getSize();
        total = pageInfo.getTotal();
        maxPages = pageInfo.getPages();
        rows = pageInfo.getList();
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getMaxPages() {
        return maxPages;
    }

    public void setMaxPages(int maxPages) {
        this.maxPages = maxPages;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
