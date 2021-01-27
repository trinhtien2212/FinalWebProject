package vn.thegioicaycanh.model.order_product;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderProduct {
    private int order_id;
    private int pro_id;
    private int quantity;
    private double price;

    public OrderProduct() {
    }




    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
