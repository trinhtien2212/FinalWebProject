package vn.thegioicaycanh.model.header_footer;

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

    public static void main(String[] args) {
        List<Category>c = loadCategory_view();
        for(Category c1:c){
            System.out.println(c1);
        }
    }
}
