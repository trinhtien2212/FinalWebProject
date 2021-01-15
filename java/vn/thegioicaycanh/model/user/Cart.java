package vn.thegioicaycanh.model.user;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, Cart_item> products;

    //Da dang nhap:
    public Cart(int user_id) {
        this.products = new HashMap<Integer, Cart_item>();
        loadCart(user_id);
    }

    public void addProduct(int id, int user_id) {
        if (products.containsKey(id)) {
            products.get(id).addQuantity();
            updateQuantity(id, products.get(id).getQuantity(), user_id);
        } else {
            Product product = ProductEntity.loadProductById(id);
            if (product != null) {
                products.put(product.getId(), new Cart_item(product.getId(), product.getImg(), product.getName(), product.getPrice(), product.getPrice_sale(), 1));
                insert(id, 1, user_id);
            }
        }
    }

    public void subProduct(int id, int user_id) {
        if (products.containsKey(id)) {
            int currentQuantity = products.get(id).getQuantity();
            if (currentQuantity == 1) {
                products.remove(id);
                delete(id, user_id);
            } else {
                products.get(id).subQuantity();
                updateQuantity(id, products.get(id).getQuantity(), user_id);
            }
        }
    }

    //Chua dang nhap
    public Cart() {
        this.products = new HashMap<Integer, Cart_item>();
    }

    public void addProduct(int id) {
        if (products.containsKey(id)) {
            products.get(id).addQuantity();
        } else {
            Product product = ProductEntity.loadProductById(id);
            if (product != null) {
                products.put(product.getId(), new Cart_item(product.getId(), product.getImg(), product.getName(), product.getPrice(), product.getPrice_sale(), 1));
            }
        }
    }

    public void subProduct(int id) {
        if (products.containsKey(id)) {
            int currentQuantity = products.get(id).getQuantity();
            if (currentQuantity == 1) {
                products.remove(id);
            } else {
                products.get(id).subQuantity();
            }
        }
    }


    public void loadCart(int user_id) {
        String sql = "select p.id,p.img,p.name,p.price,p.price_sale,s.quantity from shopping_cart s join product p on s.pro_id=p.id where user_id = ?";
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, user_id);
            synchronized (pt) {
                ResultSet rs = pt.executeQuery();
                while (rs.next()) {
                    Cart_item item = new Cart_item();
                    item.setId(rs.getInt(1));
                    item.setImg(rs.getString(2));
                    item.setName(rs.getString(3));
                    item.setPrice(rs.getDouble(4));
                    item.setPrice_sale(rs.getDouble(5));
                    item.setQuantity(rs.getInt(6));
                    item.calTotalPrice();
                    products.put(item.getId(), item);
                }
                rs.close();
            }
            pt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void updateQuantity(int pro_id, int quantity, int user_id) {
        String sql = "update shopping_cart set quantity = ? where user_id=? and pro_id=?";
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, quantity);
            pt.setInt(2, user_id);
            pt.setInt(3, pro_id);
            synchronized (pt) {
                pt.executeUpdate();
            }
            pt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void insert(int pro_id, int quantity, int user_id) {
        String sql = "insert into shopping_cart values (?,?,?)";
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, user_id);
            pt.setInt(2, pro_id);
            pt.setInt(3, quantity);
            synchronized (pt) {
                pt.executeUpdate();
            }
            pt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delete(int pro_id, int user_id) {
        String sql = "delete from shopping_cart where user_id=? and pro_id =?";
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, user_id);
            pt.setInt(2, pro_id);
            synchronized (pt) {
                pt.executeUpdate();
            }
            pt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
