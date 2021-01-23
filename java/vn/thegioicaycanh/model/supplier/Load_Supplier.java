package vn.thegioicaycanh.model.supplier;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Load_Supplier {
    public static List<Supplier> loadSupplier_view(){
        List<Supplier> supplierList = new ArrayList<>();
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery("SELECT * FROM supplier");
                while (resultSet.next()){
                    Supplier supplier = new Supplier();
                    supplier.setId(resultSet.getInt(1));
                    supplier.setLogo(resultSet.getString(2));
                    supplier.setName(resultSet.getString(3));
                    supplier.setAddress(resultSet.getString(4));
                    supplier.setPhone(resultSet.getString(5));
                    supplier.setEmail(resultSet.getString(6));
                    supplierList.add(supplier);
                }
                resultSet.close();
            }
            statement.close();
            return supplierList;
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return supplierList;
    }

    public static int sumOfSupplier(String sql){
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

    public static void main(String[] args) {
//        for(Supplier s: loadSupplier_view()){
//            System.out.println(s.getName());
//        }
        System.out.println(sumOfSupplier("select count(id) from supplier"));
    }
}
