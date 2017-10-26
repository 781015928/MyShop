package com.czg.myshop.model.http;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Serializable;


public class ReturnBean<T> implements Serializable {
    private static final Logger logger = LoggerFactory.getLogger(ReturnBean.class);

    private static final long serialVersionUID = -5809782578272943999L;

    private int code;
    private String msg;
    private T obj;

    public ReturnBean() {

    }

    public ReturnBean(int code, String msg, T obj) {
        this.code = code;
        this.msg = msg;
        this.obj = obj;
        if (ReturnMap.SUCCESS == code) {
            logger.info("请求成功:success");
        } else {
            logger.info("请求失败:" + "code:" + code + ", " + "msg:" + msg + ", " + "resobj:" + obj);
        }
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public T getObj() {
        return obj;
    }
}
