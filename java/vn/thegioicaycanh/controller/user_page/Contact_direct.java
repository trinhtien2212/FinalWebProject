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
        request.setAttribute("page_menu","contact");
        request.setAttribute("title","Liên hệ");
        request.getRequestDispatcher("user_page/contact.jsp").forward(request,response);
    }
}
