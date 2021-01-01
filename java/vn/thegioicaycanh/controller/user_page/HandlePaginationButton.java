package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HandlePaginationButton")
public class HandlePaginationButton extends HttpServlet {
    private int first = 0;
    private int last = 0;
    private int pages = 1;
    private int sumOfItems;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("pages") !=null){
            pages = Integer.parseInt(request.getParameter("pages"));
        }
        if(request.getParameter("type-page").equalsIgnoreCase("blog")){
            sumOfItems = Blog_Con_DB.sumOfBlogs();
        }else if(request.getParameter("type-page").equalsIgnoreCase("product")){
            sumOfItems = ProductEntity.sumOfProduct();
        }
        if(sumOfItems <=9){
            first =0;
            last = sumOfItems;
        }else {
            first = (pages-1)*9;
            last = 9;
        }
        request.setAttribute("first",first);
        request.setAttribute("last",last);

        int back = 0;
        if(pages ==0 || pages ==1){
            back =1;
        }else {
            back = pages -1;
        }
        request.setAttribute("back",back);
        int start =1;
        int end = 5;
        int sumOfPage = (int)Math.round(sumOfItems*1.0/9);
        if(pages>3 && pages+2<=sumOfPage){
            start = pages -2;
            end = pages +2;
        }
        request.setAttribute("pages",pages);
        request.setAttribute("start",start);
        request.setAttribute("end",end);
        request.setAttribute("isStill",end<sumOfPage?true:false);
        request.setAttribute("next",pages<sumOfPage?pages+1:pages);
        request.getRequestDispatcher("/"+request.getParameter("direct-to")).forward(request,response);
    }
}
