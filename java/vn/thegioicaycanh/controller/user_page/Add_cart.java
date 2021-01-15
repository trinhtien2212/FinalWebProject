package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.user.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/cart-handle")
public class Add_cart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (request.getParameter("action") == null || request.getParameter("id") == null || request.getParameter("curren-page") == null)
            return;
        //neu action = add
        //neu action = sub
        Cart cart = (Cart) session.getAttribute("cart");
        int product_id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        if (session.getAttribute("user_id") != null) {
            int user_id = (int)session.getAttribute("user_id");
            if (action.equalsIgnoreCase("add"))
                cart.addProduct(product_id,user_id);
            else if (action.equalsIgnoreCase("sub"))
                cart.subProduct(product_id,user_id);
        }else{
            if(action.equalsIgnoreCase("add"))
                cart.addProduct(product_id);
            else if(action.equalsIgnoreCase("sub"))
                cart.subProduct(product_id);
        }
        String currentPage = request.getParameter("current-page");
        response.sendRedirect(currentPage);
    }
}
