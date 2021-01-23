package vn.thegioicaycanh.model.coupon_code;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Coupon_Con_DB {


    public static List<CouponCode> loadCouponCodeByCoponCodeTypeID(int id) {
        String sql = "SELECT * from coupon_code where coupon_code_type_id =" + id;
        return loadCouponCodeFormSql(sql);
    }

    public static List<CouponCode> loadCouponCodeLimit(int start, int num) {
        String sql = "SELECT * from coupon_code where coupon_code_type_id limit" + start + "," + num;
        return loadCouponCodeFormSql(sql);
    }

    public static String getImageLink(int id) {
        return Coupon_Con_DB.getImageLink(id);
    }

    public static List<CouponCode> loadAllCouponCode() {
        String sql = "SELECT * from coupon_code";
        return loadCouponCodeFormSql(sql);
    }

    public static List<CouponCode> loadCouponCodeFormSql(String sql) {
        List<CouponCode> list = new ArrayList<CouponCode>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
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
    public static List<CouponCode> loadCouponCodeByUser(int user_id) {
        String sql = "SELECT * FROM coupon_code\n" +
                "WHERE id IN (SELECT uc.coupon_code_id FROM user_code uc JOIN `user` u ON uc.user_id=u.id WHERE uc.user_id = " + user_id + ")";
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

    public static List<CouponCode> loadCouponCodeByUserId(int user_id) {
        List<CouponCode> list = new ArrayList<>();
        String sql = "SELECT c.name, DATEDIFF(c.date_end_sale,CURRENT_DATE), ct.`name` " +
                "FROM user u INNER JOIN user_code uc ON u.id = uc.user_id " +
                "INNER JOIN coupon_code c ON uc.coupon_code_id = c.id " +
                "INNER JOIN coupon_code_type ct ON ct.id = c.coupon_code_type_id " +
                "WHERE u.id = ?";
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,user_id);
            synchronized (preparedStatement) {
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    list.add(getCouponCodeType(resultSet));
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public static CouponCode getCouponCodeType(ResultSet resultSet) {
        CouponCode couponCode = new CouponCode();
        try {
            couponCode.setName(resultSet.getString(1));
            couponCode.setDate_number(resultSet.getInt(2));
            couponCode.setCoupon_code_type_name(resultSet.getString(3));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return couponCode;
    }

    public static List<CouponCode> loadCouponCode_view(){
        List<CouponCode> couponCodes = new ArrayList<>();
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery("SELECT cp.id, cp.`name`, ct.`name`, cp.percent, cp.date_end_sale FROM coupon_code cp JOIN coupon_code_type ct ON cp.coupon_code_type_id = ct.id");
                while(resultSet.next()){
                    CouponCode couponCode = new CouponCode();
                    couponCode.setId(resultSet.getInt(1));
                    couponCode.setName(resultSet.getString(2));
                    couponCode.setCoupon_code_type_name(resultSet.getString(3));
                    couponCode.setPercent(resultSet.getInt(4));
                    couponCode.setDate_end(resultSet.getDate(5));
                    couponCodes.add(couponCode);
                }
                resultSet.close();
            }
            statement.close();
            return couponCodes;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return couponCodes;
    }
    public static void main(String[] args) {
        for (CouponCode c : loadCouponCode_view()
        ) {
            System.out.println(c.getCoupon_code_type_name());
        }
    }
}
