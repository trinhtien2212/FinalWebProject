package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/handlePagination")
public class HandlePaginationButton extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = (String)request.getAttribute("sql");
        String countSql = (String)request.getAttribute("sumOfItems_sql");
        System.out.println("sql: "+sql);
        //get page index
        int pages=1;
        if(request.getAttribute("pages") !=null){
            pages = (int)request.getAttribute("pages");
        }

        //cal the sumOfPage
        int sumOfItems=0;
        int last = (int)request.getAttribute("numOfItemLoad");
        String type_page = (String)request.getAttribute("type_page");
        if(type_page.contains("blog")){
            sumOfItems = Blog_Con_DB.sumOfBlogs();
        }else if(type_page.contains("shopping")){
            System.out.println("co vao shopping");
            sumOfItems = ProductEntity.sumOfProduct(countSql);
            System.out.println("sumOfItems: "+sumOfItems);
        }
        request.setAttribute("sumOfItems",sumOfItems);
        int sumOfPage = sumOfItems/last;
        System.out.println("sumOfPages: "+sumOfPage);
        if(sumOfItems % last !=0)
            sumOfPage++;
        if(sumOfPage==0)
            sumOfPage=1;

        //cal first and last;
        int first = 0;
        if(pages<=0){
            pages=1;
        }else if(pages>sumOfPage && sumOfPage>0){
            pages=sumOfPage;
        }
        request.setAttribute("pages",pages);
        first =(pages-1)*last;


       //create List
        sql +=first+","+last;
        System.out.println(sql);
        if(type_page.contains("blog")){
            System.out.println("co vo blog");
            List<Blog> list = Blog_Con_DB.loadLimitBlog(first,last);
            System.out.println("Blog: "+list.size());
            request.setAttribute("data",list);
        }else if(type_page.contains("shopping")){
            System.out.println("co vo shopping");
            List<Product> list = ProductEntity.loadProductFormSql(sql);
            System.out.println("Product:; "+list.size());
            request.setAttribute("data",list);
        }else if(type_page.contains("discount")){
            List<CouponCode> list= Coupon_Con_DB.loadCouponCodeLimit(first,last);
        }
        request.setAttribute("first",first);
        request.setAttribute("last",last);

        //cal back and next button
        String url = (String)request.getAttribute("url");
        request.setAttribute("back",type_page+"?pages="+(pages==1?1:pages-1)+url);
        request.setAttribute("next",type_page+"?pages="+(pages<sumOfPage?pages+1:pages)+url);

        //cal start, end num for loop and determine is still more pages
        int start =1;
        int end = 5;
        if(sumOfPage>5 && pages+2<sumOfPage){
            request.setAttribute("isStill",true);
        }else request.setAttribute("isStill",false);
        if(sumOfPage<=5){
            start=1;
            end=sumOfPage;
        } else if(pages>3 && pages+2<=sumOfPage) {
            start = pages - 2;
            end = pages + 2;
        }else if(pages+1==sumOfPage || pages ==sumOfPage) {
            start = pages - (sumOfPage - pages == 1 ? 3 : 4);
            end = pages + (sumOfPage - pages);
        }
        request.setAttribute("start",start);
        request.setAttribute("end",end);
        System.out.println("first: "+first);
        System.out.println("sql: "+sql);
        System.out.println("count_sql: "+countSql);
        System.out.println("back:"+request.getAttribute("back"));
        System.out.println("next:"+request.getAttribute("next"));
        System.out.println("pages:"+request.getAttribute("pages"));
        System.out.println("isStill:"+request.getAttribute("isStill"));
        System.out.println("start:"+request.getAttribute("start"));
        System.out.println("end:"+request.getAttribute("end"));
        request.getRequestDispatcher((String)request.getAttribute("direct_to")).forward(request,response);

    }

}
