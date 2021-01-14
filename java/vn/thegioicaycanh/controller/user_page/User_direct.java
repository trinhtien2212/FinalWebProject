package vn.thegioicaycanh.controller.user_page;

import org.apache.http.HttpRequest;
import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;
import vn.thegioicaycanh.model.user_code.UserCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/user")
public class User_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int user_id = (int)session.getAttribute("user_id");
        User user = LoadUser.loadUserById(user_id);
        // Ma giam gia
        List<CouponCode> dataCouponCode = Coupon_Con_DB.loadCouponCodeByUser((int) session.getAttribute("user_id"));
        session.setAttribute("coupon_code_data", dataCouponCode);
        // San pham yeu thich
        List<Product> data = ProductEntity.loadFavoriteProduct((int) session.getAttribute("user_id"));
        session.setAttribute("data",data);
        session.setAttribute("title","Trang của tôi");
        request.getRequestDispatcher("user_page/user.jsp").forward(request,response);
    }
    protected void getDetailAddress(String address, HttpServletRequest request){
        String tp = "";
        String q;
        String p;
        String ct;
        request.setAttribute("tp",tp);

    }
}
