package vn.thegioicaycanh.model.notifications;

import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Notification_Con_DB {
    public static String getStringsNotifications(){
        String sql="select * from notifications";
        String result="";
        List<Notifications> listNod=loadNotificationsFormSql(sql);
        for(Notifications a:listNod){
            result+=a.getEmail()+",";
        }
        return result;
    }
    public static List<Notifications> loadNotificationsFormSql(String sql){
        List<Notifications>list = new ArrayList<Notifications>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getNotifications(resultSet));
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
    public static Notifications getNotifications(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Notifications notifications = new Notifications();
        try {
            notifications.setId(resultSet.getInt(1));
            notifications.setEmail(resultSet.getString(2));
            notifications.setDate(resultSet.getDate(3));
            notifications.setStatus(resultSet.getInt(4));
            return notifications;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(getStringsNotifications());
    }
}
