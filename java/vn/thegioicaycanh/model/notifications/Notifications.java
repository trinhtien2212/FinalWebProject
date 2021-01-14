package vn.thegioicaycanh.model.notifications;

public class Notifications {
    private String email;

    public Notifications() {
    }

    public String getEmail() {
        return email;
    }
    public String getListEmail(){
        return Notification_Con_DB.getStringsNotifications();
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
