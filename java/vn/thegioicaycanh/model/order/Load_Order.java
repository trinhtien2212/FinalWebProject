package vn.thegioicaycanh.model.order;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.rating.Rating;
import vn.thegioicaycanh.model.shipment.Load_Shipment;
import vn.thegioicaycanh.model.shipment.Shipment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Load_Order {
    public static List<Order> loadOderByUserId(int user_id){
        List<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM `order` WHERE user_id = ?";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,user_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    orderList.add(getOrder(resultSet));
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderList;
    }
    public static List<Order> loadOrderFormSql(String sql){
        List<Order>list = new ArrayList<Order>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getOrder(resultSet));
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
    private static Order getOrder(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Order order = new Order();
        try{
            order.setId(resultSet.getInt(1));
            order.setUser_id(resultSet.getInt(2));
            order.setSale_id(resultSet.getInt(3));
            order.setShip_id(resultSet.getInt(4));
            order.setPayment(resultSet.getInt(5) == 1 ? true : false);
            order.setNote(resultSet.getString(6));
            order.setPhone(resultSet.getInt(7));
            order.setAddress(resultSet.getString(8));
            order.setStatus(resultSet.getInt(9));
            order.setDate_created(resultSet.getDate(10));
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return order;
    }
    public static int addOrder(int user_id, int coupon_code_id, int type_weight, String note, String phone, String address, int status, String date_created, double total_price) {
        int shipment_id=Load_Shipment.addShipment(type_weight);
        int updated=0;
        int id = getNextOrderId();
        String sql = "insert into `order`(user_id,ship_id,payment,note,phone,address,status,date_created,total_price,id ";
        if(coupon_code_id!=0)
            sql+=" , sale_id) values(?,?,?,?,?,?,?,?,?,?,?)";
        else sql+=") values(?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setInt(1,user_id);
            pe.setInt(2,shipment_id);
            pe.setInt(3,0);
            pe.setString(4,note);
            pe.setString(5,phone);
            pe.setString(6,address);
            pe.setInt(7,status);
            pe.setString(8,date_created);
            pe.setDouble(9,total_price);
            pe.setInt(10,id);
            if(coupon_code_id!=0)
                pe.setInt(11,coupon_code_id);
            System.out.println(pe.toString());
            synchronized (pe){
                updated=pe.executeUpdate();
            }
            pe.close();
            if(updated==1)
                return id ;
            else return 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public static int getNextOrderId(){
        int result=0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select max(id) from `order`");
            synchronized (pe){
                ResultSet re = pe.executeQuery();
                if(re.next())
                    result=re.getInt(1)+1;
                re.close();
            }
            pe.close();
            return result;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
return  result;
    }
    public static void main(String[] args) {
        System.out.println(loadOrderFormSql("SELECT * FROM `order` "));
//        System.out.println(loadOderByUserId(5));
    }
}
