package vn.thegioicaycanh.model.rating_type;


import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class Rating_Type_Con_DB {

    public static List<Rating_Type> loadrating_typeFormSql(String sql) {
        List<Rating_Type> list = new ArrayList<Rating_Type>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    list.add(getRatingType(resultSet));
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
    public static Rating_Type getRatingType(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Rating_Type rating_type = new Rating_Type();
        try {
            rating_type.setId(resultSet.getInt(1));
            rating_type.setName(resultSet.getString(2));
            rating_type.setStatus(resultSet.getInt(3));
            return rating_type ;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        for(Rating_Type a:loadrating_typeFormSql("select * from rating_type")){
            System.out.println(a.getId()+"/"+a.getName()+"/"+a.getStatus());
        }
    }
}
