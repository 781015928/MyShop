package com.czg.myshop.common.utils.valid;

public class TextUtils {
    public static final boolean isEmpty(CharSequence s) {
        return (s == null) || (s.length() == 0);
    }

    public static final boolean isNoEmpty(CharSequence s) {
        return (s != null) && (s.length() != 0);
    }
}
