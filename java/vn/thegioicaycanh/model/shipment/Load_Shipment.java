package vn.thegioicaycanh.model.shipment;

import vn.thegioicaycanh.controller.admin_page.Shipment_direct;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Load_Shipment {
    public static List<Shipment> loadShipment_view(){
        List<Shipment> shipmentList = new ArrayList<>();
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery("SELECT s.id, o.id, s.date_created, s.type_weight, s.price FROM shipment s JOIN `order` o ON s.id = o.ship_id");
                while (resultSet.next()){
                    Shipment shipment = new Shipment();
                    shipment.setId(resultSet.getInt(1));
                    shipment.setOrder_id(resultSet.getInt(2));
                    shipment.setDate_created(resultSet.getDate(3));
                    shipment.setType_weight(resultSet.getInt(4));
                    shipment.setPrice(resultSet.getDouble(5));
                    shipmentList.add(shipment);
                }
                resultSet.close();
            }
            statement.close();
            return shipmentList;
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return shipmentList;
    }

    public static void main(String[] args) {
        for(Shipment s : loadShipment_view()){
            System.out.println(s.getId() + "\t" + s.getOrder_id() + "\t" + s.getType_weight());
        }
    }
}
