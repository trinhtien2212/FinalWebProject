package vn.thegioicaycanh.model.coupon_code_type;

import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CouponCodeType_Con_DB {
    public static List<CouponCodeType> loadAllCouponCodeType(){
        String sql="SELECT * from coupon_code_type";
        return loadCouponCodeTypeFormSql(sql);
    }
    public static String getLinkImage(int id){
        for(CouponCodeType a: loadAllCouponCodeType()){
            if(a.getId()==id){
                return a.getAvatar();
            }
        }
        return null;
    }
    public static List<CouponCodeType> loadCouponCodeTypeFormSql(String sql){
        List<CouponCodeType>list = new ArrayList<CouponCodeType>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getCouponCodeType(resultSet));
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
    public static CouponCodeType getCouponCodeType(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        CouponCodeType couponcodetype = new CouponCodeType();
        try {
            couponcodetype.setId(resultSet.getInt(1));
            couponcodetype.setName(resultSet.getString(2));
            couponcodetype.setAvatar(resultSet.getString(3));
            return couponcodetype;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(getLinkImage(1));
    }
}
