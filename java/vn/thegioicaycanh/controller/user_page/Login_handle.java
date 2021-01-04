package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Login_handle")
public class Login_handle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email="";
        String pass="";
        if(request.getParameter("email")!=null){
            email=request.getParameter("email");
        }
        if(request.getParameter("pass")!=null){
            pass = request.getParameter("pass");
        }
        if(email.isEmpty() || pass.isEmpty()){
            response.sendRedirect("");
        }
        User user = LoadUser.loadAUserByEmail(email);
        if(user == null){
            response.sendRedirect("");
        }
        long passHashCode = user.getId()*email.hashCode()*pass.hashCode();
        if(passHashCode != user.getPassword()){
            response.sendRedirect("");
        }else {}
    }
}
