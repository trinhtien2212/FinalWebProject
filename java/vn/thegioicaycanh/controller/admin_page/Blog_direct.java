package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.header_footer.Category;
import vn.thegioicaycanh.model.header_footer.Load_Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/blogadmin")
public class Blog_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //type = 1: xem ds
        //type = 2: chinh sua categories
        //type = 3: them categories
        //type =4: xoa category
        int pages=1;
        if(request.getParameter("pages") != null){
            pages = Integer.parseInt(request.getParameter("pages"));
        }
        //xu li hien thi danh sach
        String type = request.getParameter("type");
        if(type ==null){
            type ="1";
        }
        if(Integer.parseInt(type) == 1){
            List<Blog> blog_view = Blog_Con_DB.loadBlog_view();
            request.setAttribute("b_view",blog_view);
            request.getRequestDispatcher("handlePagination").forward(request,response);
        }else if(Integer.parseInt(type) == 2){
            int id = Integer.parseInt(request.getParameter("id"));

        }
        request.setAttribute("sumOfItems_sql","SELECT COUNT(*) FROM blog ");
        request.setAttribute("numOfItemLoad",10);
        request.setAttribute("page_menu","blogadmin");
        request.setAttribute("type_page","blog");
        request.setAttribute("direct_to","admin_page/blog.jsp");
        request.setAttribute("title","Bài viết");
            }
}
