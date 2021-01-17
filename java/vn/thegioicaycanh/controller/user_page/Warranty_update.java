package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.warranty.LoadWarranty;
import vn.thegioicaycanh.model.warranty.warranty;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/warrantity_update")
public class Warranty_update extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int warranty_id = Integer.parseInt(request.getParameter("warranty_id"));
        int order_id = Integer.parseInt(request.getParameter("order_id"));
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        int pro_id = Integer.parseInt(request.getParameter("pro_id"));
        String title = request.getParameter("title");
        String message = request.getParameter("message");
        String img = request.getParameter("img");
        String date_created = request.getParameter("date_created");
        int status = Integer.parseInt(request.getParameter("status"));
        String email = request.getParameter("email");

        warranty warranty = new warranty(warranty_id, order_id, user_id, pro_id,title, message,img,status,email);
        boolean saved = LoadWarranty.updateWarranty(warranty);
        if(saved){
            request.setAttribute("status", 1);
        } else {
            request.setAttribute("status", 0);
        }

    }
}
