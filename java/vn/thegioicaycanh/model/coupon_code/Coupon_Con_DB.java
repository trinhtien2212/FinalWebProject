package vn.thegioicaycanh.model.coupon_code;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Coupon_Con_DB {


    public static List<CouponCode> loadCouponCodeByCoponCodeTypeID(int id){
        String sql = "SELECT * from coupon_code where coupon_code_type_id ="+id;
        return loadCouponCodeFormSql(sql);
    }
    public static List<CouponCode> loadCouponCodeLimit(int start,int num){
        String sql = "SELECT * from coupon_code where coupon_code_type_id limit"+start+","+num;
        return loadCouponCodeFormSql(sql);
    }
    public static String getImageLink(int id){
        return Coupon_Con_DB.getImageLink(id);
    }
    public static List<CouponCode> loadAllCouponCode(){
        String sql="SELECT * from coupon_code";
        return loadCouponCodeFormSql(sql);
    }
    public static List<CouponCode> loadCouponCodeFormSql(String sql){
        List<CouponCode>list = new ArrayList<CouponCode>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getCouponCode(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return list;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    // Load coupon code by user_id
    public static List<CouponCode> loadCouponCodeByUser(int id){
        String sql = "SELECT c.name, c.date_end_sale " +
                "     FROM user u INNER JOIN user_code uc ON u.id = uc.user_id " +
                "     INNER JOIN coupon_code c ON uc.coupon_code_id = c.id " +
                "     WHERE u.id = " + id;
        return loadCouponCodeFormSql(sql);
    }
    public static CouponCode getCouponCode(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        CouponCode couponcode = new CouponCode();
        try {
            couponcode.setId(resultSet.getInt(1));
            couponcode.setName(resultSet.getString(2));
            couponcode.setCoupon_code_type_id(resultSet.getInt(3));
            couponcode.setPercent(resultSet.getInt(4));
            couponcode.setDiscription(resultSet.getString(5));
            couponcode.setCode(resultSet.getString(6));
            return couponcode;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(loadCouponCodeByUser(2));
    }
}
