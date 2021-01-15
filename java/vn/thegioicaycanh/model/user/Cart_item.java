package vn.thegioicaycanh.model.user;

import vn.thegioicaycanh.model.Product.Product;

public class Cart_item {
    private int id;
    private String img;
    private String name;
    private double price;
    private double price_sale;
    private int quantity;
    private double totalPrice;

    public Cart_item(int id, String img, String name, double price, double price_sale, int quantity) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.price = price;
        this.price_sale = price_sale;
        this.quantity = quantity;
        calTotalPrice();
    }

    public Cart_item() {
    }
    public void addQuantity(){
        this.quantity++;
        calTotalPrice();
    }
    public void subQuantity(){
        this.quantity--;
        calTotalPrice();
    }
    public void calTotalPrice(){
        this.totalPrice = quantity*getPriceForCal();
    }
   public double getPriceForCal(){
        if(price_sale==-1)
            return this.price;
        return this.price_sale;
   }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPrice_sale() {
        return price_sale;
    }

    public void setPrice_sale(double price_sale) {
        this.price_sale = price_sale;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
