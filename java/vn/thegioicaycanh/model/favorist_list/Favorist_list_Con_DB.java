package vn.thegioicaycanh.model.favorist_list;

import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.notifications.Notifications;
import vn.thegioicaycanh.model.util.Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Favorist_list_Con_DB {
    public static boolean deleteFavoristList(int user_id,int pro_id){
        String sql="delete from favorist_list where user_id="+user_id+" and pro_id="+pro_id;
        return excuteSql(sql);
    }
    public static boolean excuteSql(String sql){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                System.out.println(sql);
                statement.executeUpdate(sql);
            }
            statement.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static List<FavoristList> loadFavoristListFormSql(String sql){
        List<FavoristList>list = new ArrayList<FavoristList>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getFavoristList(resultSet));
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
    public static FavoristList getFavoristList(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        FavoristList favoristList = new FavoristList();
        try {
            favoristList.setUser_id(resultSet.getInt(1));
            favoristList.setPro_id(resultSet.getInt(2));
            return favoristList;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println( deleteFavoristList(1995,156));
    }
}
