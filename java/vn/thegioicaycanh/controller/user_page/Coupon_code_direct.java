package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/coupon_code")
public class Coupon_code_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page_menu","discount");
        request.setAttribute("title","Mã giảm giá");
        request.setAttribute("coupon_code_data", Coupon_Con_DB.loadCouponCodeByCoponCodeTypeID(1));
        request.getRequestDispatcher("user_page/coupon-code.jsp").forward(request,response);
    }
}
