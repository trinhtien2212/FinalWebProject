package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;
import vn.thegioicaycanh.model.header_footer.Social_media;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Contact_direct", urlPatterns = "/contact")
public class Contact_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        initAttr();
        request.setAttribute("page_menu","contact");
        request.setAttribute("title","Liên hệ");
        request.getRequestDispatcher("user_page/contact.jsp").forward(request,response);
    }
    protected void initAttr(){
        ServletContext context = getServletContext();
        if(context.getAttribute("header") == null) {
            context.setAttribute("header", LoadHeaderFooter.loadHeader());
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
