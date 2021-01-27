package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/shop-detail")
public class ShopDetail_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page_menu","shopping");
        request.setAttribute("title","Chi tiết sản phẩm");
        int id=Integer.parseInt(request.getParameter("id"));
        Product products= ProductEntity.loadProductById(id);
        request.setAttribute("product",products);
        request.getRequestDispatcher("user_page/shop-detail.jsp").forward(request,response);
    }
}
