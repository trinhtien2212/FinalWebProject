package vn.thegioicaycanh.model.order;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.rating.Rating;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
    public static List<Order> loadOrderFormSql(String sql){
        List<Order>list = new ArrayList<Order>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getOrder(resultSet));
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
    private static Order getOrder(ResultSet resultSet) {
        if (resultSet == null)
            return null;
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
            order.setStatus(resultSet.getInt(9));
            order.setDate_created(resultSet.getDate(10));
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return order;
    }

    // Load lên dashboard
    public static List<Order> loadOrderNear(int limit){
        List<Order> list = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT o.id, o.date_created, u.name, o.`status`, (sum(p.price * op.quantity) + s.price) AS total FROM `order` o JOIN order_product op ON o.id = op.order_id JOIN product p ON op.pro_id=p.id JOIN shipment s ON s.id=o.ship_id JOIN `user` u ON u.id = o.user_id " +
                    "GROUP BY o.id, o.date_created, u.name, o.`status` " +
                    "ORDER BY date_created " +
                    "LIMIT ?");
            preparedStatement.setInt(1,limit);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setDate_created(resultSet.getDate(2));
                    order.setUser_name(resultSet.getString(3));
                    order.setStatus(resultSet.getInt(4));
                    order.setTotal_pay(resultSet.getDouble(5));
                    list.add(order);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return list;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return list;
    }
    // load lên trang danh sách đơn hàng
    public static List<Order> loadOrder_view(){
        List<Order> orderList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT o.id, o.date_created, u.name, o.`status`, (sum(p.price * op.quantity) + s.price) AS total " +
                    "FROM `order` o JOIN order_product op ON o.id = op.order_id JOIN product p ON op.pro_id=p.id JOIN shipment s ON s.id=o.ship_id JOIN `user` u ON u.id = o.user_id " +
                    "GROUP BY o.id, o.date_created, u.name, o.`status`");
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setDate_created(resultSet.getDate(2));
                    order.setUser_name(resultSet.getString(3));
                    order.setStatus(resultSet.getInt(4));
                    order.setTotal_pay(resultSet.getDouble(5));
                    orderList.add(order);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return orderList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderList;
    }
    public static void main(String[] args) {
//        System.out.println(loadOrderFormSql("SELECT * FROM `order` "));
//        System.out.println(loadOderByUserId(5));
        System.out.println(loadOrder_view());
    }
}
