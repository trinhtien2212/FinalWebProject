package vn.thegioicaycanh.model.user;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoadUser {
    public static User loadUser(int id){
        try {
            PreparedStatement preparedStatement = DBCPDataSource.getConnection().prepareStatement("select * from user where id = ?");
            preparedStatement.setInt(1,id);
            User user = new User();
            synchronized (preparedStatement){
                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next()){

                    user.setId(rs.getInt(1));
                    user.setName(rs.getString(2));
                    user.setAvatar(rs.getString(3));
                    user.setPassword(rs.getLong(4));
                    user.setEmail(rs.getString(5));
                    user.setPhone(rs.getLong(6));
                    user.setAddress(rs.getString(7));
                    user.setSex(rs.getByte(8)==1?"Nam":"Nữ");
                    user.setBirthday(rs.getDate(9));
                    user.setActive(rs.getByte(10)==1?true:false);
                    user.setAbout(rs.getString(11));
                    user.setRole_id(rs.getInt(12));
                    user.setDate_created(rs.getDate(13));
                }

               rs.close();
            }
            preparedStatement.close();
           return user;
        } catch (SQLException throwables) {

            throwables.printStackTrace();

        }
        return null;
    }

}
