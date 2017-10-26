package com.czg.myshop.model.exception;

public class SystemException extends RuntimeException {
    private Throwable exception;

    public SystemException(Throwable exception) {
        this.exception=exception;
    }

    public Throwable getException() {
        return exception;
    }
}
