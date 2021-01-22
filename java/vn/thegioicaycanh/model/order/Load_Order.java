package vn.thegioicaycanh.model.order;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Load_Order {
    public static List<Order> loadOderByUserId(int user_id){
        List<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM `order` WHERE user_id = ?";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,user_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    orderList.add(getOrder(resultSet));
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderList;
    }

    private static Order getOrder(ResultSet resultSet) {
        Order order = new Order();
        try{
            order.setId(resultSet.getInt(1));
            order.setUser_id(resultSet.getInt(2));
            order.setSale_id(resultSet.getInt(3));
            order.setShip_id(resultSet.getInt(4));
            order.setPayment(resultSet.getInt(5) == 1 ? true : false);
            order.setNote(resultSet.getString(6));
            order.setPhone(resultSet.getInt(7));
            order.setAddress(resultSet.getString(8));
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return order;
    }

    public static void main(String[] args) {
//        for (Order o : loadOderByUserId(1)) {
//            System.out.println(o.getId());
//        }
    }
}
