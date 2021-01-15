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
        session.setAttribute("title","Trang của tôi");
        int user_id = (int)session.getAttribute("user_id");
        User user = LoadUser.loadUserById(user_id);
//        getDetailAddress(user.getAddress(),request);
        // Ma giam gia
        List<CouponCode> dataCouponCode = Coupon_Con_DB.loadCouponCodeByUser((int) session.getAttribute("user_id"));
        session.setAttribute("coupon_code_data", dataCouponCode);
        // San pham yeu thich
        List<Product> data = ProductEntity.loadFavoriteProduct((int) session.getAttribute("user_id"));
        session.setAttribute("data",data);
        request.getRequestDispatcher("user_page/user.jsp").forward(request,response);
    }
    protected void getDetailAddress(String address, HttpServletRequest request){
        String [] arr = address.split(",");
        String city = arr[arr.length-1];
        String district = arr[arr.length-2];
        String ward = arr[arr.length-3];
        String detail = "";
        for(int i=0; i< arr.length-3;i++){
            detail += arr[i] + " ";
        }
        request.setAttribute("city", city);
        request.setAttribute("district", district);
        request.setAttribute("ward", ward);
        request.setAttribute("detail", detail);
    }
}
