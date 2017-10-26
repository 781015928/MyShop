package com.czg.myshop.common.utils.security;

import com.opensymphony.oscache.util.StringUtil;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

/**
 * Description:
 * Author:     gaocl
 * Date:       2016/12/15
 * Version:     V1.0.0
 * Update:     更新说明
 */
public class DesIvUtil {

    public static final String ENC = "UTF-8";
    private static byte[] IV = {0x12, 0x34, 0x56, 0x78, (byte) 0x90, (byte) 0xAB, (byte) 0xCD, (byte) 0xE0};

    public static void main(String[] args) throws Exception {
      encrypt("hello word !", "加密因子");
    }

    public static String encrypt(String str, String factor) throws Exception {
        String result = "";
        if (!StringUtil.isEmpty(str)) {

            Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
            DESKeySpec desKeySpec = new DESKeySpec(factor.substring(0, 8).getBytes(ENC));
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
//            SecureRandom sr = new SecureRandom();
//            cipher.init(Cipher.ENCRYPT_MODE, securekey, sr);
            IvParameterSpec iv = new IvParameterSpec(IV);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            byte[] bts = cipher.doFinal(str.getBytes(ENC));
            //String rs = byte2hex(bts);
            String rs = Base64Util.encode(bts);
            int interval = rs.length() / factor.length();
            StringBuilder sb = new StringBuilder(rs.length() + factor.length() + 4);
            int p1 = 0, p2 = 0;
            while (true) {
                if (sb.length() >= rs.length() + factor.length()) break;

                if (sb.length() % (interval + 1) == 0 && sb.length() < factor.length() * (interval + 1)) {
                    sb.append(factor.charAt(p2++));
                } else {
                    sb.append(rs.charAt(p1++));
                }
            }
            sb.append(String.format("%s%s", "#", factor.length()));
            result = sb.toString();
//            for (int i = 0; i < rs.length(); i++) {
//                if (i % factor.length() == 0) {
//                    result += factor;
//                }
//                result += rs.charAt(i);
//            }
//            result += "#" + factor.length();
        }
        System.out.println("加密乱入串===========================>" + result);
        return result;
    }

    //二进制转十六进制
    public static String byte2hex(byte[] b) {

        if (null == b) {
            return null;
        }

        StringBuffer hs = new StringBuffer("");
        String stmp = "";
        for (int n = 0; n < b.length; n++) {
            stmp = (Integer.toHexString(b[n] & 0XFF));
            if (stmp.length() == 1) {
                hs.append("0").append(stmp);
            } else {
                hs.append(stmp);
            }
        }
        return hs.toString().toUpperCase();
    }





    private static byte[] encrypt(byte[] data, byte[] key) throws Exception {
        // 生成一个可信任的随机数源
        SecureRandom sr = new SecureRandom();

        // 从原始密钥数据创建DESKeySpec对象
        DESKeySpec dks = new DESKeySpec(key);

        // 创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey securekey = keyFactory.generateSecret(dks);

        // Cipher对象实际完成加密操作
        Cipher cipher = Cipher.getInstance("DES");

        // 用密钥初始化Cipher对象
        cipher.init(Cipher.ENCRYPT_MODE, securekey);

        return cipher.doFinal(data);
    }

}
