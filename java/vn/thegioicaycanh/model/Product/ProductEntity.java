package vn.thegioicaycanh.model.Product;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductEntity {
    public static List<Product> loadDiscountProducts(int num) {
        List<Product> discountProduct = new ArrayList<Product>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            String sql = "select *" +
                    "from product p " +
                    "WHERE is_sale=1 and discription is not null " +
                    "and content is not null " +
                    "ORDER BY percent_sale DESC LIMIT " + num;
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    discountProduct.add(getProduct(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return discountProduct;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static List<Product> loadNewProducts(int num) {

        List<Product> newProducts = new ArrayList<Product>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            String sql = "SELECT * from product " +
                    "order by date_created desc LIMIT " + num;
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    newProducts.add(getProduct(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return newProducts;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static List<Product> loadMostRating(int num) {
        List<Product> mostRatingProducts = new ArrayList<Product>();
        try {
            String sql = "SELECT * from product p join rating r on p.id=r.pro_id where r.rating_type_id  = (SELECT  max(r1.rating_type_id) from rating r1) LIMIT " + num;
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    mostRatingProducts.add(getProduct(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return mostRatingProducts;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
//    public List<Product> loadHightLightProducts(){
//
//        try {
//            List<Product> products = new ArrayList<Product>();
//            Connection connection = DBCPDataSource.getConnection();
//            for(int i = 1;i<7;i++){
//                products.addAll(loadProductBaseOn(connection.createStatement(), "select * from product "));
//            }
//            return loadProductBaseOn(connection.createStatement(),sql);
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return null;
//    }

    public static List<Product> loadAllProducts() {
        List<Product> products = new ArrayList<Product>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery("select * from product");
                while (resultSet.next()) {
                    products.add(getProduct(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return products;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static Product getProduct(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Product product = new Product();
        try {
            product.setId(resultSet.getInt(1));
            product.setName(resultSet.getString(2));
            product.setPrice(resultSet.getDouble(3));
            product.setImg(resultSet.getString(4));
            product.setDescription(resultSet.getString(5));
            product.setContent(resultSet.getString(6));
            product.setSupplier_id(resultSet.getInt(7));
            product.setType_weight(resultSet.getByte(8));
            byte active = resultSet.getByte(9);
            product.setActive(active == 1);
            product.setPercent_sale(resultSet.getByte(10));
            product.setPrice_sale(resultSet.getDouble(11));
            product.setCategory_id(resultSet.getInt(12));
            product.setQuantity(resultSet.getInt(13));
            product.setIs_sale(resultSet.getByte(14) == 1);
            product.setDate_start_sale(resultSet.getDate(15));
            product.setDate_end_sale(resultSet.getDate(16));
            product.setSlug(resultSet.getString(17));
            product.setDate_created(resultSet.getDate(18));

            product.setPercent_sale_past(product.percent_sale_past());
            product.setDayRest(product.dayRest());

            return product;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

}
