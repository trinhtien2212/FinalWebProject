package vn.thegioicaycanh.model.order;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.order_product.OrderProduct;
import vn.thegioicaycanh.model.order_product.OrderProduct_Con_DB;
import vn.thegioicaycanh.model.rating.Rating;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;

import java.sql.Date;
import java.util.List;

public class Order {
    private int id;
    private int user_id;
    private int sale_id;
    private int ship_id;
    private boolean payment;
    private String note;
    private long phone;
    private String address;
    private int status;
    private Date date_created;

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getSale_id() {
        return sale_id;
    }

    public void setSale_id(int sale_id) {
        this.sale_id = sale_id;
    }

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
    }

    public boolean isPayment() {
        return payment;
    }

    public void setPayment(boolean payment) {
        this.payment = payment;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int isStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
    public static String getNameUserById(int id){
        return new Rating().getNameById(new Order().getUser_id());
    }
    public static String getNameProductByOrderId(int id){
        List<OrderProduct> orderProducts= OrderProduct_Con_DB.loadOrderProductFormSql("select * from order_product");
        for(OrderProduct o:orderProducts){
            if(o.getOrder_id()==id){
                return OrderProduct_Con_DB.getNameProductById(o.getPro_id());
            }
        }
        return null;
    }
    public static String getNameUserByUserId(int id){
        return new Rating().getNameById(id);
    }
    public static double getPriceByOrderId(int id){
        List<OrderProduct> orderProducts= OrderProduct_Con_DB.loadOrderProductFormSql("select * from order_product");
        for(OrderProduct o:orderProducts){
            if(o.getOrder_id()==id){
                return OrderProduct_Con_DB.getPriceProductById(o.getPro_id());
            }
        }
        return 0.0;
    }
//    public static String getNamStatusById(int status){
//
//    }
    public static void main(String[] args) {
        System.out.println(getPriceByOrderId(3));
    }
}
