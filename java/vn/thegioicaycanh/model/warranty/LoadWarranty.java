package vn.thegioicaycanh.model.warranty;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.util.Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoadWarranty {
    // Insert warranty
    public static boolean saveWarranty(warranty warranty){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                String sql = "INSERT INTO warranty(order_id, user_id, pro_id) VALUES ("+warranty.getOrder_id() + "," +
                        warranty.getUser_id() + "," + warranty.getPro_id() + ")";
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
    // Update warranty
    public static boolean updateWarranty(warranty warranty){
        try{
            String sql = "UPDATE warranty " +
                    "SET order_id = ?, user_id = ?, pro_id = ?, title = ?, message = ?, img = ?, date_created = ?,`status` = ?, email = ? " +
                    "WHERE id = ?";
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,warranty.getOrder_id());
            preparedStatement.setInt(2, warranty.getUser_id());
            preparedStatement.setInt(3,warranty.getPro_id());
            preparedStatement.setString(4, warranty.getTitle());
            preparedStatement.setString(5, warranty.getMessage());
            preparedStatement.setString(6,warranty.getImg());
            preparedStatement.setString(7,Util.dateFormat(warranty.getDate_created()));
            preparedStatement.setInt(8, warranty.getStatus());
            preparedStatement.setString(9, warranty.getEmail());
            preparedStatement.setInt(10,warranty.getId());
            synchronized (preparedStatement){
                System.out.println(sql);
                preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return true;
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
}
