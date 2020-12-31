package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.ProductEntity;

import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;
import vn.thegioicaycanh.model.header_footer.Social_media;
import vn.thegioicaycanh.model.home_page.Home_page;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/home")
public class Home_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        initAttr();
        request.setAttribute("page_menu","home");
        request.setAttribute("title","Trang chủ");
        request.setAttribute("home_page_data",new Home_page());
        request.setAttribute("discount_pros",ProductEntity.loadDiscountProducts(8));
        request.setAttribute("hight_light_pros",ProductEntity.loadHightLightProducts());
        request.setAttribute("new_pros",ProductEntity.loadNewProducts(9));
        request.getRequestDispatcher("user_page/home.jsp").forward(request,response);
    }
    protected void initAttr(){
        ServletContext context = getServletContext();
        if(context.getAttribute("header") == null) {
            context.setAttribute("header",LoadHeaderFooter.loadHeader());
            context.setAttribute("category",LoadHeaderFooter.loadCategories());
        }
        if(context.getAttribute("address") == null){
            context.setAttribute("address",LoadHeaderFooter.loadAdress());
        }
        if(context.getAttribute("social_media") == null){
            context.setAttribute("social_media",new Social_media());
        }
    }
}
