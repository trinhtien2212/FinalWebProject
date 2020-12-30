package vn.thegioicaycanh.model.header_footer;

public class Address {
    private String address;
    private long phone;
    private String email;
    private String timeOpen;

    public Address(String address, long phone, String email, String timeOpen) {
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.timeOpen = timeOpen;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTimeOpen() {
        return timeOpen;
    }

    public void setTimeOpen(String timeOpen) {
        this.timeOpen = timeOpen;
    }
}
