package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.order.Load_Order;
import vn.thegioicaycanh.model.order.Order;
import vn.thegioicaycanh.model.order_product.OrderProduct;
import vn.thegioicaycanh.model.order_product.OrderProduct_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/view_order")
public class View_order_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "total-report");
        request.setAttribute("title", "Chi tiết đơn hàng");
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = Load_Order.loadOrder_view(id);
        request.setAttribute("view_order",order);
        List<OrderProduct> productList = OrderProduct_Con_DB.loadOrderProductByOrderId(id);
        request.setAttribute("list_pro", productList);
        String status = request.getParameter("status");
        boolean isUpdate = Load_Order.updateStatus(id,status);
        request.getRequestDispatcher("view-order.jsp").forward(request, response);
    }
}
