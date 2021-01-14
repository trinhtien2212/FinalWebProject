package vn.thegioicaycanh.model.Product;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class ProductEntity {
    public static List<Product> loadDiscountProducts(int num) {
        String sql = "select *" +
                "from product p " +
                "WHERE is_sale=1 and discription is not null " +
                "and content is not null " +
                "ORDER BY percent_sale DESC LIMIT " + num;
        return loadProductFormSql(sql);
    }

    public static List<Product> loadNewProducts(int num) {
        String sql = "SELECT * from product " +
                "order by date_created desc LIMIT " + num;
        return loadProductFormSql(sql);
    }

    public static List<Product> loadMostRating(int num) {
        String sql = "SELECT * from product p join rating r on p.id=r.pro_id where r.rating_type_id  = (SELECT  max(r1.rating_type_id) from rating r1) LIMIT " + num;
        return loadProductFormSql(sql);
    }
    public static List<Product> loadFirstPros(int num) {
        String sql = "SELECT * from product p LIMIT " + num;
        return loadProductFormSql(sql);
    }
    public static List<Product> loadHightLightProducts() {
        String sql = "select p.* from product  p join " +
                " (select pro_id  from order_product GROUP BY pro_id ORDER BY count(pro_id) desc limit 15 ) as most_pro on most_pro.pro_id=p.id";
        return loadProductFormSql(sql);
    }

    public static List<Product> loadAllProducts() {
      return loadProductFormSql("select * from product");
    }
    // Load product in shopping page
    public static List<Product> loadShoppingProducts(int start, int num) {
        return loadProductFormSql("select * from product limit "+start+","+num);
    }

    public static int sumOfProduct(String sql){
        int sum = 0;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet rs = statement.executeQuery(sql);
                if(rs.next()){
                    sum = rs.getInt(1);
                }
                rs.close();
            }
            statement.close();
            return sum;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    // Filter product by category
    public static List<Product> filterProductByCategory(int id, int start, int num) {
        return loadProductFormSql("SELECT * FROM product WHERE category_id = "+id+" LIMIT "+start+","+num);
    }
    // Filter product by type_weight
    public static List<Product> filterProductBySize(int id, int start, int num) {
        return loadProductFormSql("SELECT * FROM product WHERE type_weight = "+id+" LIMIT "+start+","+num);
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

    public static List<Product> loadPriceProducts(int start,int num) {
        return loadProductFormSql("select * from product order by price asc limit "+start+","+num);
    }


    public static List<Product>loadProductFormSql(String sql){
        List<Product>list = new ArrayList<Product>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getProduct(resultSet));
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
    public static List<Product> searchProduct(String key){
        Map<Integer,Product>map = new LinkedHashMap<Integer, Product>();
        List<Product>ab_pros = loadProductFormSql("select * from product where name like '%"+key+"%'");
        convertListToMap(map,ab_pros);
        String[] words = key.split(" ");
        for(String word:words){
            if(word.equalsIgnoreCase("cây")
                    || word.equalsIgnoreCase("chậu")
                    || word.equalsIgnoreCase("cay")
                    || word.equalsIgnoreCase("chau"))
                continue;;
            List<Product>pros = loadProductFormSql("select * from product where name like '% "+word+" %' or discription like '% "+key+" %'or content like '% "+key+" %'");
            convertListToMap(map,pros);
        }
        return convertMapToList(map);
    }
    public static List<Product> convertMapToList(Map<Integer,Product>map){
        List<Product> list = new ArrayList<Product>();
        for(Product p:map.values()){
            list.add(p);
        }
        return list;
    }
    public static void convertListToMap(Map<Integer,Product>map,List<Product>list){
        for(Product product : list){
            if(!map.containsKey(product.getId()))
                map.put(product.getId(),product);
        }
    }
    public static int loadMax_MinPrice(String sql){
        int max_price =0;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet rs = statement.executeQuery(sql);
                if(rs.next()){
                    max_price=rs.getInt(1);
                }
                rs.close();
            }
            statement.close();
            return max_price;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return max_price;
    }
    // Load san pham yeu thich
    public static List<Product> loadFavoriteProduct(int user_id){
        String sql = "SELECT u.`name`, p.`name`\n" +
                "FROM `user` u INNER JOIN favorist_list f ON u.id = f.user_id\n" +
                "INNER JOIN product p ON f.pro_id = p.id\n" +
                "WHERE u.id = " + user_id;
        return loadProductFormSql(sql);
    }
public static void vidu(String s){
        s +="tien";
    System.out.println(s);
}

    public static void main(String[] args) {
//        String s= "Shopping_sorted_By_Price_Direct".toLowerCase();
//        if(s.contains("shopping"))
//            System.out.println("co chua");
//        else System.out.println("khong chua");
//        System.out.println(loadMax_MinPrice("select min(price) from product"));

//        List<Integer>list = new ArrayList<>();
//        list.add(1);
//        list.add(2);
//        list.add(3);
//        List<Integer>list1= list.subList(1,(5+1)>list.size()?list.size():5+1);
//        System.out.println(list1);

    }



}
