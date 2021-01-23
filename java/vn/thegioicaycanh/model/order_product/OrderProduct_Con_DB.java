package vn.thegioicaycanh.model.order_product;

import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.favorist_list.FavoristList;

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
}
