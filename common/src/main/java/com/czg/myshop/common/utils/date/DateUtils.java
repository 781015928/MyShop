package com.czg.myshop.common.utils.date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    private final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String currentTime(){
        return sdf.format(new Date());
    }

    public static String formatDate(Date date) {

        return sdf.format(date);
    }

    public static Date parse(String strDate) {
        try {
            return sdf.parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
