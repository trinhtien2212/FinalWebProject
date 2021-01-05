package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.blog.Blog_Con_DB;
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

@WebServlet(urlPatterns = "/blog")
public class Blog_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        initAttr();
        int pages =0;
        handleParameter(request);
        if(request.getParameter("pages") != null);
        pages = Integer.parseInt(request.getParameter("pages"));
        request.setAttribute("pages",pages);
        request.setAttribute("type_page","shopping-grid");
        request.setAttribute("numOfItemLoad",10);
        request.setAttribute("direct_to","user_page/blog.jsp");
        request.setAttribute("sql","select * from blog limit ");
        request.setAttribute("countsql","select count(*) from blog");
        request.setAttribute("page_menu","blog");
        request.setAttribute("title","Bài viết");
        request.setAttribute("home_page_data",new Home_page());
//        request.setAttribute("blog_data", Blog_Con_DB.loadLimitBlog(1,10));
        request.setAttribute("newBlog",Blog_Con_DB.loadNewBlogs(12));
        request.getRequestDispatcher("handlePagination").forward(request,response);

    }
    private void handleParameter(HttpServletRequest request){
        String url ="";
        String sql="select * from blog";
        int pages = 1;
        request.setAttribute("type_page","blog");
        request.setAttribute("url",url);
        request.setAttribute("pages",pages);
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
