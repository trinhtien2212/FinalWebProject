package vn.thegioicaycanh.model.util;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Util {
    public static String formatCurrency(double price){
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(new Locale("vi","VN"));
        return numberFormat.format(price);
    }
    public static String dateFormat(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
    public static void main(String[] args) {

        System.out.println(Util.formatCurrency(5334323));
        System.out.println(dateFormat(new Date()));
    }
}
