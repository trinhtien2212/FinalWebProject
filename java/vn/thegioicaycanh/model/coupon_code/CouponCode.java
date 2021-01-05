package vn.thegioicaycanh.model.coupon_code;

import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType;
import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType_Con_DB;

import java.util.Date;

public class CouponCode {
    private int id;
    private String name;
    private int coupon_code_type_id;
    private int percent;
    private String discription;
    private String code;
    private Date date_end;

    public CouponCode() {
    }
    public static String getLinkImage(int id){
        return CouponCodeType_Con_DB.getLinkImageFromCouponType(id);
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }

    public static void main(String[] args) {
        System.out.println(getLinkImage(3));
    }
}
