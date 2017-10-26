package com.czg.myshop.common.utils.valid;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 正则工具类 提供验证邮箱、手机号、电话号码、身份证号码、数字等方法
 *
 * @author lvyang
 * @time 2015-12-12
 */
public class RegexUtils {
    static final Pattern getNumbers = Pattern.compile("|(16[0-9])\\d{5}365|^((145)|(147)|(13[0-9])|(17[0-3,5-8])|(15[^4,\\\\D])|(18[0-9]))\\d{8}$");

    static final Pattern phone = Pattern.compile("|(16[0-9])\\d{5}365|^((145)|(147)|(13[0-9])|(17[0-3,5-8])|(15[^4,\\\\D])|(18[0-9]))\\d{8}$");
    public static List<String> getNumbers(String content) {
        List<String> digitList = new ArrayList<String>();
        Matcher m = getNumbers.matcher(content);
        while (m.find()) {
            String find = m.group(1).toString();
            digitList.add(find);
        }
        return digitList;
    }

    /**
     * 判断手机号是否合法
     *
     * @param s
     * @return
     */
    public static boolean isMobile(CharSequence s) {
        if (TextUtils.isEmpty(s)) {
            return true;
        }

        Matcher m = phone.matcher(s);
        return m.matches();
    }
    static  Pattern isPassword= Pattern.compile("^(?=.*[0-9])(?=.*[a-zA-Z]).{6,20}$");
    public static boolean isPassword(CharSequence s) {
        String regExp = "^(?=.*[0-9])(?=.*[a-zA-Z]).{6,20}$"; //字母+数字,要求密码长度6-20位
        //  Pattern p = Pattern.compile(regExp);
        // Matcher m = p.matcher(pwd.trim());
        if (s.length() < 6 || s.length() > 20) {
            return false;
        }
        Matcher m = isPassword.matcher(s);
        return m.matches();
    }

    public static boolean isPasswordNotNull(CharSequence s) {
        String regExp = "^(?=.*[0-9])(?=.*[a-zA-Z]).{6,20}$"; //字母+数字,要求密码长度6-20位
        //  Pattern p = Pattern.compile(regExp);
        // Matcher m = p.matcher(pwd.trim());
        if (s.length() < 6 || s.length() > 20) {
            return false;
        }
//        Pattern p = Pattern.compile("^(?=.*[0-9])(?=.*[a-zA-Z]).{6,20}$");
//        Matcher m = p.matcher(s);
//        return m.matches();
        return true;
    }

