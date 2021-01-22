package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.feeback.Feedback;
import vn.thegioicaycanh.model.feeback.Load_Feedback;
import vn.thegioicaycanh.model.warranty.LoadWarranty;
import vn.thegioicaycanh.model.warranty.warranty;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/warranty")
public class Warranty_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("title","Bảo hành");
//        String mail = "";
//        int order_id;
//        String guarantee_title = "";
//        String description = "";
//        String war_img = "";
//
//        if (request.getParameter("mail") != null && request.getParameter("order_id") != null && request.getParameter("guarantee_title") != null && request.getParameter("description") != null) {
//            mail = request.getParameter("mail");
//            order_id = Integer.parseInt(request.getParameter("order_id"));
//            guarantee_title = request.getParameter("guarantee_title");
//            description = request.getParameter("description");
//            war_img = request.getParameter("war_img");
//            boolean saved = LoadWarranty.saveWarranty(new warranty(order_id,));
//            if (saved) {
//                //neu chua gui thi status = 0
//                //neu da gui thanh cong status = 1
//                request.setAttribute("status", 1);
//            } else request.setAttribute("status", 0);
//
//        }else{
//            request.setAttribute("status",0);
//        }
//        request.getRequestDispatcher("user_page/warranty.jsp").forward(request,response);
    }
}
