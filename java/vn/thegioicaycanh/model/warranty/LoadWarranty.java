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
    public static boolean insertWarranty(int order_id, int user_id, int pro_id){
        try {
           PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("INSERT INTO warranty(order_id, user_id, pro_id) VALUES (?,?,?)");
           preparedStatement.setInt(1,order_id);
           preparedStatement.setInt(2,user_id);
           preparedStatement.setInt(3,pro_id);
           synchronized (preparedStatement){
               preparedStatement.executeQuery();
           }
           preparedStatement.close();
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
