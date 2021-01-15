package vn.thegioicaycanh.model.user;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.util.Util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Load_ForgetPass {
    public static boolean saveForgetPass(ForgetPass fp){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                String sql = "INSERT INTO forget_pass " +
                        "VALUES ('" + fp.getEmail() + "'," + fp.getUser_id() + "," + fp.getKey_forget() + ",'" + Util.dateFormat(fp.getDate_end()) + "')";
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
    public static boolean updateNewPass(int np,int user_id){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                String sql = " update user set password="+np+" where id="+user_id;
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

    public static void main(String[] args) {
//        ForgetPass fp = new ForgetPass(2,"trinhtien2212@gmail.com",677364694);
//        System.out.println(saveForgetPass(fp));
        updateNewPass(-801806291,1);

    }
}
