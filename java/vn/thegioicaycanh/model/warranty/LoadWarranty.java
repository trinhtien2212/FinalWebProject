package vn.thegioicaycanh.model.warranty;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.util.Util;

import java.sql.SQLException;
import java.sql.Statement;

public class LoadWarranty {
    public static boolean saveWarranty(warranty warranty){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                String sql = "INSERT INTO warranty(order_id,user_id, pro_id, message, img ,date_created, status) " +
                        "VALUES (" + warranty.getOrder_id() + "," + warranty.getUser_id() + ", "+ warranty.getPro_id()+", '"+ warranty.getMessage() + "','" + warranty.getImg() + "','" + Util.dateFormat(warranty.getDate_created()) + "', "+warranty.getStatus() + ")";
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
}