    /**
     * 验证Email
     *
     * @param email email地址，格式：zhangsan@sina.com，zhangsan@xxx.com.cn，xxx代表邮件服务商
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkEmail(String email) {
        String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        return Pattern.matches(regex, email);
    }

    /**
     * 验证身份证号码
     *
     * @param idCard 居民身份证号码15位或18位，最后一位可能是数字或字母
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkIdCard(String idCard) {
        // String regex = "[1-9]\\d{13,16}[a-zA-Z0-9]{1}";
        String regex = "[1-9]\\d{13,16}[0-9x]{1}";
        return Pattern.matches(regex, idCard);
    }

    /**
     * 验证固定电话号码
     *
     * @param phone 电话号码，格式：国家（地区）电话代码 + 区号（城市代码） + 电话号码，如：+8602085588447
     *              <p>
     *              <b>国家（地区） 代码 ：</b>标识电话号码的国家（地区）的标准国家（地区）代码。它包含从 0 到 9
     *              的一位或多位数字， 数字之后是空格分隔的国家（地区）代码。
     *              </p>
     *              <p>
     *              <b>区号（城市代码）：</b>这可能包含一个或多个从 0 到 9 的数字，地区或城市代码放在圆括号——
     *              对不使用地区或城市代码的国家（地区），则省略该组件。
     *              </p>
     *              <p>
     *              <b>电话号码：</b>这包含从 0 到 9 的一个或多个数字
     *              </p>
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkPhone(CharSequence phone) {
        String regex = "(\\+\\d+)?(\\d{3,4}\\-?)?\\d{7,8}$";
        return Pattern.matches(regex, phone);
    }

    /**
     * 验证整数（正整数和负整数）
     *
     * @param digit 一位或多位0-9之间的整数
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkDigit(String digit) {
        String regex = "\\-?[1-9]\\d+";
        return Pattern.matches(regex, digit);
    }

    /**
     * 验证整数和浮点数（正负整数和正负浮点数）
     *
     * @param decimals 一位或多位0-9之间的浮点数，如：1.23，233.30
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkDecimals(String decimals) {
        String regex = "\\-?[1-9]\\d+(\\.\\d+)?";
        return Pattern.matches(regex, decimals);
    }

    /**
     * 验证空白字符
     *
     * @param blankSpace 空白字符，包括：空格、\t、\n、\r、\f、\x0B
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkBlankSpace(String blankSpace) {
        String regex = "\\s+";
        return Pattern.matches(regex, blankSpace);
    }

    /**
     * 验证中文
     *
     * @param chinese 中文字符
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkChinese(String chinese) {
        String regex = "^[\u4E00-\u9FA5]+$";
        return Pattern.matches(regex, chinese);
    }

    /**
     * 验证日期（年月日）
     *
     * @param birthday 日期，格式：1992-09-03，或1992.09.03
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkBirthday(String birthday) {
        String regex = "[1-9]{4}([-./])\\d{1,2}\\1\\d{1,2}";
        return Pattern.matches(regex, birthday);
    }

    /**
     * 验证URL地址
     *
     * @param url 格式：http://blog.csdn.net:80/xyang81/article/details/7705960? 或
     *            http://www.csdn.net:80
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkURL(String url) {
        String regex = "(https?://(w{3}\\.)?)?\\w+\\.\\w+(\\.[a-zA-Z]+)*(:\\d{1,5})?(/\\w*)*(\\??(.+=.*)?(&.+=.*)?)?";
        return Pattern.matches(regex, url);
    }

    /**
     * 匹配中国邮政编码
     *
     * @param postcode 邮政编码
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkPostcode(String postcode) {
        String regex = "[1-9]\\d{5}";
        return Pattern.matches(regex, postcode);
    }

    /**
     * 匹配IP地址(简单匹配，格式，如：192.168.1.1，127.0.0.1，没有匹配IP段的大小)
     *
     * @param ipAddress IPv4标准地址
     * @return 验证成功返回true，验证失败返回false
     */
    public static boolean checkIpAddress(String ipAddress) {
        String regex = "[1-9](\\d{1,2})?\\.(0|([1-9](\\d{1,2})?))\\.(0|([1-9](\\d{1,2})?))\\.(0|([1-9](\\d{1,2})?))";
        return Pattern.matches(regex, ipAddress);
    }
   static final Pattern  isUserName= Pattern.compile("^\\w+$");
    /**
     * 判断用户名格式：以a到z或A到Z开头，后面跟随5到20个任意字符
     *
     * @param username
     * @return
     */
    public static boolean isUserName(String username) {
        Matcher m = isUserName.matcher(username);
        return m.matches();
    }

    /***
     * 过滤特殊字符 只能输入数字字母和汉子
     */
    public static boolean StringFilter(String str) {
        // 只允许字母和数字
        // String regEx = "[^a-zA-Z0-9]";
        // 清除掉所有特殊字符
        // String
        // regEx="[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
        // 不能是数字开头只允许输入英文 数字 和汉字
        // String regEx = "^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]*$";
        // 只能输入数字 英文 和汉字
        String regEx = "^[\u4e00-\u9fa5_a-zA-Z0-9]+$";

        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.matches();
    }

    public static boolean PersonalRenewals(String str) {
        String regEx = "[a-zA-Z0-9]+";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.matches();
    }



    /**
     * @param regex 正则表达式字符串
     * @param str   要匹配的字符串
     * @return 如果str 符合 regex的正则表达式格式,返回true, 否则返回 false;
     */
    private static boolean match(String regex, String str) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    /**
     * @param s
     * @return 检查年龄
     */
    public static boolean checkege(String s) {
        if (TextUtils.isEmpty(s)) return false;

        try {
            return !(Integer.parseInt(s.trim()) < 0 || Integer.parseInt(s.trim()) > 99);

        } catch (Exception e) {
            return false;
        }
    }
}
