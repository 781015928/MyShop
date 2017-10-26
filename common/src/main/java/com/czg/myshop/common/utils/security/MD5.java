package com.czg.myshop.common.utils.security;

import java.security.MessageDigest;
import java.util.Date;

public class MD5 {

    public final static String MD5_NEWTAG = "liqiang365";//不可改变
    private final static String MD5_SALT = "!QAZxsw2#EdcVFr4";//不可改变

    public static String md5(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte b[] = md.digest();

            int i;

            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            str = buf.toString();
        } catch (Exception e) {
            e.printStackTrace();

        }
        return str;
    }

    public static String md5_salt(String str) {
        try {
            str = str + MD5_SALT;
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte b[] = md.digest();

            int i;

            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            str = buf.toString();
        } catch (Exception e) {
            e.printStackTrace();

        }
        return str;
    }

    public static void main(String[] args) {
        System.out.println(md5("123123"));
        System.out.println(md5_salt("123123").length());
        System.out.println(md5_salt("123123"));
        String s = new Date().toString();
        System.out.println(s);
    }


}
