package vn.thegioicaycanh.model.header_footer;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Load_Category {
    public static List<Category> loadCategory_view() {
        List<Category> categories = new ArrayList<Category>();
        try {
            PreparedStatement statement = DBCPDataSource.preparedStatement("select c.*,s.sl from categories c join (select category_id, count(id) as sl from product group by category_id) as s on c.id=s.category_id");
            synchronized (statement) {
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    Category c = new Category();
                    c.setId(rs.getInt(1));
                    c.setName(rs.getString(2));
                    c.setActive(rs.getByte(3) == 1);
                    c.setSlug(rs.getString(4));
                    c.setNumOfProduct(rs.getInt(5));
                    categories.add(c);
                }
                rs.close();
            }
            statement.close();
            return categories;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categories;
    }

    public static List<Category> loadCategoryBy(String category) {
        List<Category> categories = new ArrayList<Category>();

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from categories where id like ?");
            pe.setString(1,category);
            synchronized (pe){
                ResultSet resultSet = pe.executeQuery();
                System.out.println(resultSet.getStatement().toString());
                while(resultSet.next()) categories.add(getCategory(resultSet));
                resultSet.close();
            }
            pe.close();
            return categories;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categories;
    }

    private static Category getCategory(ResultSet resultSet) {
        if(resultSet != null) {
            Category category = new Category();
            try {
                category.setId(resultSet.getInt(1));
                category.setName(resultSet.getString(2));
                byte active = resultSet.getByte(3);
                category.setActive(active == 1);
                category.setSlug(resultSet.getString(4));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            return category;
        }
        return null;
    }

    public static void main(String[] args) {
        List<Category>c = loadCategory_view();
        for(Category c1:c){
            System.out.println(c1);
        }
    }
}
