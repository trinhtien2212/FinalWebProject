package vn.thegioicaycanh.model.coupon_code;

public class CouponCode {
    private int id;
    private String name;
    private int coupon_code_type_id;
    private int percent;
    private String discription;

    public CouponCode() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCoupon_code_type_id() {
        return coupon_code_type_id;
    }

    public void setCoupon_code_type_id(int coupon_code_type_id) {
        this.coupon_code_type_id = coupon_code_type_id;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }
}
