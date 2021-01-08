package vn.thegioicaycanh.model.user;

import java.util.Calendar;
import java.util.Date;

public class ForgetPass {
    private int user_id;
    private String email;
    private long key_forget;
    private Date date_end;

    public ForgetPass(int user_id,String email,long pass) {
        this.user_id=user_id;
        this.email=email;
        this.createKey_Forget(user_id,email,pass);
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE,3);
        this.date_end=calendar.getTime();
        createKey_Forget(user_id,email,pass);
    }
    public void createKey_Forget(int user_id,String email,long pass){
        this.key_forget = user_id*email.hashCode()*pass;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getKey_forget() {
        return key_forget;
    }

    public void setKey_forget(long key_forget) {
        this.key_forget = key_forget;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }
}
