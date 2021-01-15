package vn.thegioicaycanh.model.user;

import org.apache.http.impl.conn.SystemDefaultRoutePlanner;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LoadUser {

    public static User loadAUserByEmail(String email){
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select * from user where email=?");
            preparedStatement.setString(1,email);
            User user = null;
            synchronized (preparedStatement){
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next()){
                    user = getUser(rs);
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
    public static User loadUserById(int id){
        List<User>list = loadUserFromSQL("select * from user where id="+id);
        if(list !=null){
            return list.get(0);
        }
        return null;

    }
    public static List<User>loadUserFromSQL(String sql){
        List<User>list = new ArrayList<User>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet rs = statement.executeQuery(sql);
                while(rs.next()){
                    list.add(getUser(rs));
                }
                rs.close();
            }
            statement.close();
            return list;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static boolean excuteSql(String sql){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                System.out.println(sql);
                statement.executeUpdate(sql);
            }
            statement.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
//   ,
    public static boolean updateUser(String name, String birthday, int phone,String email,String city,String distric,String ward, String detailaddress,int user_id){
        String sql= "Update user set address = '"+detailaddress+","+ward+","+distric+","+city+"', name ='"+name+"', phone= "+phone+",email='"+email+"'birthday='"+birthday+"' where id="+user_id;
        return excuteSql(sql);
    }
    public static User getUser(ResultSet rs){
        User user = new User();
        try {
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
            rs.close();
            return  user;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
       return null;
    }

}
