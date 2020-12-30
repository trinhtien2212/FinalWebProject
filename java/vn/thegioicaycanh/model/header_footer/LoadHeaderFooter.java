package vn.thegioicaycanh.model.header_footer;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoadHeaderFooter {
    public static List<Category> loadCategories() {
        List<Category> categories = new ArrayList<>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery("SELECT * from categories");
                while (rs.next()) {
                    Category c = new Category();
                    c.setId(rs.getInt(1));
                    c.setName(rs.getString(2));
                    c.setActive(rs.getByte(3) == 1);
                    c.setSlug(rs.getString(4));
                    categories.add(c);
                }
                rs.close();
            }
            statement.close();
            return categories;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;

    }

    public static Header loadHeader() {
        Header header = new Header();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery("select * from header");
                if (rs.next()) {
                    header.setName(rs.getString(2));
                    header.setLogo(rs.getString(3));
                    header.setShortcut(rs.getString(4));
                }
                rs.close();
            }
            statement.close();
            return header;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<Address> loadAdress(){
        List<Address> adds = new ArrayList<Address>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {

                ResultSet resultSet = statement.executeQuery("Select * from address");
                while (resultSet.next()) {
                    String address = resultSet.getString(2);
                    long phone = resultSet.getLong(3);
                    String email = resultSet.getString(4);
                    String time = resultSet.getString(5);
                    adds.add(new Address(address, phone, email, time));
                }
                resultSet.close();
            }
            statement.close();
            return adds;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
