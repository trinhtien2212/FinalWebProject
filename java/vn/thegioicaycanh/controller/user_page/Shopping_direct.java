package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Shopping_direct", urlPatterns = "/shopping")
public class Shopping_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleParameter(request);

        request.setAttribute("page_menu","shopping");
        request.setAttribute("title","Mua sắm");
        request.setAttribute("home_page_data",new Home_page());
        request.setAttribute("new_pros",ProductEntity.loadNewProducts(9));

        List<Product> np = (List<Product>)request.getAttribute("new_pros");
        System.out.println(np.size());

        request.getRequestDispatcher("handlePagination").forward(request,response);
    }
    private void handleParameter(HttpServletRequest request){
        int max_price = ProductEntity.loadMax_MinPrice("select max(price) from product")/1000;
        int min_price = ProductEntity.loadMax_MinPrice("select min(price) from product")/1000;
        int pages = 1;
        byte cate_id = 0;
        byte type_view = 1;
        int price_min = min_price ;
        int price_max = max_price;
        byte type_size = 0;
        byte sort_id = 0;
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
        if(request.getParameter("type_view") != null) {
            type_view = Byte.parseByte(request.getParameter("type_view"));
            url +="&type_view="+type_view;
        }
        if(request.getParameter("price_min") != null) {
            price_min = Integer.parseInt(request.getParameter("price_min"));
            sqlCondition +=sqlCondition.isEmpty()?" price between "+(price_min*1000):" and price between "+(price_min*1000);
            url += "&price_min=" + price_min;
        }
        if(request.getParameter("price_max") != null) {
            price_max = Integer.parseInt(request.getParameter("price_max"));
            url +="&price_max="+price_max;
            sqlCondition +=sqlCondition.isEmpty()?" "+(price_max*1000):" and "+(price_max*1000);
        }
        if (request.getParameter("type_size") != null) {
            type_size = Byte.parseByte(request.getParameter("type_size"));
            url += "&type_size=" + type_size;
            sqlCondition +=sqlCondition.isEmpty()?" type_weight="+type_size:" and type_weight="+type_size;
        }
        if(request.getParameter("sort_id") !=null) {
            sort_id = Byte.parseByte(request.getParameter("sort_id"));
            url +="&sort_id="+sort_id;
            if(sort_id ==1 ){
                sqlCondition =sqlCondition.isEmpty()?" order by date_created desc":" where "+sqlCondition+" order by date_created desc";
            }else if(sort_id ==2){
                sqlCondition =sqlCondition.isEmpty()?" order by price asc":" where "+sqlCondition+" order by price asc";
            }else{
                sqlCondition =sqlCondition.isEmpty()?" order by price desc":" where "+sqlCondition+" order by price desc";
            }
        }else{
            sqlCondition =sqlCondition.isEmpty()?"":" where "+sqlCondition;
        }
        request.setAttribute("pages",pages);
        request.setAttribute("type_page","shopping");
        request.setAttribute("cate_id",cate_id);
        request.setAttribute("type_view",type_view);
        request.setAttribute("price_min",price_min);
        request.setAttribute("price_max",price_max);
        request.setAttribute("type_size",type_size);
        request.setAttribute("sort_id",sort_id);
        request.setAttribute("url",url);
        if(type_view == 1){
            request.setAttribute("numOfItemLoad",18);
            request.setAttribute("direct_to","user_page/shopping-grid.jsp");
        }else if(type_view == 2){
            request.setAttribute("numOfItemLoad",10);
            request.setAttribute("direct_to","user_page/shopping-list.jsp");
        }
        request.setAttribute("sql","select * from product "+sqlCondition+" limit ");
        request.setAttribute("sumOfItems_sql","select count(*) from product "+sqlCondition);
        Map<Integer,String>map =new HashMap<Integer, String>();
        map.put(1,"Rất nhỏ");
        map.put(2,"Nhỏ");
        map.put(3,"Lớn");
        map.put(4,"Rất lớn");
        request.setAttribute("type_weight_map",map);
        request.setAttribute("max_price",max_price);
        request.setAttribute("min_price",min_price);
    }

}
