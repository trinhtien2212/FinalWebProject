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
        byte cate_id = 0; // danh muc
        byte date_end_sale = 0; // ngay het han
        byte sort_id = 0; // sap xep
        String url ="";
        String sqlCondition="";
        if(request.getParameter("pages") != null) {
            pages = Integer.parseInt(request.getParameter("pages"));
        }
        if(request.getParameter("cate_id") != null) {
            cate_id = Byte.parseByte(request.getParameter("cate_id"));
            sqlCondition +=sqlCondition.isEmpty()?" category_id="+cate_id:" and category_id="+cate_id;
            url +="&cate_id="+cate_id;
        }
        if(request.getParameter("date_end_sale") != null){
            date_end_sale = Byte.parseByte(request.getParameter("date_end_sale"));
            if(date_end_sale == 1){   // date_end_sale_sale is today
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale_sale = CURRENT_DATE " : " and date_end_sale_sale = CURRENT_DATE ";
            }else if(date_end_sale == 2){     // date_end_sale_sale <= 1 week
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY) " : " and date_end_sale_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY) ";
            }else if(date_end_sale == 3){    // date_end_sale_sale <= 1/2 month
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 15 DAY) " : " and date_end_sale_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 15 DAY) ";
            }else if(date_end_sale == 4) { // date_end_sale_sale <= 1 month
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY) " : " and date_end_sale_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY) ";
            }else{
                sqlCondition = sqlCondition.isEmpty()?" date_end_sale_sale > DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY) " : " and date_end_sale_sale > DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY) ";
            }
            url += "&date_end_sale="+date_end_sale;
        }
        if(request.getParameter("sort_id") !=null) {
            sort_id = Byte.parseByte(request.getParameter("sort_id"));
            url +="&sort_id="+sort_id;
            if(sort_id ==1){
                sqlCondition =" where is_sale=1 "+sqlCondition+" order by price asc";
            }else{
                sqlCondition =" where is_sale=1 "+sqlCondition+" order by price desc";
            }
        }else{
            sqlCondition =" where is_sale=1 "+sqlCondition;
        }
        // set Attribute cho request
        request.setAttribute("pages",pages);

        request.setAttribute("type_page","shopping-sale");
        request.setAttribute("cate_id",cate_id);
        request.setAttribute("sort_id",sort_id);
        request.setAttribute("date_end_sale", date_end_sale);
        request.setAttribute("url",url);
        request.setAttribute("numOfItemLoad",20);
        request.setAttribute("direct_to","user_page/product-discount.jsp");
        request.setAttribute("sql","select * from product "+sqlCondition);
        request.setAttribute("sumOfItems_sql","select count(*) from product "+sqlCondition);

    }
}
