package com.czg.myshop.model.exception;

public class ExceptionMap {


    public static void BUSINESS_EXCEPTION(String msg) {
        throw new BusinessException(msg);
    }
    public static void FAIL_EXCEPTION(String msg) {
        throw new FailException(msg);
    }
    public static void SYSTEM_EXCEPTION(Throwable exception) {
        throw new SystemException(exception);
    }
}
