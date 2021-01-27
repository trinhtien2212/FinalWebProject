package vn.thegioicaycanh.model.user;

import org.apache.http.impl.conn.SystemDefaultRoutePlanner;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.notifications.Notifications;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LoadUser {

    public static boolean saveUserLoginByFb_GG(String email, String name) {
        boolean isSaved = false;
        String sql = "insert into user(name,email,avatar,`password`,active,role_id,date_created) values(?,?,'imgs/user/default_avarta',-1,1,1,CURRENT_DATE);";
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            synchronized (preparedStatement) {
                int row = preparedStatement.executeUpdate();
                if (row == 1)
                    isSaved = true;
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isSaved;
    }

    public static User loadAUserByEmail(String email) {
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select * from user where email=?");
            preparedStatement.setString(1, email);
            User user = null;
            synchronized (preparedStatement) {
                ResultSet rs = preparedStatement.executeQuery();
                if (rs.next()) {
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

    public static User loadUserById(int id) {
        List<User> list = loadUserFromSQL("select * from user where id=" + id);
        if (list != null) {
            return list.get(0);
        }
        return null;

    }

    public static List<User> loadUserFromSQL(String sql) {
        List<User> list = new ArrayList<User>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery(sql);
                while (rs.next()) {
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

    public static boolean excuteSql(String sql) {
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
    public static boolean updateUser(String name, String birthday, int phone, String email, String city, String distric, String ward, String detailaddress, int user_id) {
        String sql = "Update user set address = '" + detailaddress + "," + ward + "," + distric + "," + city + "', name ='" + name + "', phone= " + phone + ",email='" + email + "'birthday='" + birthday + "' where id=" + user_id;
        return excuteSql(sql);
    }

    public static User getUser(ResultSet rs) {
        if (rs == null)
            return null;
        User user = new User();
        try {
            user.setId(rs.getInt(1));
            user.setName(rs.getString(2));
            user.setAvatar(rs.getString(3));
            user.setPassword(rs.getLong(4));
            user.setEmail(rs.getString(5));
            user.setPhone(rs.getLong(6));
            user.setAddress(rs.getString(7));
            user.setSex(rs.getByte(8) == 1 ? "Nam" : "Nữ");
            user.setBirthday(rs.getDate(9));
            user.setActive(rs.getByte(10) == 1 ? true : false);
            user.setAbout(rs.getString(11));
            user.setRole_id(rs.getInt(12));
            user.setDate_created(rs.getDate(13));
            return user;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    // Dem co bao nhieu user
    public static int sumOfUser(String sql) {
        int sum = 0;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery(sql);
                if (rs.next()) {
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

    public static List<User> loadUserFormSql(String sql) {
        List<User> list = new ArrayList<User>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    list.add(getUser(resultSet));
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

    public static int getMaxUserId() {
        int id = 0;
        Statement statement = null;
        try {
            statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery("select max(id) from user");
                if (resultSet.next())
                    id = resultSet.getInt(1);
                resultSet.close();
            }
            statement.close();
            return id;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public static boolean insertUser(String name, String email, String pass, String phone, int sex, String birthday, String address, int active, int role_id, String date_created) {
        int isInserted = 0;
        String sql = "insert into user(name,email,phone,sex,birthday,address,active,role_id,password,id,date_created,avatar) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            int id = getMaxUserId() + 1;
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            long passKey = id * name.hashCode() * pass.hashCode();
            peSetAttribute(pe, name, email, phone, sex, birthday, address, active, role_id);
            pe.setLong(9,passKey);
            pe.setInt(10, id);
            pe.setString(11, date_created);
            pe.setString(12,"imgs/user/default_avatar.png");
            synchronized (pe) {
                isInserted = pe.executeUpdate();
            }
            pe.close();
            return isInserted == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    private static void peSetAttribute(PreparedStatement pe, String name, String email, String phone, int sex, String birthday, String address, int active, int role_id) {
        try {
            pe.setString(1, name);
            pe.setString(2, email);
            pe.setString(3, phone);
            pe.setInt(4, sex);
            pe.setString(5, birthday);
            pe.setString(6, address);
            pe.setInt(7, active);
            pe.setInt(8, role_id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static boolean updateUser(int id, String name, String email, String pass, String phone, int sex, String birthday, String address, int active, int role_id) {
        int updated = 0;
        String sql = "update user set name = ? , email= ? , phone= ? , sex =? , birthday =? , address = ? , active= ? , role_id = ? ";
        if(pass!=null)
            sql +=" , password = ?  where id = ?";
        else sql+=" where id = ?";
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);

            peSetAttribute(pe, name, email, phone, sex, birthday, address, active, role_id);
           if(pass !=null){
               long passkey = id * email.hashCode() * pass.hashCode();
               pe.setLong(9,passkey);
               pe.setInt(10, id);
           }else{
               pe.setInt(9, id);
           }
            System.out.println("pass: "+pass);
            System.out.println(pe.toString());
            synchronized (pe) {
                updated = pe.executeUpdate();
            }
            pe.close();
            return updated == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
