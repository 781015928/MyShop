package com.czg.myshop.model.page;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.List;

public class Page {

    public static void startPage(int pageNum, int pageSize) {
        if (pageNum == 0) {
            return;
        }

        PageHelper.startPage(pageNum, pageSize);
    }

    public static <T> PageBean<T> getPage(List<T> rows) {
        return new PageBean<T>(new PageInfo(rows));

    }


}
