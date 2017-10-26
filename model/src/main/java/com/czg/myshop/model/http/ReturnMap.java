package com.czg.myshop.model.http;

import com.czg.myshop.common.utils.valid.TextUtils;

public class ReturnMap {

    public static final int SUCCESS = 40;//成功

    public static final int BUSINESS_ERROR = 41;//业务错误(只能在后台校验的错误)

    public static final int SYSTEM_ERROR = 42;//系统错误

    public static final int FAIL = 44;//不应该出现的业务错误(可以在调用端校验的错误)


    /**
     * @param t   obj
     * @param <T> obj类型
     * @return 成功
     */
    public static <T> ReturnBean<T> SUCCESS(T t) {
        return new ReturnBean<T>(SUCCESS, "success", t);
    }

    /**
     * @return 成功
     */
    public static ReturnBean SUCCESS() {
        return new ReturnBean<String>(SUCCESS, "success", "");
    }

    /**
     * @param msg
     * @return 业务错误提示
     */
    public static ReturnBean BUSINESS_ERROR(String msg) {
        return new ReturnBean<String>(BUSINESS_ERROR, msg, "");
    }

    /**
     * @param msg
     * @return 无法预期的错误
     */
    public static ReturnBean SYSTEM_ERROR(String msg) {
        return new ReturnBean<String>(SYSTEM_ERROR, TextUtils.isEmpty(msg) ? "System Error !" : msg, "");
    }

    /**
     * @param msg
     * @return FAIL  //不应该出现的业务错误(可以在调用端校验的错误)
     */
    public static ReturnBean FAIL(String msg) {
        return new ReturnBean<String>(FAIL, msg, "");
    }


    /**
     * @return 参数缺失
     */
    public static ReturnBean PARAMETER_ERROR() {
        return new ReturnBean<String>(FAIL, "Parameters are missing", "");
    }

    /**
     * @return 参数缺失
     */
    public static ReturnBean PARAMETER_ERROR(String msg) {
        return new ReturnBean<String>(FAIL, msg, "");
    }
}
