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
            return couponcode;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(loadAllCouponCode());
    }
}
