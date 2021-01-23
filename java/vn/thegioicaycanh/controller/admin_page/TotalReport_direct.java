package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.notifications.Notification_Con_DB;
import vn.thegioicaycanh.model.order.Load_Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/totalreport")
public class TotalReport_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","total-report");
        request.setAttribute("totalreports", Load_Order.loadOrderFormSql("SELECT * FROM `order` "));
//        System.out.println(request.getAttribute("emails"));
        request.getRequestDispatcher("total-report.jsp").forward(request,response);
    }
}
