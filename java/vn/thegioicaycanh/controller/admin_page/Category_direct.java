package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.header_footer.Category;
import vn.thegioicaycanh.model.header_footer.Load_Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/cate")
public class Category_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //type = 1: xem ds
        //type = 2: chinh sua categories
        //type = 3: them categories
        //type =4: xoa category

        //xu li hien thi danh sach
        String type = request.getParameter("type");
        if(type ==null){
           type ="1";
        }
        if(Integer.parseInt(type) == 1){
            List<Category>categories_view = Load_Category.loadCategory_view();
            request.setAttribute("c_view",categories_view);
            request.getRequestDispatcher("admin_page/categories.jsp").forward(request,response);
        }else if(Integer.parseInt(type) == 2){
            int id = Integer.parseInt(request.getParameter("id"));

        }

    }
}
