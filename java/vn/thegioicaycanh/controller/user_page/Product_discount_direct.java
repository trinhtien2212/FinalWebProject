package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.home_page.Home_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/shopping-sale")
public class Product_discount_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleParameter(request);
        request.setAttribute("page_menu","discount");
        request.setAttribute("title","Giảm giá");
        request.setAttribute("home_page_data",new Home_page());
        request.getRequestDispatcher("handlePagination").forward(request,response);
    }

    private void handleParameter(HttpServletRequest request) {
        int pages = 1;
        byte cate_id = 0;
        byte type_view = 1;
        byte sort_id = 0;
        byte filter_date = 0;
        String url ="";
        String sqlCondition=" where is_sale=1 ";
        if(request.getParameter("pages") != null) {
            pages = Integer.parseInt(request.getParameter("pages"));
        }
        if(request.getParameter("cate_id") != null) {
            cate_id = Byte.parseByte(request.getParameter("cate_id"));
            sqlCondition +=sqlCondition.isEmpty()?" category_id="+cate_id:" and category_id="+cate_id;
            url +="&cate_id="+cate_id;
        }
        if(request.getParameter("type_view") != null) {
            type_view = Byte.parseByte(request.getParameter("type_view"));
            url +="&type_view="+type_view;
        }
        if(request.getParameter("sort_id") !=null) {
            sort_id = Byte.parseByte(request.getParameter("sort_id"));
            url +="&sort_id="+sort_id;
            if(sort_id ==1){
                sqlCondition =sqlCondition.isEmpty()?" order by price asc":" where "+sqlCondition+" order by price asc";
            }else{
                sqlCondition =sqlCondition.isEmpty()?" order by price desc":" where "+sqlCondition+" order by price desc";
            }
        }else{
            sqlCondition =sqlCondition.isEmpty()?"":" where "+sqlCondition;
        }
        if(request.getParameter("filter_date") != null){
            filter_date = Byte.parseByte(request.getParameter("filter_date"));
            url += "&filter_date="+filter_date;
            if(filter_date == 1){   // date_end_sale is today
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale = CURRENT_DATE order by date_end_sale asc" : " where "+sqlCondition+ " date_end_sale = CURRENT_DATE order by date_end_sale asc";
            }else if(filter_date == 2){     // date_end_sale <= 1 week
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY) order by date_end_sale asc" : " where "+sqlCondition+ " date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY) order by date_end_sale asc";
            }else if(filter_date == 3){    // date_end_sale <= 1/2 month
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 15 DAY) order by date_end_sale asc" : " where "+sqlCondition+ " date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 15 DAY) order by date_end_sale asc";
            }else if(filter_date == 4) { // date_end_sale <= 1 month
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY) order by date_end_sale asc" : " where "+sqlCondition+ " date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY) order by date_end_sale asc";
            }else{
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale > DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY) order by date_end_sale asc" : " where "+sqlCondition+ " date_end_sale > DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY) order by date_end_sale asc";
            }
        }
        request.setAttribute("pages",pages);
        request.setAttribute("type_page","shopping");
        request.setAttribute("cate_id",cate_id);
        request.setAttribute("type_view",type_view);
        request.setAttribute("sort_id",sort_id);
        request.setAttribute("filter_date", filter_date);
        request.setAttribute("url",url);
        if(type_view == 1){
            request.setAttribute("numOfItemLoad",18);
            request.setAttribute("direct_to","user_page/product-discount.jsp");
        }else if(type_view == 2){
            request.setAttribute("numOfItemLoad",10);
            request.setAttribute("direct_to","user_page/coupon-code.jsp");
        }
        request.setAttribute("sql","select * from product "+sqlCondition+" limit ");
//        request.setAttribute("sumOfItems_sql","select count(*) from product "+sqlCondition);

    }
}
