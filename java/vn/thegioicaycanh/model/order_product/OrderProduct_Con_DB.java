package vn.thegioicaycanh.model.order_product;

import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.favorist_list.FavoristList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderProduct_Con_DB {
    public static List<OrderProduct> loadOrderProductFormSql(String sql){
        List<OrderProduct>list = new ArrayList<OrderProduct>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getOrderProduct(resultSet));
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
    public static OrderProduct getOrderProduct(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        OrderProduct orderProduct = new OrderProduct();
        try {
            orderProduct.setOrder_id(resultSet.getInt(1));
            orderProduct.setPro_id(resultSet.getInt(2));
            orderProduct.setQuantity(resultSet.getInt(3));
            orderProduct.setPrice(resultSet.getDouble(4));
            return orderProduct;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static String getNameProductById(int proid){
        return new ProductEntity().getNameProductById(proid);
    }
    public static double getPriceProductById(int proid){
        return new ProductEntity().getPriceProductById(proid);
    }
    public static List<OrderProduct> loadOrderProductByOrderId(int order_id){
        List<OrderProduct> productList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT p.id, p.`name`, op.quantity, p.price, o.id, o.date_created, u.id, o.`status`, (sum(p.price * op.quantity) + s.price) AS total, o.payment, o.address, o.phone, o.note, u.`name`, s.price " +
                    "FROM `order` o JOIN order_product op ON o.id = op.order_id JOIN product p ON op.pro_id=p.id JOIN shipment s ON s.id=o.ship_id JOIN `user` u ON u.id = o.user_id " +
                    "WHERE o.id = ? " + "GROUP BY o.id, o.date_created, u.name, o.`status`, o.payment, o.address, o.phone, o.note, u.`name`, s.price, p.id, p.`name`, op.quantity, p.price");
            preparedStatement.setInt(1,order_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    OrderProduct orderProduct = new OrderProduct();
                    orderProduct.setPro_id(resultSet.getInt(1));
                    orderProduct.setPro_name(resultSet.getString(2));
                    orderProduct.setQuantity(resultSet.getInt(3));
                    orderProduct.setPrice(resultSet.getDouble(4));
                    productList.add(orderProduct);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return productList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return productList;
    }
}
