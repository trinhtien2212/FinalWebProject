package vn.thegioicaycanh.model.util;

import java.text.NumberFormat;
import java.util.Locale;

public class Util {
    public static String formatCurrency(double price){
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(new Locale("vi","VN"));
        return numberFormat.format(price);
    }

    public static void main(String[] args) {
        System.out.println(Util.formatCurrency(5334323));
    }
}
